require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(name: "John Doe", email: "user@example.com"),
      Customer.create!(name: "Jane Doe", email: "user1@example.com")
    ])
  end

  it "renders a list of customers" do
    render
  end
end
