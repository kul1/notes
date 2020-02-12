require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "Required only  title (Maximum 30)" do
  # let(:note) { Note.new(:title, :body) }

    it "valid with  both title and body" do
      before_count = Note.count
      Note.create(title: "dddd", body: "body")
      expect(Note.count).not_to eq(before_count)
    end

    it "valid with  only title" do
      before_count = Note.count
      Note.create(title: "Title")
      expect(Note.count).not_to eq(before_count)
    end

    it "invalid with  only body" do
      before_count = Note.count
      Note.create(body: "body")
      expect(Note.count).to eq(before_count)
    end
  
    it "invalid body length more than 1000" do
      before_count = Note.count
      title_max = "x"*30
      body_max  = "y"*1001
      Note.create(title: title_max, body: body_max)
      expect(Note.count).to eq(before_count)
    end
  end

end
