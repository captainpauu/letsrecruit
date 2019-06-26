const path = require('path');


module.exports = {
    // Chosen mode tells webpack to use its built-in optimizations accordingly.
    mode: 'development',

    // Here the application starts executing
    // and webpack starts bundling
    entry: {
        CandidateDashboard: './src/es6/CandidateDashboard.es6',
        Global: './src/es6/Global.es6',
        Pagination: './src/es6/Pagination.es6',
        JobOpening: './src/es6/JobOpening.es6',
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
                test: /\.m?js$/,
                exclude: /(node_modules|bower_components)/,
                use: {
                    // options for the loader
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env']
                    }
                }
            }
        ]
    },
    resolve: {
        alias: {
            modules: path.resolve(__dirname + '../node_modules')
        },
        extensions: ['.es6', '.js', '.jsx']
    }
};