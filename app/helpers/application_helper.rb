module ApplicationHelper

    # Sets button text where necessary.
    def button_text(button_name = '')
        button_base_name = "Proceed"
        if button_name.empty?
            button_base_name
        end
    end
end
