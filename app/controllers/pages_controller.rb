class PagesController < ApplicationController
  def home
    if !Entry.last.blank?
      @month_entries = Entry.this_month
    end_of_month = Date.today.at_end_of_month.strftime('%d').to_f
    
    # get number of sober days for month
    @get_month_alc_free_days = @month_entries.select{ |entry|
      entry.drinks == 0
    }.count
    
    @sober_days_in_month = (( @get_month_alc_free_days / end_of_month) * 100).to_i

    # get sober days this year
    @sober_days_of_year = Entry.all.select { |entry|
      entry.drinks == 0
    }.count

  else return nil
  end
end
end
