require "./db.rb"

class CCE < Sequel::Model(DB[:cce])
  one_to_many :account_mutation, key: :account_id
end

class CCEMutation < Sequel::Model(DB[:cce_mutation])
  many_to_one :account, key: :account_id
end