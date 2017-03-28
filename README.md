# rails-module-validate
> Rails module for basic model validate.


## Step by step:
```bash
rails g controller Users new create
rails g model User username:string email:string password_digest:string auth_token:string
rake db:create db:migrate
```