import psycopg2 as pg
import psycopg2.extras

from sqlalchemy import create_engine

def connect(user='dash', password='dashisfast901', db='dash', host='localhost', port=5432):
  url = 'postgresql://{}:{}@{}:{}/{}'
  url = url.format(user, password, host, port, db)
  engine = create_engine(url)
  return engine.connect()

def execute(conn, stmt):
  return [dict(_) for _ in conn.execute(stmt)]

def execute(conn, sql, insert):
  try:
    cur = conn.cursor()
    psycopg2.extras.execute_values(cur, sql, insert)
    conn.commit()
  except Exception as e:
    with open('error.txt', 'a') as f:
      f.write('Rollback occurring, error {}'.format(e))
    conn.rollback()
  finally:
    cur.close()

def getter(conn, sql):
  cur = conn.cursor(cursor_factory=pg.extras.RealDictCursor)
  cur.execute(sql)
  return cur.fetchall()

res = conn.connect().execute(news.select())