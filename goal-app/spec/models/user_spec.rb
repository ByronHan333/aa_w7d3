# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(username: 'lilly_llama', password: 'password') }

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password) }
  it { should have_many(:goals) }

  describe 'finds users by credentials' do
    context 'with a valid username and password' do
      it 'returns the proper user' do
        sally = User.create(username: 'sally_lee', password: 'password')
        user = User.find_by_credentials('sally_lee', 'password')

        expect(sally.username).to eq(user.username)
        # expect(sally.password_digest).to eq(user.password_digest)
      end
    end

    context 'with an invalid username and password' do
      it 'returns nil' do
        jack = User.create(username: 'jack_bruce', password: 'abcdef')
        user = User.find_by_credentials('jack_bruce', 'notthepassword')
        expect(user).to be_nil
      end
    end
  end




end






# require 'rails_helper'

# RSpec.describe User, type: :model do
#   subject(:valid_user) { create(:user) }

#   context 'validates' do
#     it 'presence of username' do
#       p valid_user
#       user = build(:user, username: '')
#       expect(user.save).to be(false)
#       expect(user.errors.full_messages).to eq(['Username can\'t be blank'])
#     end

#     it { should validate_uniqueness_of(:username) }
#     it { should validate_length_of(:password).is_at_least(6) }
#     it { should have_many(:chirps) }
#   end
# end
