require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    context "valid attributes" do
      before do
        @product = build(:product)
      end
      
      it "have all attributes checked" do
        expect(@product).to be_valid
      end
    end
  end
  
  
end
