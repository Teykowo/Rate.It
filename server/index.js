// Import dependencies.
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

// Connect to mysql database.
const SQL_DB = mysql.createPool({
    host: 'mysql_db', // Host name, usually localhost.
    user: 'rate_it', // Database user name.
    password: '158!msp@f8985', // Database user password.
    database: 'rate_it_db' // Database name.
});

// We use express to create the API, connecting front and back ends.
const APP = express();
// Conventionnaly, the port 3000 is used for express.
const PORT = 3000;

// We use CORS, (Cross-Origin Resource Sharing) to safely accept data from other origins than this website, which happens when using an Express API.
APP.use(cors());
// We need to use the express middleware to use json to parse POST requests. 
// (I have read that it isn't nescessary to define using both json and urlencoded middleware but most people do it to be concise).
APP.use(express.json());
// Forms requests are encoded using percent-encoding and we need to configure a middleware to process this data. The argument given to the urlencoded function
// defines whether to treat the content of the request purely as strings or if can encode arrays and such for "a more JSON-like experience".
APP.use(express.urlencoded({extended: true}))

// In HTTP data can be sent to the back-end in multiple ways, two of which being via the url with GET or via a form with POST.
// The http GET method reads the url to get data, while the POST method reads from a form.
// the get function takes two arguments: the first is a regex, if it matches the current url, the second argument, an arrow function which itself takes two arguments is called.
// Both those arguments are objects. "Request" containes the data gathered from the html method, in our case, from the url, 
// meanwhile "Reponse" sends data from the back-end to the front-end, such as when we load a html file to render a page.
APP.get('/', (request, response) => {
    response.send("Rate It")
});

/* ↓ Test Purposes ↓ */
// Ressources fight over the use of PUT and POST (https://blog.engineering.publicissapient.fr/2014/03/17/post-vs-put-la-confusion/, https://stackoverflow.com/questions/630453/what-is-the-difference-between-post-and-put-in-http)
// I'll will use post for inserting non unique entries such as images and templates, and PUT for modifying existing entries, as well as adding unique ones like users and genres.

APP.get('/get', (request, response) => {
    const SELECT_QUERRY = 'SELECT * FROM genres';
    SQL_DB.query(SELECT_QUERRY, (err, result) => {
        if (err){
            console.log(err);
        };
        response.send(result)
    });
});

APP.post('/insert', (request, response) => {
    const GENRE_NAME = request.body.genreName;
    const INSERT_QUERY = 'INSERT INTO genres VALUES (?)';
    SQL_DB.query(INSERT_QUERY, [GENRE_NAME], (err, result) => {
        if (err){
            console.log(err);
        };
        response.send(result)
    });
});

APP.delete('/delete/:genreId', (request, response) => {
    const GENRE_ID = request.body.genreId;
    const DELETE_QUERY = 'DELETE FROM genres WHERE id = ?';
    SQL_DB(DELETE_QUERY, GENRE_ID, (err, result) => {
        if (err){
            console.log(err);
        };
        response.send(result)
    });
});

APP.put("/update/:genreId", (request, response) => {
    const GENRE_NEW_NAME = request.body.genreNewName;
    const GENRE_ID = request.params.genreId;
    const UPDATE_QUERY = 'UPDATE genres SET name = ? WHERE id = ?';
    db.query(UPDATE_QUERY, [GENRE_NEW_NAME, GENRE_ID], (err, result) => {
        if (err){
            console.log(err);
        };
        response.send(result)
    });
});
/* ↑ Will be turned into practical functions in another file ↑*/

// Let the app liston on attempted connection to the defined port.
APP.listen(PORT, () => {})