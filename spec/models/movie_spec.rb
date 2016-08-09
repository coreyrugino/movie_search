require 'rails_helper'
RSpec.describe Movie, type: :model do
  describe 'attributes' do
    it {should respond_to(:title)}
    it {should respond_to(:genre)}
    it {should respond_to(:actors)}
    it {should respond_to(:user_id)}
  end
    describe "Associations" do
    it {Movie.reflect_on_association(:users).macro.should eq(:has_many)}
  end
end
