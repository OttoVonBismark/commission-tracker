require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do

    describe "button text" do
        # This doesn't work at the moment. It might be better to test this functionality via integrations testing instead.
        # it "provides custom text to buttons" do
        #     expect(helper.button_text(custom_button)).to eq("Submit")
        # end
        
        it "provides default text 'Proceed' if no custom text is given" do
            expect(helper.button_text("")).to eq("Proceed")
        end
    end

end