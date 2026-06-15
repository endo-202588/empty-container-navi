require 'rails_helper'

RSpec.describe Route, type: :model do
  it "有効なFactoryを持つこと" do
    expect(build(:route)).to be_valid
  end
end
