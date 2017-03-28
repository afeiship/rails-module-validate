# rails-module-validate
> Rails module for basic model validate.


## Step by step:
+ Generate controller && model:
```bash
rails g controller Users new create
rails g model User username:string email:string password_digest:string auth_token:string
rake db:create db:migrate
```

+ Ruby for user.rb
```ruby
class User < ApplicationRecord
    has_secure_password
    before_create { generate_token(:auth_token) }
    validates :username, :email, presence:true
    validates :username, :email, uniqueness: { case_sensitive: false }

    # create random && make sure only one:
    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column=>self[column])
    end
end
```

## resources:
+ http://www.imooc.com/video/5846