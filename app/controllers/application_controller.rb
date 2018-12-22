class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception



    private

    def load_customer
        @customer = Customer.find_by(params[:id])
    end
end
