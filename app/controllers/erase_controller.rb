class EraseController < ApplicationController

  def destroy
    Event.delete_all
    Repo.delete_all
    Actor.delete_all
    render :json => {}, :status => 200, :content_type => 'application/json'
  end

end
