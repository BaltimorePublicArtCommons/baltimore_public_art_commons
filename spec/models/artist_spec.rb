require 'spec_helper'

describe Artist do
  let(:artist) do
    Artist.new(
      first_name: 'Leonardo',
      last_name: 'DaVinci',
      birth_date: 30.years.ago.to_i,
      deceased_date: nil,
      title: "Master")
  end

  subject { artist }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:birth_date) }
  it { should respond_to(:deceased_date) }
  it { should respond_to(:title) }

  # Associations
  it { should respond_to(:image) }

  it { should be_valid }
end
