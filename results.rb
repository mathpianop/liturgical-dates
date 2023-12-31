require './research.rb'
require './liturgical_date.rb'
include Research

sep_24_2023 = LiturgicalDate.new(DateTime.new(2023, 9, 24))
sep_24_2022 = LiturgicalDate.new(DateTime.new(2022, 9, 24))
sep_24_2021 = LiturgicalDate.new(DateTime.new(2021, 9, 24))
sep_24_2020 = LiturgicalDate.new(DateTime.new(2020, 9, 24))

mar_25_2023 = LiturgicalDate.new(DateTime.new(2023, 3, 25))
mar_25_2022 = LiturgicalDate.new(DateTime.new(2022, 3, 25))
mar_25_2021 = LiturgicalDate.new(DateTime.new(2021, 3, 25))
mar_25_2020 = LiturgicalDate.new(DateTime.new(2020, 3, 25))

puts ""
puts "I want to answer the question: how frequently does a given combination of liturgical variables occur?"
puts ""
puts "Outside of Lent, this is a question of combining day of the week, day of the year, and tone of the week."
puts ""
puts "During Lent, we have to factor in the number of weeks before Pascha as well."
puts ""
puts "=================="
puts ""
puts "First, to get our feet wet, let's look at the recurrences of the variables for Sunday, September 24, 2023, Tone 7 (the day I was asked this question) over the next 1000 years =>"
puts ""
puts common_years(sep_24_2023, 1000)
puts "Total: #{num_common_years(sep_24_2023, 1000)}"
puts ""
puts "So you can see that next occurrence is in just 5 years, but the next one not for over a century"
puts ""
puts "===================="
puts ""
puts "Next, let's look at the average gap between occurrences =>"
puts ""
puts "Average over 1000 years: #{1000/num_common_years(sep_24_2023, 1000)} years"
puts "Average over 10000 years: #{10000/num_common_years(sep_24_2023, 10000)} years"
puts ""
puts ""
puts ""
puts "Let's do the same for September 24, 2022 =>"
puts ""
puts "Average over 1000 years: #{1000/num_common_years(sep_24_2022, 1000)} years"
puts "Average over 10000 years: #{10000/num_common_years(sep_24_2022, 10000)} years"
puts ""
puts ""
puts ""
puts "And for the year before that =>"
puts ""
puts "Average over 1000 years: #{1000/num_common_years(sep_24_2021, 1000)} years"
puts "Average over 10000 years: #{10000/num_common_years(sep_24_2021, 10000)} years"
puts ""
puts ""
puts ""
puts "And once more =>"
puts ""
puts "Average over 1000 years: #{1000/num_common_years(sep_24_2020, 1000)} years"
puts "Average over 10000 years: #{10000/num_common_years(sep_24_2020, 10000)} years"
puts ""
puts ""
puts ""
puts "So trial & error suggests that the average gap between combos for non-Lenten dates is ~30 years"
puts ""
puts "================"
puts ""
puts "Now let's do the same thing, but for a date in Lent (namely, Annunciation 2023) =>"
puts ""
puts "Average over 1000 years: #{1000/num_common_years(mar_25_2023, 1000)} years"
puts "Average over 10000 years: #{10000/num_common_years(mar_25_2023, 10000)} years"
puts ""
puts ""
puts ""
puts "Let's do the same for Annunciation 2022 =>"
puts ""
puts "Average over 1000 years: #{1000/num_common_years(mar_25_2022, 1000)} years"
puts "Average over 10000 years: #{10000/num_common_years(mar_25_2022, 10000)} years"
puts ""
puts ""
puts ""
puts "And for the year before that =>"
puts ""
puts "Average over 1000 years: #{1000/num_common_years(mar_25_2021, 1000)} years"
puts "Average over 10000 years: #{10000/num_common_years(mar_25_2021, 10000)} years"
#puts "Average over 1000000 years: #{1000000/num_common_years(mar_25_2021, 1000000)} years"
puts ""
puts ""
puts ""
puts "And once more =>"
puts ""
puts "Average over 1000 years: #{1000/num_common_years(mar_25_2020, 1000)} years"
puts "Average over 10000 years: #{10000/num_common_years(mar_25_2020, 10000)} years"
puts ""
puts ""
puts ""
puts "So here we have way more variance: the average gap can vary between 50 and 500 years. I think this is because Pascha favors some dates more than others."
puts ""
puts ""
puts "==========="
puts ""
puts "And finally, here is the distribution of Pascha dates for the next 10,000 years =>"
puts ""


print_frequency_of_pascha_per_date(10000)
