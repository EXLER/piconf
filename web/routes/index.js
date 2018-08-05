var crypto = require('crypto');

exports.index = function(req, res) {
  res.render('index', { title: 'Winogrono-web' })
}

exports.login = function(req, res) {
	res.render('login', { title: 'Winogrono-web Login' })
}

function hashPassword(password, salt) {
	var hash = crypto.createHash('sha256')
	hash.update(password);
	hash.update(salt);
	return hash.digest('hex');
}