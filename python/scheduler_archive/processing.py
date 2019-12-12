import psycopg2 as pg
import datetime
import pytz
import sys, inspect

# stream libs
from utils import db

# time settings
est = pytz.timezone('US/Eastern')

def news(conn, res):
  insert = []
  article_list = res['articles']
  for article in article_list:
    insert.append([
      article['title'],
      article['author'],
      article['source']['name'],
      article['description'],
      article['url'],
      article['publishedAt'],
      'top-headlines',
      '',
      datetime.datetime.utcnow().replace(microsecond=0).isoformat(),
    ])

  sql = '''INSERT INTO news VALUES %s
        ON CONFLICT (title, source) 
        DO UPDATE SET query_time = EXCLUDED.query_time'''

  # attempt to commit changes
  db.execute(conn, sql, insert)

def weather(conn, res):
  data = res['currently']
  insert = []
  insert.append([
    datetime.datetime.utcnow().replace(microsecond=0).isoformat(),
    data['summary'],
    data['temperature'],
    data['apparentTemperature'],
    data['precipType'] if 'precipType' in data else None,
    data['precipProbability'],
    data['humidity'],
    data['pressure'],
    data['windSpeed'],
  ])

  sql = 'INSERT INTO weather VALUES %s'

  # attempt to commit changes
  db.execute(conn, sql, insert)

def crypto(conn, res):
  data = res['RAW']
  insert = []
  for key in data.keys():
    asset = data[key]['USD']
    insert.append([
      datetime.datetime.utcnow().replace(microsecond=0).isoformat(),
      asset['FROMSYMBOL'],
      asset['PRICE'],
      asset['MKTCAP'],
      asset['TOTALVOLUME24HTO'],
      asset['CHANGE24HOUR'],
      asset['CHANGEPCT24HOUR'],
    ])

  sql = 'INSERT INTO crypto VALUES %s'

  # attempt to commit changes
  db.execute(conn, sql, insert)

def stocks_depracated(conn, res):
  insert = []
  for symbol in res.keys():
    chart = res[symbol]['chart']

    for item in chart:
      # process time
      dstr = item['date']+item['minute']
      pdt = datetime.datetime.strptime(dstr,'%Y%m%d%H:%M')
      pdt = est.localize(pdt).astimezone(pytz.utc)

      insert.append([
        symbol.lower(),
        item['open'] if 'open' in item else None,
        item['close'] if 'close' in item else None,
        item['high'] if 'high' in item else None,
        item['low'] if 'low' in item else None,
        item['volume'],
        pdt,
      ])

  sql = '''INSERT INTO stocks VALUES %s
        ON CONFLICT DO NOTHING'''

  # attempt to commit changes
  db.execute(conn, sql, insert)

def stocks_intraday(conn, res):
  insert = []
  print(res)
  symbol = res['Meta Data']['2. Symbol']
  series = res['Time Series (1min)']

  for (dstr, data) in series.items():
    pdt = datetime.datetime.strptime(dstr,'%Y-%m-%d %H:%M:%S')
    pdt = est.localize(pdt).astimezone(pytz.utc)

    insert.append([
      symbol.upper(),
      pdt,
      data['1. open'],
      data['2. high'],
      data['3. low'],
      data['4. close'],
      data['5. volume'],
    ])

  sql = '''INSERT INTO stocks VALUES %s
        ON CONFLICT DO NOTHING'''

  # attempt to commit changes
  db.execute(conn, sql, insert)

# generate name-function map
fmap = dict(inspect.getmembers(sys.modules[__name__], inspect.isfunction))
