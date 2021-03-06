require 'spec_helper'
# require 'random_hash'

describe User do
  let(:user) do
    User.new(
      first_name: 'Example',
      last_name: 'user',
      email: 'user@example.com',
      password: 'foobar',
      password_confirmation: 'foobar',
      organization: 'Big Organization',
      role: 'curator',
      confirmation_hash: RandomHash.generate
    )
  end

  subject { user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:organization) }
  it { should respond_to(:role) }
  it { should respond_to(:confirmation_hash) }

  it { should be_valid }
end
