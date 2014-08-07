module ApplicationHelper
  def get_token
    SecureRandom.uuid
  end
end
