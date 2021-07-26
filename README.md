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
  > The Index Endpoint & View is something like the "home" page. This usually shows all Articles and allows a user to Open, Create, Edit or Destroy an Article.
  * **Endpoint**
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
  * **View**
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
  * **Check it out**
    * To see our new Index page in action, run the server with `rails s` and navigate in your browser to `http://localhost:3000/articles`.
  
  ### **Show: View & Endpoint**
  > The Show Endpoint & View is for displaying an individual piece of data to the User. This is achieved by using the Controller to search for and to return a specific Article, usually by the Article's ID.
  * **Endpoint**
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
  * **View**
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
  * **Check it out**
    * To see any of our new Show pages in action, run the server with `rails s` and navigate in your browser to `http://localhost:3000/articles` and click on the Show button for any Article.

  ### **New: View & Endpoint**
  > The New Endpoint creates a 'new' instance variable, which is sent to the Edit View. This object is manipulated by the User via a form, and when submitted, is sent to the Create Endpoint to generate a new Database entry.
  * **Endpoint**
    * Inside the Article Controller (`app/controllers/articles_controller.rb`) let's make the **New** endpoint:
      ```
      class ArticlesController < ApplicationController
        ...
        def new 
          @article = Article.new
        end
      end
      ```
      * Technical Information:
        * `Article.new` creates an unsaved Article Object that we can allow the user to fill using a form.
  * **View**
    * Because we will be reusing our input form for both the "New" and "Edit" Views, we'll be making a Rails Partial (which is fancy for saying we will make a bit of reusable code).
    * First, lets make the Form itself:
      * Partials are specified by added an underscore to the beginning of the filename, so let's make one:
      * In Terminal use: `touch app/views/articles/_form.html.erb`, then open and paste in the following:
        ```
        <%= form_with model: @article do |f| %>

          <p>
            <%= f.label :title %><br>
            <%= f.text_field :title %>
          </p>

          <p>
            <%= f.label :author %><br>
            <%= f.text_field :author %>
          </p>

          <p>
            <%= f.label :text %><br>
            <%= f.text_field :text %>
          </p>

          <p>
            <%= f.submit %>
          </p>

        <% end %>
        ```
        * Technical Information:
          * `form_with model: @article do |f|`
            * `form_with` is the current conventional way to create Rails-ified forms. Depreciated (but still funcationl) form options include `form_tag` and `form_for`. That being said, `form_with` is the simplest implementation.
            * The model is the only thing that needs to be specified (`model: @article`) which allows Rails to automagically generate the proper path for "New" and "Edit" Endpoints. 
    * Now let's make the actual View:
      * In Terminal use: `touch app/views/articles/new.html.erb`, then open and paste in the following:
        ```
        <h1>New Article<h1>
        <%= render "form" %>
        ```
        * Technical Information:
          * Our file is named `_form.html.erb` but we only said to render `form`? Whats going on?
          * Don't worry! Rails is smart only needs the name of the View we want to render. It also doesnt need the underscore included because this is such a normal occourance. Keeping it simple is the Rails way!
  * **Check it out**
    * While we can't actually save anything without the "Create" endpoint, we can still check out the form we'll be using shortly at `http://localhost:3000/articles/new`.

  ### **Create: View & Endpoint**
  > The Create Endpoint & View intake the Users provided information from the "New" View and proceed to generate a new database entry. Once complete, the "Create" endpoint send the User to the "Show" view to see their "Created" database entry.
  * **Endpoint**
    * Inside the Article Controller (`app/controllers/articles_controller.rb`) let's make the **Create** endpoint:
      ```
      class ArticlesController < ApplicationController
        ...
        def create 
          @article = Article.new(article_params)
          @article.save
          redirect_to @article
        end
      end
      ```
      * Technical Information:
        * Like the "New" endpoint, we have `Article.new`. Unlike it however, is the attached `(article_params)` which we'll get to in a moment.
          * `@article.save` attempts to save the `@article` instance variable to our database. On failure, it will error out, but on success it will redirect the User (`redirect_to @article`) to the "Show" View for the created article.
          * Back to the `article_params`, which refers to a specific set of allowed and/or required parameters that we specify in the controller under a special section called `private`. Let's do that now:
  * **Private Method**
    * The `private` keyword in our controller says that only the actual endpoints can access it. No outside interation at all. This helps keep our backend safe and provides a way for us to verify what information we allow to be saved to our database.
    * The `private` methods section should be at the bottom of the Controller, just before the final `end`. Additionally, all methods below this should be indented. Paste in the following:
      ```
      private
        def article_params 
          params.require(:article).permit(:title, :author, :text)
        end
      ```
      * The line `params.require(:article).permit(:title, :author, :text)` *requires* that we recieve an object containing a `title`, `author` and `text` attribute intended for the `article` Model.
        * Don't worry too much if this feels overwhelming, as long as you include all the attributes here that you added to your model, it will work just fine.
  * **View**
    * The "Create" Endpoint does not use a View. As soon as the information has been input into our database the user is sent to the "Show" view we created earlier with the Article they just created as the instance variable (`@article`).
  * **Check it out**
    * Now we can go to `http://localhost:3000/articles/new`, fill it out, submit it and we'll be taken to a show page featuring the new Article. Give it a shot!
    * After creating an Article, you can also see it in the list of all Articles at `http://localhost:3000/articles`.

  ### **Edit: View & Endpoint**
  > The Edit Endpoint & View is similiar to our "New" Endpoint and View, but allows a User to alter an existing Article and submit the changes to the "Update" Endpoint to save them permenantly.
  * **Endpoint**
    * Inside the Article Controller (`app/controllers/articles_controller.rb`) let's make the **Edit** endpoint:
      ```
      class ArticlesController < ApplicationController
        ...
        def edit
          @article = Article.find(params[:id])
        end
        ...
      end
      ```
      * Technical Information:
        * Just like the "Show" Endpoint, we find the Article using it's `:id`. In this case, we're sending it to our "Edit' View to allow the User to alter it.
        * When the User is finished, they'll submit the Article to our "Update" Endpoint to be updated in the database.
  * **View**
    * We'll be using the exact same form for our "Edit" View that we used for our "New" View!
    * In Terminal use: `touch app/views/articles/edit.html.erb`, then open and paste in the following:
        ```
        <h1>Edit Article<h1>
        <%= render "form" %>
        <%= link_to "Back", articles_path %>
        ```
    * Because Rails is so smart, it will automatically send the User altered Article to the "Update" Endpoint on submit (ya know, once we make it.).
    * We also added the line `<%= link_to "Back", articles_path %>` to allow Users to return to the "Index" View in case they sudden don't want to "Edit" the Article.
  * **Check it out**
    * We won't be able to actually "Update" the Article without the aptly named "Update" Endpoint, but we can still check out the "Edit" View at `http://localhost:3000/articles/1/edit`.
      * *This URL assumes you havent somehow deleted the original Article with an `:id` of 1.* 

  ### **Update: View & Endpoint**
  > The Update Endpoint & View 
  * **Endpoint**
    * Inside the Article Controller (`app/controllers/articles_controller.rb`) let's make the **Update** endpoint:
      ```
      class ArticlesController < ApplicationController
        ...

      end
      ```
      * Technical Information:
        * 
  * **View**
    * 
  * **Check it out**
    * 

  ### **Destroy: View & Endpoint**
  > The Destroy Endpoint & View 
  * **Endpoint**
    * Inside the Article Controller (`app/controllers/articles_controller.rb`) let's make the **Destroy** endpoint:
      ```
      class ArticlesController < ApplicationController
        ...

      end
      ```
      * Technical Information:
        * 
  * **View**
    * 
  * **Check it out**
    * 














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