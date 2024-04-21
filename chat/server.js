const express = require('express');
const app = express();
const http = require('http').createServer(app);
const io = require('socket.io')(http);

app.all('*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "http://localhost:3000"); // Replace with your actual frontend domain
  res.header("Access-Control-Allow-Headers", "Content-Type");
  res.header("Access-Control-Allow-Methods", "GET,POST,OPTIONS");
  next();
});

// Your socket.io connection logic here

http.listen(3001, function(){
  console.log('listening on *:3001');
});