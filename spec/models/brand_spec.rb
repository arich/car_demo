require "rails_helper"

RSpec.describe Brand, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:cars) }
end
