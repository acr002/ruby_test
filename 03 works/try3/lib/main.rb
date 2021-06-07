#-----------------------------------------------------------[date: 2021.06.07]

require 'H:/A/ruby/_github/03 works/try3/lib/load_apf.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/load_para.rb'
require 'H:/A/ruby/_github/03 works/try3/lib/load_ol.rb'

def load_files
  fc = {}
  fc[:apf] = load_apf
  fc[:para], fc[:tables] = load_parameter
  fc
end

def works(fc, line)
  vars = pickup_var(fc)
  fc[:ol] = set_ol(fc, vars, line)
  fc[:para].each do |e|
    case e[:type]
    when :if
    when :unless
    when :do
    end
  end
  retouch(fc[:ol], line)
end



