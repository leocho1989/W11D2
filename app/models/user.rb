class User < applicationRecord
    attr_reader :password

    validates :username, :password_digest, :session_token, presence: true
    validates :username, uniqueness: true
    validates :password, length: { minumum: 6}, allow_nil: true

    after_initialize :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end
    
    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64(64)
    end

    def reset_session_token! 
        self.session_token = SecureRandom::urlsafe_base64(64)
        self.save!
        self.session_token
    end
end