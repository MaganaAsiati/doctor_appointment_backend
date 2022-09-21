require 'rails/application_controller'

class HomesController < ApplicationController
    def index
        render file: Rails.root.join('public', 'index.html')
    end
end