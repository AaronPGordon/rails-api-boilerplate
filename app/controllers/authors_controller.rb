# frozen_string_literal: true

# Controller for the authors model.
class AuthorsController < ApplicationController
  def index
    authors = Author.all
    render json: authors
  end

  def show
    author = Author.find(params[:id])
    render json: author
  end

  def create
    author_obj = Author.new(author_params)

    author = Author::CreateAuthor.run!(
      author: author_obj
    )

    render json: author, status: :created
  end

  def update
    author_obj = Author.new(author_params)

    author = Author::UpdateAuthor.run!(
      author: author_obj,
      id: params[:id]
    )

    render json: author, status: :created
  end
  private

  def author_params
    params.require(:author)
          .permit(
            :first_name,
            :last_name
          )
  end
end
