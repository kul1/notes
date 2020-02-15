# Notes
## Notes Overview 
Notes is a personel message system in rails. which can be modified to use all rails features such as  files attachment, reminder, mail, social network sharing. This version support key features below.

## Key features 
- Support multi-user
- Title input maximum 30 characters
- Body input maximum 1000 characters
- Blank Title will use body content when save
- Able to mail each Note
- Support dynamic user roles for each view/controller such as admin, member, developer (A,M,D) or any assign in role table/collection 
- Full test in Key features with rspec
- Support MVC work flow like normal rails, however this program use controller/helper feature call all controller in order to easy generate using my gem Jinda 
    
## Current gems version installed: 
- Ruby Version 2.5.0
- Rails Version 5.2.3
- Jinda 0.4.5

## Requirement
- Mongodb as database
  
## Installation
- install mongodb 
- $ git clone https://github.com/kul1/notes.git
- bundle install 
- rake jinda:seed # to add user: "admin" password: "secret"

## Modification required:
- Freemind
- Gem Jinda 0.4.5 or above
- $ app/jinda/index.mm (using Freemind)
- $ rake jinda:update # After change index.mm

Usage
- Sign in: your user  name with email # default role as "" 
-  (can set default to "" or m (member) or any   group role in index.mm using freemind)
- Sign in as user admin password "secret" to menu Admin and change user role to any like "m" or "m,a,d" for (member, admin, group)

