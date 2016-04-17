# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

henry = Person.create({first_name: 'Henry', last_name: 'Armstrong', nick_name: 'Bo', birthday: DateTime.strptime('04/02/2010', '%m/%d/%Y')})
mattie = Person.create({first_name: 'Matthew', last_name: 'Armstrong', nick_name: 'Mattie', birthday: DateTime.strptime('12/24/2011', '%m/%d/%Y')})
mom = Person.create({first_name: 'Jan', last_name: 'Armstrong', nick_name: 'Mom', birthday: DateTime.strptime('11/01/1946', '%m/%d/%Y')})
dad = Person.create({first_name: 'Henry', last_name: 'Armstrong', nick_name: 'Dad', birthday: DateTime.strptime('11/27/1951', '%m/%d/%Y')})
