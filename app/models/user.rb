class User < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :user_subjects
    has_many :subjects, through: :user_subjects
    has_many :lessons, class_name: "Appointments", :foreign_key => "tutor_id"
    has_many :students, through: :lessons, :foreign_key => "tutor_id"
    has_many :appointments, :foreign_key => "student_id"
    has_many :tutors, through: :appointments, :foreign_key => "tutor_id"

    validates :email, presence: true, uniqueness: {case_sensitive: false}

    devise :omniauthable, :omniauth_providers => [:google_oauth2]
  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end
end
