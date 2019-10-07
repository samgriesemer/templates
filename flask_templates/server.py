from flask import Flask, Response, jsonify, request, session, render_template, url_for, redirect

app = Flask(__name__)
app.secret_key = b'\xf6\xa2n\xac\xe6\xc3U\xb9\xfa7\xd7\x9d\xb9\x1e\xad\x15'

data = {'fruit': ['apple','orange','banana']}

@app.route('/', methods=['GET'])
def index():
  return render_template('index.html', data=data)

@app.route('/test', methods=['GET'])
def test():
  data['fruit'].remove('apple')
  return redirect(url_for('index'))

if __name__ == '__main__':
  app.run(port=5000)