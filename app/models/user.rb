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
end
