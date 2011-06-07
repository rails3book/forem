require 'spec_helper'

describe "posts" do
  before do
    @topic = Forem::Topic.new(:subject => "First topic!")
    @topic.posts.build(:text => "First post!")
    @topic.save!
    sign_in!
  end
  
  it "reply to a topic" do
    visit topics_path
    click_link "First topic!"

    within ".forem_topic #posts .forem_post" do
      click_link "Reply"
    end

    fill_in "Text", :with => "First reply!"
    click_button "Create Post"

    within "#flash_notice" do
      page.should have_content("Post has been created!")
    end

    within ".forem_topic #posts .forem_post:last" do
      page.should have_content("First reply!")
    end
  end
end