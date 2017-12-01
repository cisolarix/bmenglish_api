const environment = require('./environment')

console.log(environment.toWebpackConfig())

module.exports = environment.toWebpackConfig()
