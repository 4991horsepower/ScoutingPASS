const express = require('express')
const bodyParser = require('body-parser')
const path = require('path');
const app = express()
const db = require('./db')
const port = process.env.PORT
app.use(bodyParser.json())
app.use('/resources', express.static(path.join(__dirname, 'resources')))
app.use('/2023', express.static(path.join(__dirname, '2023')))
app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '/index.html'));
});
app.get('/matches', db.getMatches)
app.post('/savematch', db.saveMatch)
app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})