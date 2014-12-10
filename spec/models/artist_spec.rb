require 'spec_helper'

describe Artist do
  let(:artist) do
    Artist.new(
      first_name: 'Leonardo',
      last_name: 'DaVinci',
      birth_date: 14520415,
      deceased_date: 15190502,
      title: "Master",
      bio:   "Leonardo di ser Piero da Vinci (15 April 1452 – 2 May 1519) was an Italian polymath, painter, sculptor, architect, musician, mathematician, engineer, inventor, anatomist, geologist, cartographer, botanist, and writer. He is widely considered to be one of the greatest painters of all time and perhaps the most diversely talented person ever to have lived.",
      bio_source: "http://en.wikipedia.org/wiki/Leonardo_da_Vinci")
  end

  subject { artist }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:birth_date) }
  it { should respond_to(:deceased_date) }
  it { should respond_to(:title) }
  it { should respond_to(:bio) }
  it { should respond_to(:bio_source) }

  # Associations
  it { should respond_to(:image) }

  it { should be_valid }
end
