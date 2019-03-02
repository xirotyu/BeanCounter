require "./db.rb"

# class CCE < Sequel::Model(:cce)
# end

# class CCEMutation < Sequel::Model(:cce_mutation)
# end

class CCY < Sequel::Model(:ccy)
  one_to_many :ccy_rate, key: :ccy_id
end

class CCYRate < Sequel::Model(:ccy_rate)
  many_to_one :ccy, key: :ccy_id
end