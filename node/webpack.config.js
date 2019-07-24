const path = require('path');
const uglifyJsPlugin = require('uglifyjs-webpack-plugin');

module.exports = {
    // Chosen mode tells webpack to use its built-in optimizations accordingly.
    mode: 'development',

    // Here the application starts executing
    // and webpack starts bundling
    entry: {
        AdminDashboard: './src/Jsx/AdminDashboard.jsx',
        CandidateDashboard: './src/es6/CandidateDashboard.es6',
        Global: './src/es6/Global.es6',
        Pagination: './src/es6/Pagination.es6',
        JobOpening: './src/es6/JobOpening.es6',
        AddCandidate: './src/es6/AddCandidate.es6',
        CandidateProfile: './src/es6/CandidateProfile.es6',
    },

    // the target directory for all output files
    output: {
        path: path.resolve(__dirname, '../public/assets/js/build')
    },

    // configuration regarding modules
    module: {
        // rules for modules (configure loaders, parser options, etc.)
        rules: [
            {
                test: /\.(js|jsx)$/,
                exclude: /(node_modules|bower_components)/,
                use: {
                    // options for the loader
                    loader: 'babel-loader',
                }
            }
        ]
    },
    resolve: {
        alias: {
            modules: path.resolve(__dirname + '../node_modules')
        },
        extensions: ['.es6', '.js', '.jsx']
    },
    plugins: [
        new uglifyJsPlugin()
    ],
    stats: {
        colors: true
    }
};