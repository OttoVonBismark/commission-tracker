require 'rails_helper'

RSpec.describe Customer, type: :model do
  def overmax_name
    output = "a"
    50.times do
      output = output + "a"
    end
    return output
  end

  def overmax_email
    output = "b"
    255.times do
      output = output + "b"
    end
    output = output + "@example.com"
    return output
  end

  let(:valid_attributes) {
    {
      name: "John Doe",
      email: "user@example.com"
    }
  }

  let(:empty_attributes) {
    {
      name: "",
      email: ""
    }
  }

  let(:huge_attributes){
    {
      name: overmax_name,
      email: overmax_email
    }
  }

  describe "Valid customer" do
    it "is with valid attributes" do
      customer = Customer.new(valid_attributes)
      expect(customer.name).to eq "John Doe"
      expect(customer.email).to eq "user@example.com"
      expect(customer).to be_valid
    end
  end

  describe "Invalid customer" do
    it "is not valid with empty attributes" do
      customer = Customer.new(empty_attributes)
      expect(customer.name).to eq ""
      expect(customer.email).to eq ""
      expect(customer).to_not be_valid
    end

    it "is not valid with a blank name" do
      customer = Customer.new(name: "", email: "user@example.com")
      expect(customer.name).to eq ""
      expect(customer.email).to eq "user@example.com"
      expect(customer).to_not be_valid
    end

    it "is not valid without a properly formatted email address" do
      customer = Customer.new(name: "John Doe", email: "This is not a valid email")
      expect(customer.name).to eq "John Doe"
      expect(customer.email).to eq "This is not a valid email"
      expect(customer).to_not be_valid
    end

    it "is not valid if the name is greater than 50 characters long" do
      customer = Customer.new(name: overmax_name, email: "user@example.com")
      expect(customer).to_not be_valid
    end

    it "is not valid if the email is greater than 255 characters long" do
      customer = Customer.new(name: "John Doe", email: overmax_email)
      expect(customer).to_not be_valid
    end
  end

  describe "downcase_email" do
    it "makes sure email addresses are all lower_case" do
      # We have to use the 'create!' method because calling 'downcase_email' here is a scope violation.
      customer = Customer.create!(name: "John Doe", email: "UsEr@ExAmPlE.CoM")
      expect(customer.name).to eq "John Doe"
      expect(customer.email).to eq "user@example.com"
    end
  end

end
