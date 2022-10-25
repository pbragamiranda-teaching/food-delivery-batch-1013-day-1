# frozen_string_literal: true

require_relative 'patient'

class Room
  attr_accessor :id

  def initialize(attributes = {})
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def add(patient)
    raise StandardError, 'Room is full!' if full?

    # I need to update patient with the right room
    patient.room = self
    @patients << patient
  end

  def full?
    @capacity == @patients.size
  end
end

room1 = Room.new(capacity: 2)

pedro = Patient.new(blood_type: 'a', name: 'pedro')
ana = Patient.new(name: 'ana', cured: true)
nicola = Patient.new(name: 'nicola', cured: true)

puts 'Adding pedro...'
room1.add(pedro)
# p room1

puts "#{pedro.name} is at room #{pedro.room}"

# puts ""
# puts ""
# puts ""

# puts "adding ana..."
# room1.add(ana)
# p room1

# puts ""
# puts ""
# puts ""

# puts "trying to add nicola"
# room1.add(nicola)

# puts ""
# puts ""
# puts ""

# puts "Room 1"
# p room1
