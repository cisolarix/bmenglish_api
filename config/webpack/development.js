

// const merge = require('webpack-merge')
const environment = require('./environment')
// const customConfig = require('./custom.config')

// const mergedConfig = merge(customConfig, environment.toWebpackConfig())

// console.log(mergedConfig.module.rules)
// console.log('--------------------------')
// console.log(environment)
// console.log('--------------------------')

// module.exports = merge(environment.toWebpackConfig(), customConfig)
module.exports = environment.toWebpackConfig()