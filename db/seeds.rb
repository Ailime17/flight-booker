# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: '"St'ar Wars" }, { name: '"Lo'rd of the Rings" }])
#   Character.create(name: '"Lu'ke", movie: 'mov'ies.first)

# Airport.create(code: 'TNR')
# Airport.create(code: 'NYC')
# Airport.create(code: 'ATH')
# Airport.create(code: 'ATL')
# Airport.create(code: 'WAW')
# Airport.create(code: 'WIC')
# Airport.create(code: 'LCY')
# Airport.create(code: 'LWO')

Flight.create(arrival_airport_id: 8, departure_airport_id: 2, duration_in_hours: 4.15, date: DateTime.now + 1.month + 12.hours)
Flight.create(arrival_airport_id: 7, departure_airport_id: 3, duration_in_hours: 8.0, date: DateTime.now + 1.year + 12.hours)
Flight.create(arrival_airport_id: 6, departure_airport_id: 4, duration_in_hours: 2.45, date: DateTime.now + 2.years + 7.hours)
Flight.create(arrival_airport_id: 4, departure_airport_id: 5, duration_in_hours: 4.50, date: DateTime.now + 2.months + 7.hours)
Flight.create(arrival_airport_id: 5, departure_airport_id: 6, duration_in_hours: 3.45, date: DateTime.now + 7.months)
Flight.create(arrival_airport_id: 3, departure_airport_id: 7, duration_in_hours: 12.0, date: DateTime.now + 2.months + 12.hours)
Flight.create(arrival_airport_id: 2, departure_airport_id: 8, duration_in_hours: 7.30, date: DateTime.now)
Flight.create(arrival_airport_id: 1, departure_airport_id: 2, duration_in_hours: 11.0, date: DateTime.now + 11.weeks)