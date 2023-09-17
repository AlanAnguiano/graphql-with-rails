module Types
  class QueryType < Types::BaseObject
    # Fetch all the authors
    field :authors, [Types::AuthorType], null: false

    def authors
      Author.all
    end

    # Fetch single Author by ID
    field :author, Types::AuthorType, null: false do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.find(id)
    end

    field :author_by_name, Types::AuthorType, null: false do
      argument :name, String, required: true
    end

    def author_by_name(name:)
      Author.find_by_name(name)
    end
  end
end
