# frozen_string_literal: true

class Patient
  attr_reader :name
  attr_accessor :room, :id

  # :room -> represents an instance of Room

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @blood_type = attributes[:blood_type]
    # @room = something after .room is used
  end
end

pedro = Patient.new(blood_type: 'a', name: 'pedro')
# pedro.room = "Test"
ana = Patient.new(name: 'ana', cured: true)
