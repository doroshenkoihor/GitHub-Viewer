# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'query user' do
  it 'returs info about user and his repos' do
    VCR.use_cassette('user') do
      query = <<-GQL
      query {
        user(login: "doroshenkoihor") {
          login
          name
          repos {
            name
          }
        }
      }
      GQL

      results = GithubSchema.execute(query)

      expect(results.dig('data', 'user', 'login')).to eq('doroshenkoihor')
      expect(results.dig('data', 'user', 'name')).to eq('doroshenkoihor')
      expect(results.dig('data', 'user',
                         'repos')).to eq([{ 'name' => 'github' }, { 'name' => 'Library' }, { 'name' => 'wallet' }])
    end
  end
end
