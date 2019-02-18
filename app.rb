require "roda"
require "./tools/tax_rate.rb"

class BeanCounter < Roda
  # plugin :render
  plugin :public
  route do |r|
    r.public
    r.root do
      r.redirect "index.html"
    end
    r.get "tax_rate", Integer, Integer, Integer do |year, month, day|
      tax_rate(year, month, day).to_json
    end
  end
end