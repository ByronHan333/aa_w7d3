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
class User < ApplicationRecord
  validates

  def self.find_by_credentials(username, password)

  end

  def password=(password)

  end

  def is_password?(password)

  end

  def reset_session_token

  end

  def ensure_session_token

  end

  private

  def generate_unique_session_token

  end
end
