require "sequel"
require "sqlite3"

DB = Sequel.connect("sqlite://beancounter.db")