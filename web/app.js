var path = require('path');
var crypto = require('crypto');

var httpErrors = require('http-errors');
var express = require('express');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var sassMiddleware = require('node-sass-middleware');
var dotenv = require('dotenv').config();
var sqlite3 = require('sqlite3').verbose();
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;

var authRoutes = require('./routes/auth');

var app = express();

// View engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(session({
    secret: process.env.SECRET,
    saveUninitialized: true,
    resave: true
}));
app.use(cookieParser());
app.use(sassMiddleware({
    src: path.join(__dirname, 'public'),
    dest: path.join(__dirname, 'public'),
    indentedSyntax: false, // true = .sass and false = .scss
    sourceMap: true
}));
app.use(express.static(path.join(__dirname, 'public')));

// Database connection
var db = new sqlite3.Database(process.env.DB_NAME);

// Routing
app.get('/', function (req, res) {
    res.render('index', { title: 'Winogrono-web' });
});
app.use('/auth', authRoutes);

// Catch 404 and forward to error handler
app.use(function (req, res, next) {
    next(httpErrors(404));
});

// Error handler
app.use(function (err, req, res, next) {
    // Set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // Render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;