class FakeController < ApplicationController
  def sign_in
    render :text => "Placeholder login page."
  end
end