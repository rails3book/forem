require 'spec_helper'

describe "posts" do
  before do
    @user = User.create!(:login => "some_guy")
    @topic = Forem::Topic.new(:subject => "First topic!", :user => @user)
    @topic.posts.build(:text => "First post!")
    @topic.save!
  end

  context "unauthenticated users" do
    before do
      sign_out!
    end
    
    it "cannot access the new action" do
      visit new_topic_post_path(@topic)
      page.current_url.should eql(sign_in_url)
    end
    
    it "should see the post count and last post details" do
      visit topics_path
      save_and_open_page
      within "#topics tbody td#posts_count" do
        page.should have_content("1")
      end

      within "#topics tbody td#last_post" do
        page.should have_content("last post was less than a minute ago by some_guy")
      end
    end
  end

  context "authenticated users" do
    before do
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
      
      within ".forem_topic #posts .forem_post:last .user" do
        page.should have_content("forem_user")
      end
    end
  end
end