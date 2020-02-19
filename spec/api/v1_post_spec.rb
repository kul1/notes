require 'rails_helper'

describe "post a note route", :type => :request do
  before do
    post '/api/v1/notes', params: { :note => 'test_note', :answer => 'test_answer', :service => 'test_service', :number => 2, :letter => 'a' }
  end

  it 'returns the title' do
    expect(JSON.parse(response.note)['title']).to eq('test_title')
  end
  it 'returns the body' do
    expect(JSON.parse(response.note)['body']).to eq('test_body')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
