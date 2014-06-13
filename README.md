# TV Snow

A Ruby gem for compiling static sites!

## Installation

Someday, you will be able to run `$ gem install tv_snow` and have it work.
It doesn't yet.

Currently, you can install the gem by downloading it from this lovely Github
project page, entering the directory, and running

```$ rake install```

## Usage

Build your site with your favorite Ruby tools!

First, you should have the following directories in your project (but each is
optional):

* `css`, which should hold all your Sass and CSS files
* `js`, which should hold all your Coffeescript and JS files
* `img`, which should hold all your images

All of your Haml or Slim files should just be at the root of the project.
Someday, I should probably add support for directory structures. Maybe today.

Note: When you link to a stylesheet written in Sass, do not add the `scss`
ending to the file name. So linking to the styles contained in
`css/default.css.scss`, in Haml you would write:

```%link{rel: 'stylesheet', href: 'css/default.css'}```

## Contributing

1. Fork it ( https://github.com/J3RN/tv_snow/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

There is so much to do! I'm sorry for the very unfinished-ness of this app, and
would love your help!
