'use strict';

const publicDir = 'app';

const express = require('express');

// Constants
const PORT = 5000;

// App
const app = express();

// Initialize the view engine
app.set('view engine', 'pug');
app.set('views', './views');

// Serve dynamic content
app.get('/', function (req, res) {
  res.render('index', {title: 'Lunch Book', message: 'Lunch Book'});
});

// Serve static content
app.use(express.static(publicDir));

app.listen(PORT);
console.log("Running on http://localhost:" + PORT);
