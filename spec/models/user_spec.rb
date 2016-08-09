require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'attributes' do
    it {should respond_to :name}
    it {should respond_to :email}
    it {should respond_to :likes}
  end
    describe "Associations" do
    it {User.reflect_on_association(:movies).macro.should eq(:has_many)}
  end
end
