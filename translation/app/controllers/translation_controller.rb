# app/controllers/translation_controller.rb
class TranslationController < ApplicationController
    GREETINGS = {
      "EN" => "Hello",
      "FR" => "Bonjour",
      "MA" => "Salam"
    }
  
    def show
      name = params[:name]
      country_code = params[:country_code].upcase
      greeting = GREETINGS[country_code] || GREETINGS["MA"]
  
      render json: { greeting: "#{greeting}, #{name}" }
    end
  end
  