const elixir = require('laravel-elixir');

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(function(mix) {
    mix.scripts([
        "jquery.min.js",
	    "bootstrap.min.js",
	    "freelancer.min.js",
    ],'public/js/all.js')
    .styles([
        "bootstrap.min.css",
	    "freelancer.min.css",
	    "font-awesome.min.css",
	    "custom.css",
    ],'public/css/all.css')
    .version(['public/js/all.js','public/css/all.css']);
    mix.copy('resources/assets/fonts','public/build/fonts');
});
