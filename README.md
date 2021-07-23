# App A Day
### 002 - Simple Blog (The Re-Iterating)

## [Step 1](#app-creation-gemfile-database) | App Creation, Gemfile Updates & Database Generation.
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
    * In Terminal (Or Windows Command Line) run `bundle install`
    * **Commit 'Update Gemfile' and Push to Github**
  ### **Generate our PostgreSQL Database:**
    * For the App to run properly we need a connected Database.
    * Since we are using PostgreSQL, you need to have it installed on your local machine.
      * Link to [Download](https://www.postgresql.org/download/) options.
    * Once it's installed, in Terminal (Or Windows Command Line) run `rails db:create`
      * It should return something like this:
        ```
        Created database 'simple_blog_002_development'
        Created database 'simple_blog_002_test'
        ```
      * *Useful commands are `rails db:drop` to delete a database or `rails db:reset` to drop and create the database in one command.*
  ### **Verify the Server Runs:**
    * In Terminal run `rails server`
      * *To turn off a server press CTRL+C with the terminal window selected.*

## [Step 2](#) | Routes & the MVC (Model, View, Controller).
  ### **Generate the Routes:**
  > Routes connect the application. They allow us to specify what endpoint we want to go, either To or From the View. We can also send along information (such as an instance variable).
  * Open `config/routes.rb` and add `resources :articles`:
    ```
    Rails.application.routes.draw do
      resources :articles
    end
    ```
    * *This added all 7 conventional routes used in an app, specifically: Index, New, Create, Show, Edit, Update & Destroy*
    * *We can add only specific routes if we wanted (we don't) but for posterity it would look like this:*
      ```
      resources :articles, only: [:index, :show]
      ```
      *Or
      ```
      resources :articles, except: [:create, :new, :edit, :update, :destroy]
      ```
      * *In both of these cases, we end up with only two routes: `index` & `show`.*
  
  ### **Generate the Model:**
  > Models specify a *Table* (Articles) and it's *Attributes* (Title, Author, Text). Using these we can save things to our PostgreSQL database. Rails convention is that a Rails Model Generation uses a *singular* name, and generates a *plurel* name. It's mostly automatic so you dont have to think too much about it.
  * Let's generate our Model. In Terminal run `rails generate model Article title:string author:string text:text`.
    * This will create a database table called `articles` with the attributes `title, author & text`.
    * `rails generate model <Singular_Capitalized_Model_Name> <Lowercase_Attribute_Name>:<Attribute_Type>`
      * Model names can be anything, it just needs to be Capitalized and Plurel.
      * Attribute names can also be anything, as long as its lowercase.
      * Attribute types are based on MySQL and can be one of a specific list of [options](https://www.w3schools.com/mysql/mysql_datatypes.asp), but for simplicity I use my own list:
        * **:binary**
          * Used for UUID's.                              
          * [Format: `###` | Ex: `255` | Min/Max: `0 / 255`]
        * **:boolean**
          * Used for True/False.
          * [Format: `0` | Ex: `1` | Min/Max: `0 / 1`]
        * **:date**
          * Used for Dates.
          * [Format: `YYYY-MM-DD` | Ex: `9999-12-31`]
        * **:datetime**
          * Used for Dates & Times.
          * [Format: `YYYY-MM-DD hh:mm:ss` | Ex: `9999-12-31 23:59:59`]
        * **:decimal**
          * Used for exact point fixed numbers.
          * [Format: `##.########` | Ex: `12.34567890`]
        * **:float**
          * Used for scientific numeration. Not precise.
          * [Format: `##.####` | Ex: `12.3456`]
        * **:integer**
          * Used for simple, whole numbers.
          * [Format: `#####` | Ex: `12345`]
        * **:primary_key**
          * Used for column ID. Automatically added.
          * [Format: `123` | Ex: `123`]
        * **:string**
          * Used for Usernames, Emails, Passwords.
          * [Ex: `Username` | Max_Chars: `255`]
        * **:text**
          * Used for Descriptions, Articles, Posts
          * [Ex: `Very long description...` | Max_Chars: `21,844`]
        * **:time**
          * Used for Time.
          * [Format: `hh:mm:ss` | Ex: `10:59:59`]
        * **:timestamp**
          * Used for `created_at` & `updated_at`.
          * [Format: `YYYY-MM-DD hh:mm:ss` | Ex: `'1970-01-01 00:00:00' UTC`]
  * 
    
  ### **Generate the Controller:**
  > ______________
  * 
  * 
    
  ### **Generate the Views:**
  > ______________
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