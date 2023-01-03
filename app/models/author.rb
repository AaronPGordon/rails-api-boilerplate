# frozen_string_literal: true

# An author. They may have books.
class Author < ApplicationRecord
  # 1 Author:n Books
  # has_many documentation https://guides.rubyonrails.org/association_basics.html#the-has-many-association
  has_many :books
end
