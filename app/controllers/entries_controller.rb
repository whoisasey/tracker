require 'date'
require "active_support"
require "active_support/core_ext/date/calculations"

# ActiveRecord::Base.connection.reset_pk_sequence!('Entries')
class EntriesController < ApplicationController
  def index
    @entries = Entry.all.sort_by(&:updated_at)
  end

  def create
    @entry = Entry.new(params.require(:entry).permit(:drinks, :log, :updated_at))
    drinks = params[:entry][:drinks].to_i
    date = params[:entry][:date].to_date
    @entry.updated_at = date
    @entry.drinks = drinks
    @entry.save!
    # binding.break
    redirect_to root_path
  end
end
