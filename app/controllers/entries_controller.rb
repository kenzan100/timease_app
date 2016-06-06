class EntriesController < ApplicationController
  def index
    dates_range = (7.days.ago.to_date..Date.today)
    entries = TimeEntry.where(date: dates_range).map { |e| e.to_output }
    inputs = TimeEase::RevParser.new(entries).parse
    @dates = dates_range.to_a.map { |date| [date, inputs.detect { |i| i.date == date.strftime }] }
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
