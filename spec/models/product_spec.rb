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

    context "invalid attributes" do
      before do
        subject.valid?
      end
      
      it "expect store" do
        expect(subject.errors[:store]).to include("não pode ficar em branco")
      end

      it "expect image" do
        expect(subject.errors[:name]).to include("não pode ficar em branco")
      end

      it "expect image" do
        expect(subject.errors[:image]).to include("não pode ficar em branco")
      end

      it "expect url" do
        expect(subject.errors[:url]).to include("não pode ficar em branco")
      end
      
    end
  end

  # describe "last payment" do
  #   context "valid payments" do
  #     it "expect the last payment" do
  #       expect(subject.last_payment).no_to be_nil
  #     end
  #   end
  # end
  
  
  
end
