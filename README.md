# qwiki
A project to allow users to create editable pages (referred to as "wikis" by the guidelines for this project). 

## User stories  
* As a user, I want to sign up for a free account by providing a password, and email  
I fulfilled this user story by adding Devise to my app, creating a `User` model through Devise and using Devise to manage a registration view and email confirmation.

* As a user, I want to sign in and out  
Sign in and out links are in `application.html.erb` and link to Devise actions.

* As a user with a standard account, I want to create, read, update, and delete public wikis  
`wikis_controller.rb` has methods for performing all of these actions on wikis.

* As a developer, I want to offer three user roles: admin, standard, or premium  
Pundit is integrated into the application and policies offer different permissions to each role, which are listed in an `enum` in my `User` model.

* As a developer, I want to seed the development database automatically with users and wikis  
I use the Faker gem to generate data for users and wikis in my `seeds.rb`. 

* As a user, I want to upgrade my account from a free to a paid plan  
The Stripe gem is used to collect payment, with `ChargesController.rb` providing paths to charge.

* As a premium user, I want to create private wikis  
Premium users have the form option of creating a private wiki, which is hidden from standard users. Upon downgrade of a user's account from premium to standard, their private wikis are made public.

* As a user, I want to edit wikis using Markdown syntax  
The Redcarpet gem parses Markdown syntax.

* As a premium user, I want to add and remove collaborators for my private wikis  
This was the most challenging user story for me. I first wanted to put the collaborator logic inside `users_controller`, but opted instead to have a separate `Collaborator` model with accompanying controller. 
