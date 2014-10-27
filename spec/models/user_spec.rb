require 'spec_helper'

describe User do
  let(:user) do
    User.new(
      first_name: 'Example',
      last_name: 'user',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar')
  end

  subject { user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }
end
