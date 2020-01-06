class WelcomeController < ApplicationController
  def index
  	session["init"] = true
  end
end
