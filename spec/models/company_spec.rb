require 'rails_helper'
#### test the following ####
# company association to stock :has_many
# company association to order :has_many
# company symbol should always have a value
# company cannot be dupliated via symbol unique: true
# company symbol should be capitalized before validation
# company name should always have a value
#
#

RSpec.describe Company, type: :model do
  let!(:nike) { create(:company, :nike) }

  describe "associations" do
    it { should have_many(:stocks) }
    it { should have_many(:orders) }
  end

  describe "symbol" do
    it "is invalid without symbol value" do
      company_symbol_nil = build(:company, symbol: nil)
      expect(company_symbol_nil).not_to be_valid
    end

    it "is invalid with a duplicate value" do
      nike_duplicate = build(:company, symbol: "NKE", name: "Nike Inc")
      expect(nike_duplicate).not_to be_valid
    end

    it "capitalized the symbol before validation" do
      company = create(:company, symbol: "smgp")
      expect(company.symbol).to eq("SMGP")
    end
  end

  it "is invalid withot name value" do
    company_name_nil = build(:company, name: nil)
    expect(company_name_nil).not_to be_valid
  end
end
