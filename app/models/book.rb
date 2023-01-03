# frozen_string_literal: true

# Books that must have an author.
class Book < ApplicationRecord
  # n Books:1 Author relationship
  # belongs_to documentation https://guides.rubyonrails.org/association_basics.html#the-belongs-to-association
  belongs_to :author
end
