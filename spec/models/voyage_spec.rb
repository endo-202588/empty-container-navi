require 'rails_helper'

RSpec.describe Voyage, type: :model do
  it "有効なFactoryを持つこと" do
    expect(build(:voyage)).to be_valid
  end
end
