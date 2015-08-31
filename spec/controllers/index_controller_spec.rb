require 'rails_helper'

RSpec.describe "Project" do
  describe "should get index" do
    it "should render a successful page" do
      expect(response.status).to eq(200)
    end
  end
end
