class CommissionsController < ApplicationController
    before_action :load_customer, except: :index

    def index
        @commissions = Commission.all
    end

    def show
    end

    def new
        @commission = Commission.new
        # @customer = Customer.find_by id: params["customer_id"]
    end

    def edit
    end
    
    def create
        @commission = @customer.commissions.new(commissions_params)
        
        respond_to do |format|
            if @commission.save
                format.html { redirect_to commissions_url, notice: "Commission created successfully"}
            else
                format.html { render :new }
            end
        end
    end

    def update
        respond_to do |format|
            if @customer.commissions.update(commission_params)
                format.html { redirect_to @commission, notice: "Commission information updated successfully!"}
            else
                format.html { render :edit }
            end
        end
    end

    def destroy
        @commission.destroy

        respond_to do |format|
            format.html { redirect_to commissions_url, notice: "Commission was deleted successfully." }
        end
    end



    private

    # Keep your dirty spoofed parameters to yourself!
    def commissions_params
        params.require(:commission).permit(:customer_id, :date_commissioned, :price, :details, :has_paid, :date_paid, :is_finished, :date_finished)
    end
end
