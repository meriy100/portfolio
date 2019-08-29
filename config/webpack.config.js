const path = require('path');
// const HtmlWebpackPlugin = require('html-webpack-plugin');
const MODE = process.env.NODE_ENV || "development";
const enabledSourceMap = MODE === "development";

module.exports = {
  mode: 'development',
  entry: './src/app.js',
  module: {
    rules: [
      {
        test: /(\.css|\.scss)/,
        use: [
          "style-loader",
          {
            loader: "css-loader",
            options: {
              url: false,
              sourceMap: enabledSourceMap,
              importLoaders: 2
            }
          },
          {
            loader: "sass-loader",
            options: {
              sourceMap: enabledSourceMap
            }
          }
        ]
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: {
          loader: 'elm-webpack-loader',
          options: {
          }
        }
      }
    ]
  },
  output: {
    // filename: MODE !== 'production' ? 'app.js' : 'app.[contentHash].js',
    filename: 'app.js',
    path: path.join(__dirname, '../public')
  },
  devServer: {
    historyApiFallback: true
  }
  // plugins: (
  //     // MODE !== 'production' ? [] : [ new HtmlWebpackPlugin({title: 'Revision control'})]
  // )
};

if (MODE !== 'production') {
    module.exports.devtool = 'inline-source-map';
}
