# frozen_string_literal: true

# The class to create an author
class Author::UpdateAuthor < ActiveInteraction::Base
  object :author,
         class: Author,
         desc: "The author information to update"
  string :id,
         desc: "The ID of the author to be updated"
  def execute
    # app_id will be hardcoded until proper authentication is added

    return author if author.invalid?

    @author_to_update = Author.find(id)

    @author_to_update.first_name = author.first_name if author.first_name.present?
    @author_to_update.last_name = author.last_name if author.last_name.present?

    update_author
    @author_to_update
  end

  private

  def update_author
    @author_to_update.save
  end
end