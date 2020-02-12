require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "Required only  title (Maximum 30)" do
  # let(:note) { Note.new(:title, :body) }

    it "valid with  both title and body" do
      before_count = Note.count
      n = Note.new(title: "dddd", body: "body")
      n.save
      expect(Note.count).not_to eq(before_count)
    end

    it "valid with  only title" do
      before_count = Note.count
      n = Note.new(title: "Title")
      n.save
      expect(Note.count).not_to eq(before_count)
    end

    it "invalid with  only body" do
      before_count = Note.count
      n = Note.new(body: "body")
      n.save
      expect(Note.count).to eq(before_count)
    end
  
    it "invalid body length more than 1000" do
      before_count = Note.count
      title_max = "x"*30
      body_max  = "y"*1001
      n = Note.new(title: title_max, body: body_max)
      n.save
      expect(Note.count).to eq(before_count)
    end
  end

end
