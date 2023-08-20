class PaymentsController < ApplicationController
#   def make_payment
#     # Step 1: Generate the access token
#     access_token = generate_access_token

#     # Step 2: Initiate the payment request using the access token
#     payment_result = initiate_payment(access_token)

#     # Step 3: Handle the payment result
#     if payment_result
#       render json: { message: 'Payment initiated successfully' }
#     else
#       render json: { error: 'Payment initiation failed' }, status: :unprocessable_entity
#     end
#   end

#   private

#   def generate_access_token
#     url = URI("https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials")
    
#     https = Net::HTTP.new(url.host, url.port)
#     https.use_ssl = true
    
#     request = Net::HTTP::Post.new(url)
#     request["Authorization"] = "Basic YOUR_BASE64_ENCODED_CREDENTIALS"
    
#     response = https.request(request)
#     response_body = JSON.parse(response.read_body)
#     response_body['access_token']
#   end

#   def initiate_payment(access_token)
#     payment_url = URI("https://example.com/mpesa/payment") # Replace with actual payment API URL
    
#     https = Net::HTTP.new(payment_url.host, payment_url.port)
#     https.use_ssl = true

#     payment_request = Net::HTTP::Post.new(payment_url)
#     payment_request["Authorization"] = "Bearer #{access_token}"
#     payment_request["Content-Type"] = "application/json"
    
#     payment_params = { amount: 100, phone_number: '1234567890' } # Replace with actual payment parameters
#     payment_request.body = payment_params.to_json

#     payment_response = https.request(payment_request)
#     payment_response.code == '200' # Assuming success response code is 200
#   end
end
