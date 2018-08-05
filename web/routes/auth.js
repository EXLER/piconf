var router = require('express').Router();

// Authentication
router.get('/login', function (req, res) {
    res.render('login', { title: 'Winogrono-web Login' });
});

// Logout
router.get('/logout', function (req, res) {
    // Handle with Passport
    res.send('Logging out.');
});

module.exports = router;