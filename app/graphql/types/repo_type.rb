# frozen_string_literal: true

module Types
  class RepoType < Types::BaseObject
    field :name, String, null: false
  end
end
