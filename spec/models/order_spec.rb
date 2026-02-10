require 'rails_helper'

#### test the following ####
# association to user :belongs_to
# association to company :belongs_to
# should only have buy and sell value
# should have quantity
# should have total precision
# price should be present

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }
  # "let!" create a record and doesn't need to be called inside the it do block
  let!(:user) { create(:user) }
  let!(:company) { create(:company) }
  # since it is create instead of build the record persisted in the database and
  # became the reference to line (19, 33, and 34) in order to refer to the same
  # stock in line 19 that needs [user_id: user(line14), company_id: company(line15)]
  let!(:stock) { create(:stock, user: user, company: company) }

  it { should belong_to(:user) }
  it { should belong_to(:company) }

  describe "order type" do
    it "should accept order type buy" do
      order_type_buy = build(:order, order_type: "buy")
      expect(order_type_buy).to be_valid
    end

    it "should accept order type sell" do
      order = build(
        :order,
        user: user, ## it is using the user record in line 14
        company: company, # it is using the company record in line 15
        order_type: "sell",
        quantity: 1
      )

      expect(order).to be_valid
    end

    it "should not accept order type other than buy and sell" do
      order_type_invalid = build(:order, order_type: "loan")
      expect(order_type_invalid).to be_invalid
    end
  end

  describe "quantity" do
    it "cannot be negative or 0" do
      invalid_quantity = build(:order, quantity: 0)
      expect(invalid_quantity).to be_invalid
    end

    it "cannot be blank or nil" do
      invalid_quantity = build(:order, quantity: nil)
      expect(invalid_quantity).to be_invalid
    end

    it "is invalid if sell quantity exceeds user's stock quantity" do
      invalid_quantity = build(
        :order,
        user: user,
        company: company,
        order_type: "sell",
        quantity: 100,
      )
      expect(invalid_quantity).to be_invalid
    end
  end

  it "should calculate total before validation" do
    order = build(:order, quantity: 3, price: 100)
    expect(order.total).to be_nil # before validation total not yet set

    order.valid? # reads before validation
    expect(order.total).to eq(300) # set total
  end
end
