# frozen_string_literal: true

class User < ApplicationRecord
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test"
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :first_name, :last_name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true

  def list_of_tests(level = 0)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
