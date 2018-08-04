exports.index = function(req, res) {
  res.render('index', { title: 'Winogrono-web' })
}

exports.login = function(req, res) {
	res.render('login', { title: 'Winogrono-web Login'})
}
