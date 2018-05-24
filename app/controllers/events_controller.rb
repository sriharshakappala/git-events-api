class EventsController < ApplicationController

  def index
    @events = Event.includes(:actor, :repo).all.order(:uuid)
  end

  def create
    rawEvent = params
    event = Event.find_by_uuid rawEvent['id']
    if event.present?
      render :json => {}, :status => 400, :content_type => 'application/json'
    else
      actor = Actor.find_or_create_by(uuid: rawEvent['actor']['id'], login: rawEvent['actor']['login'], avatar_url: rawEvent['actor']['avatar_url'])
      lastEventAt = rawEvent['created_at']
      if actor.last_event_at.present? && ((actor.last_event_at.to_date + 1.day == rawEvent['created_at'].to_date) || (actor.last_event_at.to_date - 1.day == rawEvent['created_at'].to_date))
        maxStreak = actor.longest_streak + 1
      else
        maxStreak = 1
      end
      actor.update(last_event_at: lastEventAt, longest_streak: maxStreak)
      repo = Repo.find_or_create_by(uuid: rawEvent['repo']['id'], name: rawEvent['repo']['name'], url: rawEvent['repo']['url'])
      event = Event.create(uuid: rawEvent['id'], event_type: rawEvent['type'], actor_id: actor.id, repo_id: repo.id, occured_at: rawEvent['created_at'])
      render :json => {}, :status => 201, :content_type => 'application/json'
    end
  end

  def actors_events
    actor = Actor.find_by_uuid params[:actorID]
    if actor.nil?
      render :json => {}, :status => 404, :content_type => 'application/json'
    else
      @events = Event.joins(:actor, :repo).where('actors.uuid = ?', params[:actorID]).order(:uuid)
      render template: 'events/index'
    end
  end

end
