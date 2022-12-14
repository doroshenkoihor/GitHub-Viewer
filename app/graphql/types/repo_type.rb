# frozen_string_literal: true

module Types
  class RepoType < Types::BaseObject
    field :name, String, null: false
    field :svn_url, String, null: false
  end
end
