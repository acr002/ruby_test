
require 'csv'

# log‚Í“ñŸŒ³”z—ñ‚É‚µ‚Ä“n‚µ‚Ä‚­‚¾‚³‚¢B
def put_log(ar, path = 'result.csv')
  element_count = ar.map{_1.size}.max
  header = (1..element_count).to_a.map{"parts_#{_1}"}
  id_num = 0
  CSV.open(path, 'w') do |c|
    c << %w(id).concat(header)
    ar.each do |e|
      id_num += 1
      c << e.unshift(id_num)
    end
  end
end
################################

__END__
log = []
log << %w(test buf status size)
log << [1, 2, 3, 4]
log << [1, 2, 3, 5]
log << [1, 2, 3, 6]
put_log(log, 'test log.csv')


