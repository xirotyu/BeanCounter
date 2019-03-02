require "./db.rb"

DB.create_table :cce do
  primary_key :id
  foreign_key :ccy_id
  String      :number
  String      :name
  String      :description
end

DB.create_table :cce_mutation do
  primary_key :id
  foreign_key :cce_id
  Date        :date
  String      :description
  BigDecimal  :value, size: [15,2]
end

DB.create_table :cce_balance do
  primary_key :id
  foreign_key :cce_id
  Date        :date
  BigDecimal  :value, size: [15,2]
end

DB.create_table :ccy do
  primary_key :id
  String      :iso_name
  String      :full_name
  Boolean     :primary
end

DB.create_table :ccy_rate do
  primary_key :id
  foreign_key :ccy_id
  Date        :date
  Integer     :type # accounting 1, tax 2
  BigDecimal  :value, size: [10,2]
end