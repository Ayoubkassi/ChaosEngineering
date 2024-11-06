# app/controllers/greetings_controller.rb
require 'httparty'

class GreetingsController < ApplicationController
  def show
    name = params[:name]
    country_code = params[:country_code].upcase

    # Fetch translation (greeting) from the Translation app
    greeting = fetch_greeting(name, country_code)

    render json: { message: greeting }
  end

  private

  def fetch_greeting(name, country_code)
    translation_service_url = "http://localhost:3001/translation/#{name}/#{country_code}"

    response = HTTParty.get(translation_service_url)
    response.parsed_response['greeting']
  rescue => e
    "Could not retrieve greeting: #{e.message}"
  end
end
