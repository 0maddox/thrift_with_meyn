class TokenService
  SECRET_KEY = Rails.application.secrets.secret_key_base
  EXPIRATION_TIME = 24.hours.to_i

  def self.generate_token(payload)
    payload[:exp] = Time.now.to_i + EXPIRATION_TIME
    payload[:jti] = SecureRandom.uuid
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def self.verify_token(token)
    JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' }).first
  rescue JWT::ExpiredSignature
    nil
  rescue JWT::DecodeError
    nil
  end
end


  