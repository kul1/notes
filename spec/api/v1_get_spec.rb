require 'rails_helper'

describe "get an api route", :type => :request do
  let!(:note) {FactoryBot.create_list(:note, 20)}
before {get '/api/v1/notes/my'}

it 'returns all notes' do
    expect(JSON.parse(response.note).size).to eq(20)
  end
it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

