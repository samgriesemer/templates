import asyncio
import psycopg2 as pg

# stream libs
from utils import db
from utils import processing
from utils import scheduling

# get tasks from db
conn = db.connect()
tasks = db.getter(conn, 'SELECT * FROM tasks WHERE target!=\'stocks_intraday\';')

# form async events
events = []
for task in tasks:
  url = task['url']
  interval = task['interval']
  callback = processing.fmap[task['target']]
  params = task['params'] if task['params'] else {}
  iter_params = task['iter']
  if iter_params:
    for itp in iter_params:
      events.append(scheduling.scheduler(url.format(**params, **itp), interval, callback, conn))
  else:
    events.append(scheduling.scheduler(url.format(**params), interval, callback, conn))

# async event loop
loop = asyncio.get_event_loop()
loop.run_until_complete(asyncio.gather(*events))