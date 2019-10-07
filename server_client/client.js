// default get request
let url = 'http://localhost:5000/get';
fetch(url, {
  method:'GET',
  credentials: 'include' // to include cookies across domains
}).then(response => {
  return Promise.all([response, response.json()]);
}).then(([response, body]) => {
  if (response.ok) {
    return body;
  }
  if (body.message != null) {
    throw Error(body.message);
  } else {
    throw Error(response.statusText);
  }
}).then(data => {
  console.log(data);
}).catch(error => {
  console.log(error.message);
});

// default post request
body = {
  'data': 'default text'
}

let url = 'http://localhost:5000/post';
fetch(url, {
  method: 'POST',
  body: JSON.stringify(body),
  credentials: 'same-origin',
  credentials: 'include', // to include cookies across domains
  headers: {
    'Content-Type': 'application/json'
  }
}).then(response => {
  return Promise.all([response, response.json()]);
}).then(([response, body]) => {
  if (response.ok) {
    return body;
  }
  if (body.message != null) {
    throw Error(body.message);
  } else {
    throw Error(response.statusText);
  }
}).then(data => {
  console.log(data);
}).catch(error => {
  console.log(error.message);
});