require 'rails_helper.rb'

feature "Blogger adds a forum post" do
    scenario "Blogger successfully navigates to the new forum page from the list forum page" do
        visit forums_path
        expect(page).to have_content("Forum")
        click_link "New post"
        expect(page).to have_content("New Forum Post")
        expect(page).to have_field("Title")
        expect(page).to have_field("Text")
    end
    
    scenario "Blogger succesfully creates a new forum post" do
        visit new_forum_path
        expect(page).to have_content("New Forum Post")
        fill_in "Title", with: "New Capybara Post"
        fill_in "Text", with: "This is a new capybara post"
        click_button "Save Forum"
        expect(page).to have_content("New Capybara Post")
        expect(page).to have_content("This is a new capybara post")
    end
    
    scenario "Blogger succesfully creates comment" do
        visit new_forum_path
        expect(page).to have_content("New Forum Post")
        fill_in "Title", with: "New Capybara Post"
        fill_in "Text", with: "This is a new capybara post"
        click_button "Save Forum"
        expect(page).to have_content("New Capybara Post")
        expect(page).to have_content("This is a new capybara post")
        fill_in "Commenter", with: "This is Capybara commenter"
        fill_in "Body", with: "This is the Capybara comment"
        click_button "Create Comment"
        expect(page).to have_content("This is Capybara commenter")
        expect(page).to have_content("This is the Capybara comment")
    end
    
    scenario "Blogger succesfully edits post" do
        visit new_forum_path
        expect(page).to have_content("New Forum Post")
        fill_in "Title", with: "New Capybara Post"
        fill_in "Text", with: "This is a new capybara post"
        click_button "Save Forum"
        expect(page).to have_content("New Capybara Post")
        expect(page).to have_content("This is a new capybara post")
        fill_in "Commenter", with: "This is Capybara"
        fill_in "Body", with: "This is the Capybara comment"
        click_button "Create Comment"
        expect(page).to have_content("This is Capybara")
        expect(page).to have_content("This is the Capybara comment")
        click_link "Forum List"
        click_link "Edit"
        fill_in "Title", with: "Edited Capybara Post"
        fill_in "Text", with: "This is an edited capybara post"
        click_button "Save Forum"
        expect(page).to have_content("This is Capybara")
        expect(page).to have_content("This is the Capybara comment")
        expect(page).to have_content("Edited Capybara Post")
        expect(page).to have_content("This is an edited capybara post")
    end
end