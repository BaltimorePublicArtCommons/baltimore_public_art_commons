require 'spec_helper'

require_relative "../../lib/importers/this_one_first"

describe Importers::ThisOneFirst do
  describe '.title_for_row' do
    subject { Importers::ThisOneFirst.title_for_row(row) }
    context "nil" do
      let(:row) { nil }
      it { should be_nil }
    end
    context "no data" do
      let(:row) { [] }
      it { should be_nil }
    end
    context "data" do
      let(:row) { [ nil, nil, "My Working Title" ] }
      it { should eq('My Working Title') }
    end
    context "data but no title" do
      let(:row) { [ nil, 15, nil ] }
      it { should eq('Number: 15') }
    end
  end
end
