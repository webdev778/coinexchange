class Token::Activation < ::Token
  after_create :send_token

  def confirm!
    super
    member.active!
  end

  private

  def send_token
    puts TokenMailer.activation(member.email, token)
    TokenMailer.activation(member.email, token).deliver
  end
end
