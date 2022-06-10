class Entry < ApplicationRecord
  attr_accessor :date
    scope :this_month, -> { where(created_at: Date.today.all_month) }

    # validates_presence_of :this_month
end