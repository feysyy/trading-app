require 'rails_helper'
#### test the following ####
# assocation to user :belongs_to
# association to company :belongs_to
# will create stock if quantity > 0
# quantity should be present or else the record will be deleted
# updating quantity based on order_type on order
#

RSpec.describe Stock, type: :model do
  let(:stock) { create(:stock) }

  it { should belong_to(:user) }
  it { should belong_to(:company) }

  it "is valid if it has user_id and company_id" do
    expect(stock).to be_valid
  end

  it "is invalid if user is nil or missing" do
    missing_user = build(:stock, user: nil)
    expect(missing_user).to be_invalid
  end

  it "is invalid if company is nil or missing" do
    missing_company = build(:stock, company: nil)
    expect(missing_company).to be_invalid
  end

  it "deletes the record if stock's quantity became 0" do
    stock.update(quantity: 0)

    expect(Stock.exists?(stock.id)).to be_falsey
  end
end
