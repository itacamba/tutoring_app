class User < ApplicationRecord
    has_secure_password
    has_many :sessions
    has_many :user_subjects
    has_many :subjects, through: :user_subjects
    has_many :lessons, class_name: "Session", :foreign_key => "tutor_id"
    has_many :students, through: :lessons, :foreign_key => "tutor_id"
    has_many :sessions, :foreign_key => "student_id"
    has_many :tutors, through: :sessions, :foreign_key => "tutor_id"

    validates :email, presence: true, uniqueness: {case_sensitive: false}
end
