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
