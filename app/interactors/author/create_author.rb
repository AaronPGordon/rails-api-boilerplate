# frozen_string_literal: true

# The class to create an author
class Author::CreateAuthor < ActiveInteraction::Base
  object :author,
         class: Author,
         desc: "The unsaved author to create"
  def execute
    # app_id will be hardcoded until proper authentication is added

    return author if author.invalid?

    save_author
    author
  end

  private

  def save_author
    author.save
  end
end