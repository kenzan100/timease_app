class RawEntriesController < ApplicationController

  class TimeEaseInputNotValid < StandardError; end

  def index
    @raw_entries = RawEntry.latests
  end

  def create
    raw_entry = RawEntry.new(raw_entry_params)
    raw_entry_saved = raw_entry.save
    unless raw_entry_saved
      render_406_with(raw_entry) and return
    end
    create_or_update_timease_entry
  rescue TimeEaseInputNotValid
    head 422 and return
  end

  def update
    raw_entry = RawEntry.find(params[:id])
    updated = raw_entry.update_attributes(raw_entry_params)
    unless updated
      render_406_with(raw_entry) and return
    end
    create_or_update_timease_entry
    render "create.js"
  rescue TimeEaseInputNotValid
    head 422 and return
  end

  private

  def raw_entry_params
    params.require(:raw_entry).permit(:start, :end, :date, :things)
  end

  def create_or_update_timease_entry
    timease_input = TimeEase::Input.new(*raw_entry_params.values)
    unless timease_input.valid?
      raise TimeEaseInputNotValid
    end
    parsed_entries = TimeEase::Parser.new(timease_input).parse
    TimeEntry.update_or_create_by_date_with_multiple!(parsed_entries)
    @entries = TimeEntry.ordered
  end

  def render_406_with(entry)
    render text: raw_entry.errors.full_messages.join(", "), status: 406
  end
end
