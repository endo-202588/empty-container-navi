require 'rails_helper'

RSpec.describe Booking, type: :model do
  it "有効なFactoryを持つこと" do
    expect(build(:booking)).to be_valid
  end
end
