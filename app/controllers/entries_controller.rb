class EntriesController < ApplicationController
  def index
    @dates = (7.days.ago.to_date..Date.today)
  end

  def create
    input   = TimeEase::Input.new(*entry_params.values)
    unless input.valid?
      head 422 and return
    end
    parsed_entries = TimeEase::Parser.new(input).parse
    TimeEntry.update_or_create_by_date_with_multiple!(parsed_entries)
    @entries = TimeEntry.ordered
  end

  private

  def entry_params
    params.permit(:start_time, :end_time, :date, :things_done)
  end
end
