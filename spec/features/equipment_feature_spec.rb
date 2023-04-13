require "rails_helper"
# This is an integration test, so we are testing the entire flow of the program, that is what :feature says
RSpec.feature "Equipment", type: :feature do
    # different types of tests involving updating the equipment, this would be a user story, or a collection of user stories for the different types
    describe "Equipment - Update/Edit" do
        # all happy scenarios, user fills in correctly and is allowed to update
        context "Happy Paths" do
            # as a pre-req/condition, create a test equipment and visit the edit page (/equipment/id/edit)
            equipment = FactoryBot.create(:equipment)
            before(:each) do
                @user = FactoryBot.create(:user)
                sign_in @user
                visit edit_equipment_path(equipment)
            end

            scenario "name should be successful" do # notice how we switched to scenario instead of it, functionally no difference
                within("form.equipment-form") do 
                    fill_in "Name", with: "New Name"  
                end
                click_button "Submit"
                expect(page).to have_content("Equipment was successfully updated")  # somewhere on the page, this should exist
            end
        
            scenario "description should be successful" do
                within("form.equipment-form") do 
                    fill_in "Description", with: "New Description"  
                end
                click_button "Submit"
                expect(page).to have_content("Equipment was successfully updated")  # somewhere on the page, this should exist
            end

            scenario "Location should be successful" do
                within("form.equipment-form") do 
                    fill_in "Location", with: "New Location"  
                end
                click_button "Submit"
                expect(page).to have_content("Equipment was successfully updated")  # somewhere on the page, this should exist
            end

            scenario "SN should be successful" do
                within("form.equipment-form") do 
                    fill_in "Sn", with: "New SN"  
                end
                click_button "Submit"
                expect(page).to have_content("Equipment was successfully updated")  # somewhere on the page, this should exist
            end

            scenario "MN should be successful" do
                within("form.equipment-form") do 
                    fill_in "Mn", with: "New MN"  
                end
                click_button "Submit"
                expect(page).to have_content("Equipment was successfully updated")  # somewhere on the page, this should exist
            end

            scenario "Lastpm should be successful" do
                within("form.equipment-form") do 
                    fill_in "Lastpm", with: Faker::Date.between(from: 10.years.ago, to: Date.today) # I am using faker since the date can be quite particular in the format, this solves that
                end
                click_button "Submit"
                expect(page).to have_content("Equipment was successfully updated")  # somewhere on the page, this should exist
            end
        end
        # all sad scenarios, user fills in something with blank and it doesnt work
        context "Sad Paths" do
            # as a pre-req/condition, create a test equipment and visit the edit page (/equipment/id/edit)
            equipment = FactoryBot.create(:equipment)
            before(:each) do
                @user = FactoryBot.create(:user)
                sign_in @user
                visit '/equipment/new'
            end
        
            scenario "name shouldn't be successful" do
                within("form.equipment-form") do 
                    fill_in "Name", with: ""   # as if the user put nothing in
                end 
                click_button "Submit"
                expect(page).to have_content("Name can't be blank")  # somewhere on the page, this should exist
            end
        
            scenario "description shouldn't be successful" do
                within("form.equipment-form") do 
                    fill_in "Description", with: ""  
                end
                click_button "Submit"
                expect(page).to have_content("Description can't be blank")  # somewhere on the page, this should exist
            end

            scenario "Location shouldn't be successful" do
                within("form.equipment-form") do 
                    fill_in "Location", with: ""  
                end
                click_button "Submit"
                expect(page).to have_content("Location can't be blank")  # somewhere on the page, this should exist
            end

            scenario "SN shouldn't be successful" do
                within("form.equipment-form") do 
                    fill_in "Sn", with: ""  
                end
                click_button "Submit"
                expect(page).to have_content("Sn can't be blank")  # somewhere on the page, this should exist
            end

            scenario "MN shouldn't be successful" do
                within("form.equipment-form") do 
                    fill_in "Mn", with: ""  
                end
                click_button "Submit"
                expect(page).to have_content("Mn can't be blank")  # somewhere on the page, this should exist
            end

            scenario "Lastpm shouldn't be successful" do
                within("form.equipment-form") do 
                    fill_in "Lastpm", with: ""
                end
                click_button "Submit"
                expect(page).to have_content("Lastpm can't be blank")  # somewhere on the page, this should exist
            end
        end

    end

    # a different user story, something like: as a user, i want to create a equipment, so that value
    describe "Equipment - Create" do
        # all happy scenarios, user fills in correctly and is allowd to update
        context "Happy Paths" do
            # as a pre-req/condition, new page (/equipment/new)
            before(:each) do
                @user = FactoryBot.create(:user)
                sign_in @user
                visit '/equipment/new'
            end

            # happy path, equipment made successfully, similar to above
            scenario "equipment should be successful" do
                within("form.equipment-form") do
                    fill_in "Name", with: "New title content"
                    fill_in "Description", with: "New description content"
                    fill_in "Location", with: "New location content"
                    fill_in "Sn", with: "New sn content"
                    fill_in "Mn", with: "New mn content"
                    fill_in "Lastpm", with: Faker::Date.between(from: 10.years.ago, to: Date.today) # I am using faker since the date can be quite particular in the format, this solves that
                end
                click_button "Submit"
                expect(page).to have_content("Equipment was successfully created.")
            end
        end

        # all sad scenarios, user fills in something with blank and it doesnt work
        context "Sad Paths" do
            # as a pre-req/condition visit the new page (/equipment/id/new)
            before(:each) do
                @user = FactoryBot.create(:user)
                sign_in @user
                visit '/equipment/new'
            end
        
            scenario "equipment shouldn't be successful - missing name" do
                within("form.equipment-form") do
                    fill_in "Name", with: ""
                    fill_in "Description", with: "New description content"
                    fill_in "Location", with: "New location content"
                    fill_in "Sn", with: "New sn content"
                    fill_in "Mn", with: "New mn content"
                    fill_in "Lastpm", with: Faker::Date.between(from: 10.years.ago, to: Date.today) # I am using faker since the date can be quite particular in the format, this solves that
                end
                click_button "Submit"
                expect(page).to have_content("Name can't be blank")
            end

            scenario "equipment shouldn't be successful - missing description" do
                within("form.equipment-form") do
                    fill_in "Name", with: "New title content"
                    fill_in "Description", with: ""
                    fill_in "Location", with: "New location content"
                    fill_in "Sn", with: "New sn content"
                    fill_in "Mn", with: "New mn content"
                    fill_in "Lastpm", with: Faker::Date.between(from: 10.years.ago, to: Date.today) # I am using faker since the date can be quite particular in the format, this solves that
                end
                click_button "Submit"
                expect(page).to have_content("Description can't be blank")
            end

            scenario "equipment shouldn't be successful - missing location" do
                within("form.equipment-form") do
                    fill_in "Name", with: "New title content"
                    fill_in "Description", with: "New description content"
                    fill_in "Location", with: ""
                    fill_in "Sn", with: "New sn content"
                    fill_in "Mn", with: "New mn content"
                    fill_in "Lastpm", with: Faker::Date.between(from: 10.years.ago, to: Date.today) # I am using faker since the date can be quite particular in the format, this solves that
                end
                click_button "Submit"
                expect(page).to have_content("Location can't be blank")
            end

            scenario "equipment shouldn't be successful - missing sn" do
                within("form.equipment-form") do
                    fill_in "Name", with: "New title content"
                    fill_in "Description", with: "New description content"
                    fill_in "Location", with: "New location content"
                    fill_in "Sn", with: ""
                    fill_in "Mn", with: "New mn content"
                    fill_in "Lastpm", with: Faker::Date.between(from: 10.years.ago, to: Date.today) # I am using faker since the date can be quite particular in the format, this solves that
                end
                click_button "Submit"
                expect(page).to have_content("Sn can't be blank")
            end

            scenario "equipment shouldn't be successful - missing mn" do
                within("form.equipment-form") do
                    fill_in "Name", with: "New title content"
                    fill_in "Description", with: "New description content"
                    fill_in "Location", with: "New location content"
                    fill_in "Sn", with: "New sn content"
                    fill_in "Mn", with: ""
                    fill_in "Lastpm", with: Faker::Date.between(from: 10.years.ago, to: Date.today) # I am using faker since the date can be quite particular in the format, this solves that
                end
                click_button "Submit"
                expect(page).to have_content("Mn can't be blank")
            end

            scenario "equipment shouldn't be successful - missing lastpm" do
                within("form.equipment-form") do
                    fill_in "Name", with: "New title content"
                    fill_in "Description", with: "New description content"
                    fill_in "Location", with: "New location content"
                    fill_in "Sn", with: "New sn content"
                    fill_in "Mn", with: "New mn content"
                    fill_in "Lastpm", with: ""
                end
                click_button "Submit"
                expect(page).to have_content("Lastpm can't be blank")
            end

        end
    end

    # a different user story, as a user, I want to delete equipment, etc
    describe "Equipment - Delete" do
        # all happy scenarios, user fills in correctly and is allowed to update
        context "Happy Paths" do
            # as a pre-req/condition, new page (/equipment/new)
            before(:each) do
                @user = FactoryBot.create(:user)
                sign_in @user
                equipment = FactoryBot.create(:equipment)
                visit edit_equipment_path(equipment)
            end

            # happy path, equipment deleted
            scenario "equipment should be successful" do
                within("form.delete-form") do
                    fill_in "confirmation", with: "DELETE"
                    click_button "Delete" # not click_button, since this is not a button but a link with button text
                end
                expect(page).to have_content("Equipment was successfully destroyed.")
            end
        end

        context "Sad Paths" do
            # as a pre-req/condition, new page (/equipment/new)
            before(:each) do
                @user = FactoryBot.create(:user)
                sign_in @user
                equipment = FactoryBot.create(:equipment)
                visit edit_equipment_path(equipment)
            end

            # happy path, equipment made successfully, similar to above
            scenario "equipment should be successful" do
                within("form.delete-form") do
                    fill_in "confirmation", with: "d"
                    click_button "Delete" # not click_button, since this is not a button but a link with button text
                end
                expect(page).to have_content("Type 'DELETE' to delete:") # didnt delete, since that text is still there
            end
        end    
    end

    describe "Login" do
        context "Happy Paths" do
            scenario "should sign up" do
              visit root_path
              click_link 'Sign-Up'
              within("form") do
                fill_in "Email", with: "testing@test.com"
                fill_in "Password", with: "123456"
                fill_in "Password confirmation", with: "123456"
                click_button "Sign up"
              end
              expect(page).to have_content("Welcome! You have signed up successfully.")
            end
        
            scenario "should log in" do
              user = FactoryBot.create(:user)
              sign_in user
              visit root_path
              expect(page).to have_content("Logged in")
            end
        end      

        context "Sad Paths" do 
            scenario "shouldn't sign up -- missing email" do
              visit root_path
              click_link 'Sign-Up'
              within("form") do
                fill_in "Email", with: ""
                fill_in "Password", with: "123456"
                fill_in "Password confirmation", with: "123456"
                click_button "Sign up"
              end
              expect(page).to have_content("Email can't be blank")
            end

            scenario "shouldn't sign up -- missing password" do
                visit root_path
                click_link 'Sign-Up'
                within("form") do
                  fill_in "Email", with: "test@test.com"
                  fill_in "Password", with: ""
                  fill_in "Password confirmation", with: "123456"
                  click_button "Sign up"
                end
                expect(page).to have_content("Password can't be blank")
              end

            scenario "shouldn't sign up -- missing password confirmation" do
                visit root_path
                click_link 'Sign-Up'
                within("form") do
                    fill_in "Email", with: "test@test.com"
                    fill_in "Password", with: "123456"
                    fill_in "Password confirmation", with: ""
                    click_button "Sign up"
                end
                expect(page).to have_content("Password confirmation doesn't match Password")
            end
        end
    end


end
