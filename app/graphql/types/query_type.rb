require 'uri'
require 'net/http'

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :user, UserType, null: true do
      argument :login, String, required: true
    end

    def user(login:)
      uri = URI("https://api.github.com/users/#{login}")
      res = Net::HTTP.get_response(uri)

      JSON.parse(res.body)
    end
  end
end
