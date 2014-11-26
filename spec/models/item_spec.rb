require 'spec_helper'

describe Item do
  let(:item) do
    Item.new(
      name: 'Artwork',
      material: 'marshmallow',
      genre: 'food art',
      installation_start_date: 30.years.ago.to_i,
      installation_end_date:   20.years.ago.to_i,
      height: 1.0,
      width: 2.0,
      depth: 3.0,
      context: "context")
  end

  subject { item }

  it { should respond_to(:name) }
  it { should respond_to(:material) }
  it { should respond_to(:genre) }
  it { should respond_to(:installation_start_date) }
  it { should respond_to(:installation_end_date) }
  it { should respond_to(:height) }
  it { should respond_to(:width) }
  it { should respond_to(:depth) }
  it { should respond_to(:context) }

  # Associations
  it { should respond_to(:images) }

  it { should be_valid }
end

