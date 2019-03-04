# Test if string will resolve to valid numeric value
# Found at mentalized.net on the world wide interwebs
class String
  def numeric?
    Float(self) != nil rescue false
  end
end
# --------------------------------
def validate_time(entry)
  unless entry.numeric?
    return false
  end

  if entry.to_f.abs > 24
    return false
  end

  return true
end
# --------------------------------
def get_a_new_time()
  puts %Q(
Sorry we need a numeric value between 0 and 24.
Remember that if you want to search for the nearest flight before
your departure time, put '-' in front of the time.

What time would you like to leave?
)
  return gets.chomp
end
# --------------------------------
def find_a_flight(time, schedule)
  if time < 0   #Before or = search
    # If time is before earliest, reset departure time to midnight
    if time.abs < schedule[0][1]
      time = 24
    end

    counter = schedule.count - 1
    while schedule[counter][1] > time.abs
      counter -= 1
    end

    puts %Q(
The flight closest to or before your desired time is:
Flight #{schedule[counter][0]} departing at #{schedule[counter][1]}
    )
  else   #After or = search
    # If time is later than last flight reset to after midnight
    if time > schedule[-1][1]
      time = 0
    end

    counter = 0
    while schedule[counter][1] < time
      counter += 1
    end

    puts %Q(
The flight closest to or after your desired time is:
Flight #{schedule[counter][0]} departing at #{schedule[counter][1]}
    )
  end

  if schedule[counter][1] == 24
    no_journey()
  end
end
# -------------------------------------
def no_journey()
  puts %Q(
One more thing...

I see what you did there. You entered a time that returns the midnight
flight as the search result. No doubt you are expecting some Journey
content to appear whereupon you will pump your fist and throw your head
around with abandon.

I'm sorry to do this, but there are a few points I have to make:
1: This is not a midnight train, it's a flight, specifically a space flight
2: This midnight *flight* is not going 'anywhere' - it's going to Pluto
3: Most importantly, Journey is one of those 'if you do not learn from the
    past ...' kind of things. There are bands for which wistful nostalgia
    is appropriate. Journey ain't one of those bands.

So...Live life. Take a journey. Take lots of journeys. But please, please,
please, for the love of all that is good and beautiful in this world -
NO MORE JOURNEY.

)

end
