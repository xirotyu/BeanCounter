require 'httparty'
require 'nokogiri'


def tax_rate(year,month,day)
  
  parse_page = Nokogiri::HTML(HTTParty.get("https://pusatdata.kontan.co.id/makroekonomi/kurs_pajak?tanggal=#{day}&bulan=#{month}&tahun=#{year}"))
  table_rate = parse_page.css('div[class^="tabel_baris"]')
  
  rate = []

  table_rate.each do |t|
    divide = t.children[7].inner_text.to_f
    rate.push(
      :iso_name => t.children[1].inner_text,
      :full_name => t.children[3].inner_text,
      :value => t.children[11].inner_text.sub(",","").to_f/divide,
      :date => "#{year}-#{month.to_s.rjust(2,"0")}-#{day.to_s.rjust(2,"0")}"
    )
  end
  return rate
end
