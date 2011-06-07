require 'spec_helper'

describe "topics" do
  it "creating a new one" do
    visit topics_path
    click_link "New Topic"
    fill_in "Subject", :with => "First topic!"
    fill_in "Text", :with => "First post!"
    click_button "Create Topic"

    within "#flash_notice" do
      page.should have_content("Topic has been created!")
    end
    
    within ".topic #posts .post" do
      page.should have_content("First post!")
    end
  end

end