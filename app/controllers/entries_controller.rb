class EntriesController < ApplicationController
  def index
    @dates = (7.days.ago.to_date..Date.today)
  end

  def create
  end
end
