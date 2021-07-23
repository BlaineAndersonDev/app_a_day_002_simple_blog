# App A Day
### 002 - Simple Blog (The Re-Iterating)

## [Step 1](#app-creation-route-generation) | App Creation, Gemfile Updates & Route Generation.
  ### **Generate a new Rails Project:**
  * `rails new simple_blog -t -d postgresql -b`
      * `-t` disallows test autogeneration.
      * `-d` requires a different database than the default MySQL (I specified postgresql).
      * `-b` disallows the automatic bundle
        * A complete list of options can be seen by using `rails new --help`.
  * We also need to get our code on Github:
    * Make Github Repo & connect it: `git remote add origin <URL>`.
    * Mak sure you push up regularly, it's good practice!
  * **Commit 'Boilerplate' and Push to Github**

  ### **Update Gemfile:**
  * We will be using the `Faker` gem for our database seeding.
  * Add `gem 'faker'` under the Development & Test section in the Gemfile. I.E.
    ```
    group :development, :test do
      gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
      gem 'faker'
    end
    ```
  * Gemfile should look like the following with possible different version numbers:
    ```
    source 'https://rubygems.org'
    git_source(:github) { |repo| "https://github.com/#{repo}.git" }

    ruby '2.7.0'

    gem 'rails', '~> 6.0.4'
    gem 'pg', '>= 0.18', '< 2.0'
    gem 'puma', '~> 4.1'
    gem 'sass-rails', '>= 6'
    gem 'webpacker', '~> 4.0'
    gem 'turbolinks', '~> 5'
    gem 'jbuilder', '~> 2.7'
    gem 'bootsnap', '>= 1.4.2', require: false

    group :development, :test do
      gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
      gem 'faker'
    end

    group :development do
      gem 'web-console', '>= 3.3.0'
      gem 'listen', '~> 3.2'
      gem 'spring'
      gem 'spring-watcher-listen', '~> 2.0.0'
    end

    group :test do
      gem 'capybara', '>= 2.15'
      gem 'selenium-webdriver'
      gem 'webdrivers'
    end

    gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

    ```
  * **Commit 'Update Gemfile' and Push to Github**

  ### **Generate Routes:**
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 
  * 