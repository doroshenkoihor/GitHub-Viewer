# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :login, String, null: false
    field :name, String, null: false
    field :repos, [RepoType], null: false

    def repos
      uri = URI("https://api.github.com/users/#{object['login']}/repos")
      res = Net::HTTP.get_response(uri)

      JSON.parse(res.body)
    end
  end
end
