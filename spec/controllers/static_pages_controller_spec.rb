require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
    describe "GET #home" do
        subject {get :home}

        it "renders the home page template" do
            expect(subject).to render_template(:home)
            expect(subject).to render_template("home")
            expect(subject).to render_template("static_pages/home")
        end

        it "does not render a different template" do
            expect(subject).to_not render_template("static_pages/about")
        end
    end

    describe "GET #about" do
        subject {get :about}

        it "renders the about page template" do
            expect(subject).to render_template(:about)
            expect(subject).to render_template("about")
            expect(subject).to render_template("static_pages/about")
        end

        it "does not render a different template" do
            expect(subject).to_not render_template("static_pages/home")
        end
    end

end
