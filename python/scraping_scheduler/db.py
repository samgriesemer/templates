import psycopg2 as pg
from psycopg2.extras import execute_values
import datetime, time
import pytz

# time settings
est = pytz.timezone('US/Eastern')

# execute table insertion, write to file on error
def execute(conn, sql, insert):
  try:
    cur = conn.cursor()
    execute_values(cur, sql, insert)
    conn.commit()
  except Exception as e:
    with open('error.txt', 'a') as f:
      f.write('Rollback occurring, error {}'.format(e))
    conn.rollback()
  finally:
    cur.close()

# take fetch result, parse data, insert into db
def example_handler(conn, res):
  insert = []
  data = res['data']
  for datum in data:
    insert.append([
      datum['property1'],
      datum['property2'],
      datum['property3'],
      datetime.datetime.utcnow().replace(microsecond=0).isoformat(),
    ])

  # insertion query with updated time on conflict
  sql = '''INSERT INTO table VALUES %s
        ON CONFLICT (pk1, pk2) 
        DO UPDATE SET query_time = EXCLUDED.query_time'''

  # attempt to commit changes
  execute(conn, sql, insert)