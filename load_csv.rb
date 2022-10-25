# frozen_string_literal: true

require 'csv'
require_relative 'patient'


patients = []

# hearders :first_row -> turns array into CSV::ROW which behaves as a hash
CSV.foreach('patients.csv', headers: :first_row, header_converters: :symbol) do |row|
  row[:id] = row[:id].to_i
  # row[:name]
  row[:cured] = row[:cured] == 'true'
  # row[:blood_type]
  row[:room] = row[:room_id].to_i
  p row
  # Patient.new(name: row[:name], blood_type: row[:blood_type] ....)
  patients << Patient.new(row)

  # IF blood_type
  # if new_patient.blood_type == "a"
  #   patients << new_patient
  # end
end
