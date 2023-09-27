require 'greek_easter'
require 'date'




class LiturgicalDate

attr_reader :date
attr_reader :weeks_after_pascha

  def get_tone
    (((self.date - previous_easter)/7).to_i) % 8
  end

  def is_same_basic(other_date)
    has_same_tone?(other_date) && 
    is_same_day_of_week?(other_date) &&
    is_same_day_of_year?(other_date)
  end

  def is_same_as(other_date)
    if !is_in_paschalion?
      is_same_basic(other_date)
    else
      is_same_basic(other_date) && is_same_week_after_pascha(other_date)
    end
  end

  def calc_weeks_after_pascha(date)
    ((date - current_year_easter)/7).to_i
  end

  def is_in_paschalion?
    return @weeks_after_pascha > -12 && @weeks_after_pascha < 8
  end

  

  def previous_easter
    previous_year_easter = easterDate(@date.prev_year.year)
    return (current_year_easter < @date ? current_year_easter : previous_year_easter)
  end

  def current_year_easter
    easterDate(@date.year)
  end


  def initialize(date)
    @date = date
    @weeks_after_pascha = calc_weeks_after_pascha(date)
  end

  def next_year(n)
    if n.nil?
      LiturgicalDate.new(@date.next_year)
    else
      LiturgicalDate.new(@date.next_year(n))
    end
  end

  private

  #Get easter date as DateTime object
  def easterDate(year)
    DateTime.parse(GreekEaster.easter(year).to_s)
  end

  def has_same_tone?(other_date)
    self.get_tone == other_date.get_tone
  end

  def is_same_day_of_week?(other_date)
    self.date.wday == other_date.date.wday
  end

  def is_same_day_of_year?(other_date)
    self.date.month == other_date.date.month && self.date.day == other_date.date.day
  end

  def is_same_week_after_pascha(other_date)
    other_date.weeks_after_pascha == self.weeks_after_pascha
  end
end

