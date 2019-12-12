# async libs
import asyncio
import threading
from aiohttp import ClientSession

# normal libs
import time
import logging

async def get(url):
  async with ClientSession() as session:
    async with session.get(url) as response:
      return await response.json()

async def schedule(url, interval, callback, conn, thread=None):
  start = time.time()
  response = await asyncio.ensure_future(get(url))

  if thread is not None and thread.is_alive():
    with open('error.txt', 'a') as f:
      f.write('Overlapping thread. Joining main thread and waiting until completion.')
    thread.join()

  thread = threading.Thread(target=callback, args=(conn,response,))
  thread.start()

  end = time.time()
  await asyncio.sleep(interval-(end-start))
  return thread

async def scheduler(url, interval, callback, conn):
  # set up logging
  logging.basicConfig(filename='error.log')
  logger = logging.getLogger(__name__)

  thread = None
  print('Starting scheduler')
  while True:
    try:
      thread = await schedule(url, interval, callback, conn, thread)
    except Exception:
      logger.exception('Fatal error in main loop. Restarting after 5 seconds')
      await asyncio.sleep(5)
