# frozen_string_literal: true
require 'csv'
require_relative './patient'

class PatientRepository

  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @room_repository = room_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def add(new_patient)
    # set the id of new_patient
    new_patient.id = @next_id
    @patients << new_patient
    @next_id += 1
    # save_csv TODO!
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      row[:room] = @room_repository.find(row[:room_id].to_i)
      @patients << Patient.new(row)
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
    # if @patients.empty?
    #   @next_id = 1
    # else
    #  @next_id = @patients.last.id + 1
    # end
  end
end

patient_repo = PatientRepository.new('patients.csv')
edward = Patient.new(name: 'Edward', blood_type: 'ab')
patient_repo.add(edward)

livia = Patient.new(name: 'livia')
patient_repo.add(livia)

p patient_repo
