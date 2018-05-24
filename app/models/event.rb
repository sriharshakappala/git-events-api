class Event < ActiveRecord::Base
  belongs_to :actor, counter_cache: true
  belongs_to :repo
end
