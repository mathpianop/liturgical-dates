module Research



  def common_years(lit_date, range)

    (1...range).each do |n|
      nth_year = lit_date.next_year(n)

      if nth_year.is_same_as(lit_date)
        p nth_year.date.year
      end
      
    end
    puts
  end



  def num_common_years(lit_date, range)

    (1...range).inject(0) { |total, n|
      nth_year = lit_date.next_year(n)

      if nth_year.is_same_as(lit_date)
        total + 1
      else
        total
      end
    }
  end



  def average_gap_between_years(lit_date, range)
    range / num_common_years(lit_date, range)
  end



  def print_frequency_of_pascha_per_date(range)
    stats = {}

    (1...range).each do |n|
      easter_date = DateTime.parse(GreekEaster.easter(2023 + n).to_s).strftime("%m/%d")
   

      if stats[easter_date]
        stats[easter_date] = stats[easter_date] + 1
      else
        stats[easter_date] = 1
      end
    end

    stats_array = stats.map {|easter_date, total| [easter_date, total]}

    ordered_stats = stats_array.sort do |day1, day2| 
      if day1[0].slice(1) === day2[0].slice(1)
        day1[0].slice(3,4) <=> day2[0].slice(3,4)
      else
        day1[0].slice(1) <=> day2[0].slice(1)
      end
    end

    ordered_stats.each do |day| 

      puts "#{day[0]}   #{day[1]}"

    end

  end

end

