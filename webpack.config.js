var webpack = require('webpack');

module.exports = {
  entry: './app/index.js',
  output: {
    path: './public',
    filename: 'bundle.js',
  },
  devServer: {
    contentBase: 'public/',
    // 'host' is needed to make sure the webpack-dev-server is exposed outside
    // the container
    host: '0.0.0.0',
    inline: true,
    port: 3000,
    headers: { 'Access-Control-Allow-Origin': '*'},
    disableHostCheck: true,
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel',
        query: {
          presets: [
            [
              'env',
              {
                "targets": {
                  "node": "current",
                },
              },
            ], 
            'react',
          ],
        },
      },
    ]
  }
}
