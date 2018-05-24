class ActorsController < ApplicationController

  def index
    @actors = Actor.all.order('events_count DESC, last_event_at DESC, login ASC')
  end

  def update
    rawActor = params
    actor = Actor.find_by_uuid rawActor['id']
    if actor.nil?
      render :json => {}, :status => 404, :content_type => 'application/json'
    elsif actor.login != params['login']
      render :json => {}, :status => 400, :content_type => 'application/json'
    else
      actor.update(avatar_url: params['avatar_url'])
      render :json => {}, :status => 200, :content_type => 'application/json'
    end
  end

  def streak
    @actors = Actor.all.order('longest_streak DESC, last_event_at DESC, login ASC')
    render template: 'actors/index'
  end

end
