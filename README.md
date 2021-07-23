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
    * This will create a database table called `articles` with the attributes `title, author & text` at `db/migrate/##############_create_articles.rb` (The `#` symbols will be a datetime).
  #### **Additional Model Information:**
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
        * Used conventionally for Usernames, Emails, Passwords.
        * [Ex: `Username` | Max_Chars: `255`]
      * **:text**
        * Used conventionally for Descriptions, Articles, Posts.
        * [Ex: `Very long description...` | Max_Chars: `21,844`]
      * **:time**
        * Used for Time.
        * [Format: `hh:mm:ss` | Ex: `10:59:59`]
      * **:timestamp**
        * Used for Timestamps. Automatically adds `created_at` & `updated_at`.
        * [Format: `YYYY-MM-DD hh:mm:ss` | Ex: `'1970-01-01 00:00:00' UTC`]
  
  ### **Database Migration & Seeding:**
  > Once the Model is generated it automatically has a "Migration" pending. A "Migration" is our Model being created in the Database. Once the "Migration is done, we have a functional, but empty database. At that point we can create fake information to use while developing in a practical way.
  * Let's Migrate our Model to our Database in terminal using: `rails db:migrate`.
    * Provided it was successful you should see something like this:
      ```
      == 20210723194844 CreateArticles: migrating ===================================
      -- create_table(:articles)
        -> 0.0101s
      == 20210723194844 CreateArticles: migrated (0.0102s) ==========================
      ```
  * Now that is's Migrated to the Database, let's fill it with some fake information using that `Faker` gem we bundled earlier so we can physically see it in our Views later on!
    * Open `db/seeds.rb` and paste in the following:
      ```
      require 'faker'

      6.times do |i|
        Article.create(
          title: Faker::Hipster.word, 
          author: Faker::Name.name, 
          text: Faker::Hipster.paragraph(sentence_count: 3)
        )
      end
      ```
    * Now we can generate fake information in the Terminal using: `rails db:seed`.
      * *There is no confirmation that the seeding is complete in Terminal, so as long as it does not produce an error, you are good to go.*
      * *If you want to check out the database from Terminal you can open the Rails Console with `rails c` and use the command `Article.all` to see what was generated. To quit the Rails Console use `quit`.*
    
  ### **Generate the Controller:**
  > Controllers are the brains of the CRUD App operation, allowing you to define what each method (endpoint) does. A CRUD App implies that it will allow a user to 'Create', 'Read', 'Update', & 'Destroy' data in our database.
  * Let's generate our Controller. In Terminal run `rails generate controller Articles`.
    * *Note: When generating a controller, make sure you define it as **Capitilized** and **Plurel**.*
    * This command will automatically generate:
      * A Stylesheet (SCSS): `app/assets/stylesheets/articles.scss`
      * A Controller: `app/controllers/articles_controller.rb`
      * A Helper file: `app/helpers/articles_helper.rb`
      * & A Test file: `test/controllers/articles_controller_test.rb`
    * While these are all useful files, the only one we want to work with for now is the `articles_controller.rb`, so go ahead and open that file. 

  ### **Index: View & Endpoint**
  > The Index is something like the "home" page. This usually shows all Articles and allows a user to Open, Create, Edit or Destroy an Article.
  * Inside the Article Controller (`app/controllers/articles_controller.rb`) let's make the **Index** endpoint:
    ```
    class ArticlesController < ApplicationController
      def index 
        @articles = Article.all
      end
    end
    ```
    * Technical Information:
      * `@articles` is an instance variable, which means we can fill it with information and pass a it as an object to our associated Index View. These are defined by the `@`.
      * `Article.all` communicates with out database and asks it for all the Articles we have saved to be put into our `@articles` instance variable (which is currenly none).
  * **Now we need to create our View.**
  * In Terminal use: `touch app/views/articles/index.html.erb`, then open and paste in the following:
    ```
    <h1>The <strong>Big List</strong> of all Articles</h1>

    <table>
      <tr>
        <th>Title</th>
        <th>Author</th>
        <th>Text</th>
        <th>Created At</th>
      </tr>

      <% @articles.each do |article| %>
        <tr>
          <th><%= article.title %></th>
          <th><%= article.author %></th>
          <th><%= article.text %></th>
          <th><%= article.created_at %></th>
          <th><%= link_to "Show", article_path(article) %></th>
          <th><%= link_to "Edit", edit_article_path(article) %></th>
          <th><%= link_to "Destroy", article_path(article), method: :delete, data: {confirm: "Are you sure?" } %></th>
        </tr>
      <% end %>
    </table>
    ```
      * Technical Information:
        * The Show, Edit, and Destroy buttons wont do anything at the moment, but they will later on.
    * To see our new Index page in action, run the server with `rails s` and navigate in your browser to `http://localhost:3000/articles`.
  
  ### **Show: View & Endpoint**
  > The Show page is for displaying an individual piece of data to the User. This is achieved by using the Controller to search for an return a specific Article, usually by the Article's ID.
  * Inside the Article Controller (`app/controllers/articles_controller.rb`) let's make the **Show** endpoint:
    ```
    class ArticlesController < ApplicationController
      ...
      def show
        @article = Article.find(params[:id])
      end
    end
    ```
    * Technical Information:
      * Instead of `@articles` we are using the singular version: `@article`. It is exactly the same as before, but convention requires we make it singular since we are dealing with a single Article instead of multiple.
      * `Article.find(params[:id])` also uses Active Record to communicate with our database, asking it for a specific Article with the `id` we provide via the Index View. 
        * In our Index View we have the line: `<%= link_to "Show", article_path(article) %>`.
        * This is broken down into Rails convention, specifically we use `link_to` to generate a link directly to that specific Article. `article_path(article)` is the Rails convention (and automatic) way of saying this is a Show Route, and will automatically send a user who clicks on it to the Show View displaying that specific Article.
  * **Now we need to create our View.**
  * In Terminal use: `touch app/views/articles/show.html.erb`, then open and paste in the following:
    ```
    <h1>Show Page</h1>

    <p>
      <strong>Title:</strong>
      <%= @article.title %>
    </p>

    <p>
      <strong>Author:</strong>
      <%= @article.author %>
    </p>

    <p>
      <strong>Text:</strong>
      <%= @article.text %>
    </p>

    <p>
      <strong>Time:</strong>
      <%= @article.created_at %>
    </p>
    ```
    * To see any of our new Show pages in action, run the server with `rails s` and navigate in your browser to `http://localhost:3000/articles` and click on the Show button for any Article.

















      * **New**
        > When a User chooses to create a new Article, they open the "New" view, which is almost always a form.The New endpoint in our controller is called before they see the form and creates an empty instance variable that a User fills up. When the user is done, they will press a "Submit" button send it to the Create endpoint.
        * 
          ```
          #Creates `@article`(Instance Variable) with provided information.
          #Requires all params as stated in the private method `article_params`.
          @article = Article.new(article_params)

          # If `@article` is saved into the database redirect to view `show.html.erb`.
          @article.save
          redirect_to @article
          ```
        * Terms:
          * `article_params`: 
      * **Create**
        > 
        * 
          ```
          ```
        *
      * **Show**
        > 
        * 
          ```
          ```
        * 
      * **Edit**
        > 
        * 
          ```
          ```
        * 
      * **Update**
        > 
        * 
          ```
          ```
        * 
      * **Destroy**
        > 
        * 
          ```
          ```
        * 
  * `rails generate controller Articles index new create show edit update destroy`
  * `rails destroy controller Articles index new create show edit update destroy`
  * `rails generate controller Articles`
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