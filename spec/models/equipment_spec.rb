require "rails_helper"
# factorybot build does not save the created instance, factorybot create does
# describe and context are fundamentally the same, they both structure tests can be thought of as a heading and subheading
# describe the equipment model attributes tests when creating
describe "Equipment Attribute Requirements on Create", :type => :model do
    # a grouping of all of the validation tests for the model attributes
    context "good validation tests" do
        # good check, does it have both the title and description?
        it "should be able to save equipment when have base properties, name, desc, location, sn, mn, lastpm" do
            equipment = FactoryBot.build(:equipment)
            expect(equipment.save).to eq(true)
        end
    end
    context "bad validation tests" do
        # test for missing name, difference between .save and .valid? is valid runs validity checks defined in the model
        # while .save runs validity checks in addition to writing changes to the database
        # test for missing name - save check
        it "should not be able to save equipment when name missing" do
            equipment = FactoryBot.build(:equipment, name: "")
            expect(equipment.save).to eq(false)
        end
        # missing description - save check
        it "should not be able to save equipment when description missing" do
            equipment = FactoryBot.build(:equipment, description: "")
            expect(equipment.save).to eq(false)
        end
        # missing location - save check
        it "should not be able to save equipment when location missing" do
            equipment = FactoryBot.build(:equipment, location: "")
            expect(equipment.save).to eq(false)
        end
        # missing sn - save check
        it "should not be able to save equipment when sn missing" do
            equipment = FactoryBot.build(:equipment, SN: "")
            expect(equipment.save).to eq(false)
        end
        # missing mn - save check
        it "should not be able to save equipment when mn missing" do
            equipment = FactoryBot.build(:equipment, MN: "")
            expect(equipment.save).to eq(false)
        end
        # missing lastpm - save check
        it "should not be able to save equipment when lastpm missing" do
            equipment = FactoryBot.build(:equipment, lastpm: "")
            expect(equipment.save).to eq(false)
        end
    end
end
# describe the equipment model attributes tests when editing, :type => :model enables model helper functions
describe "Equipment Attribute Requirements on Edit", :type => :model do
    # All of the tests for editing equipment
    context "good validation tests" do
        # good check, does it have all base properties?
        it "should be able to save equipment when have base properties, name, desc, location, sn, mn, lastpm" do
            equipment = FactoryBot.build(:equipment)
            expect(equipment.save).to eq(true)
        end
    end
    context "bad validation tests" do
        # missing name - save check
        it "should not be able to save equipment when name missing" do
            equipment = FactoryBot.build(:equipment, name: "")
            expect(equipment.save).to eq(false)
        end
        # missing description - save check
        it "should not be able to save equipment when description missing" do
            equipment = FactoryBot.build(:equipment, description: "")
            expect(equipment.save).to eq(false)
        end
        # missing location - save check
        it "should not be able to save equipment when location missing" do
            equipment = FactoryBot.build(:equipment, location: "")
            expect(equipment.save).to eq(false)
        end
        # missing sn - save check
        it "should not be able to save equipment when sn missing" do
            equipment = FactoryBot.build(:equipment, SN: "")
            expect(equipment.save).to eq(false)
        end
        # missing mn - save check
        it "should not be able to save equipment when mn missing" do
            equipment = FactoryBot.build(:equipment, MN: "")
            expect(equipment.save).to eq(false)
        end
        # missing lastpm - save check
        it "should not be able to save equipment when lastpm missing" do
            equipment = FactoryBot.build(:equipment, lastpm: "")
            expect(equipment.save).to eq(false)
        end
    end
    context "Edit equipment" do 
        # Before each 'it' or test, create an equipment object to be operated on
        before (:each) do
            @equipment = FactoryBot.build(:equipment)
        end
        # Update the name and ensure the changes are saved
        it "ensures the name is present when editing equipment" do
            @equipment.update(:name => "New name")
            expect(@equipment.name).to eq ("New name")
        end
        # Update the description and ensure the changes are saved
        it "ensures the description is present when editing equipment" do
            @equipment.update(:description => "New Description ♣")
            expect(@equipment.description).to eq ("New Description ♣")
        end
        # Update the location and ensure the changes are saved
        it "ensures the location is present when editing equipment" do
            @equipment.update(:location => "New location ♣")
            expect(@equipment.location).to eq ("New location ♣")
        end
        # Update the sn and ensure the changes are saved
        it "ensures the sn is present when editing equipment" do
            @equipment.update(:SN => "New sn ♣")
            expect(@equipment.SN).to eq ("New sn ♣")
        end
        # Update the mn and ensure the changes are saved
        it "ensures the mn is present when editing equipment" do
            @equipment.update(:MN => "New mn ♣")
            expect(@equipment.MN).to eq ("New mn ♣")
        end
        # Update the lastpm and ensure the changes are saved
        it "ensures the lastpm is present when editing equipment" do
            time = Faker::Date.between(from: 10.years.ago, to: Date.today)
            @equipment.update(:lastpm => time)
            expect(@equipment.lastpm).to eq (time)
        end
    end
end