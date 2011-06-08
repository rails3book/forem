require 'spec_helper'

describe "topics" do
  context "authenticated users" do
    before do
      sign_in!
    end

    it "creating a new one" do
      visit topics_path
      click_link "New Topic"
      fill_in "Subject", :with => "First topic!"
      fill_in "Text", :with => "First post!"
      click_button "Create Topic"

      within "#flash_notice" do
        page.should have_content("Topic has been created!")
      end

      within ".forem_topic #posts .forem_post" do
        page.should have_content("First post!")
      end
      
      within ".forem_topic #posts .forem_post .user" do
        page.should have_content("forem_user")
      end
    end
  end
  
  context "unauthenticated users" do
    before do
      sign_out!
    end

    it "cannot see the 'New Topic' link" do
      visit topics_path
      page.should_not have_content("New Topic")
    end

    it "cannot begin to create a new topic" do
      visit new_topic_path
      page.current_url.should eql(sign_in_url)
    end
  end

end