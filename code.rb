require_relative "a_better_journey"


# ----------------------------------------
# Main

# Brute force population of timetable
# Timetable entered out of order to verify sort
timetable = [\
  [1, 2.0],\
  [2, 5.0],\
  [9, 14.5],\
  [3, 7.5],\
  [4, 8.5],\
  [5, 9.0],\
  [6, 10.0],\
  [7, 11.5],\
  [8, 13.5],\
  [10, 17.0],\
  [11, 18.0],\
  [12, 19.0],\
  [13, 24.0]]

# Sort timetable by departure time
# Useful if hierarchy of times and flight numbers is not correlated
timetable.sort!{|x,y| x[1] <=> y[1]}

puts %Q(
This cleverly engineered bit of code will search for flight times for you.
All you have to do is enter a search time in decimal hour format.

The default is to search for the time closest to or later than your departure
time. If you would like to search for times *before* or the same as your
departure time, all you have to do is put a '-' in front of your time.

What time would you like to leave?
)
dep_time = gets.chomp

until validate_time(dep_time)
  dep_time = get_a_new_time()
end

find_a_flight(dep_time.to_f, timetable)

# ------------------------------------------
