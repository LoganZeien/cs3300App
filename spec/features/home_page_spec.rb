# Another feature tests, tests if the user can see all of the equipment
RSpec.feature "HomePages", type: :feature do
    # something like, as a user, I want to see all of the equipment, so that value 
    scenario "The visitor should see equipment" do
        visit root_path
        expect(page).to have_text("Equipment")
    end
end
  