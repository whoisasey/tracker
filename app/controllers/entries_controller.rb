require 'date'
require "active_support"
require "active_support/core_ext/date/calculations"

# ActiveRecord::Base.connection.reset_pk_sequence!('Entries')
class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    if !Entry.last.blank?
    @start_date = Entry.last.created_at
    @current = ((DateTime.new(2022,3,24))...(@start_date)).count
    end_of_month = Date.today.at_end_of_month.strftime('%d').to_f

    get_alc_free_days = @entries.select{ |entry|
        entry.drinks != 0
    }.count

    last_entry = @start_date.strftime('%d').to_f
    
    # get percentage of sober days for month
    @sober_days_in_month = (((last_entry - get_alc_free_days) / end_of_month) * 100).to_i
    # take last entry date - days with drinks logged
    # total / #days in month * 100
    
    # @sober_days_of_year = (((last_entry - get_alc_free_days) / (Date.today.end_of_year.strftime('%d').to_f)) * 100)
    # binding.break
    
    # get percentage of sober days for year
  else return nil
  end
  end

  def create
    @entry = Entry.new(params.require(:entry).permit(:drinks, :log, :created_at))
    @entry.save
    redirect_to entries_path
  end
end
