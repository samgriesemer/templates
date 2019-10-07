from flask import Flask, Response, jsonify, request, session

app = Flask(__name__)
app.secret_key = b'\xf6\xa2n\xac\xe6\xc3U\xb9\xfa7\xd7\x9d\xb9\x1e\xad\x15'

@app.route('/get', methods=['GET'])
def get():
  # default get request, ie get data from database

  # set a session attribute
  if session.get('data') is None:
    session['data'] = 'text'

  # check origin of request
  #print(request.environ['HTTP_ORIGIN'])
  return jsonify(session['data'])

@app.route('/post', methods=['POST'])
def post():
  # get data from post
  post = request.get_json()

  # handle post data
  try:
    data = str(post['data'])
  except ValueError:
    msg = 'Invalid string.'
    return error(400, msg)

  # update session data
  session['data'] = data
  return jsonify(session['data'])

def error(code, message):
  response = jsonify({'message':message})
  response.status_code = code
  return response

@app.after_request
def after_request(response):
  response.headers.add('Access-Control-Allow-Origin', '*')
  response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
  response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
  response.headers.add('Access-Control-Allow-Credentials', 'true')
  return response

if __name__ == '__main__':
  app.run(host='0.0.0.0')