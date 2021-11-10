
# hash‚Ékey‚ª‘¶İ‚µ‚È‚¢ê‡‚Í||=‚Å‰Šú‰»‚Å‚«‚Ü‚·B
h = {}
a = %w(S01 S02 M01 R01 R02 M01 M01).map(&:to_sym)
b = [1, nil, 2, 12, 0, 4, 5]
c = a.zip(b)
c.each do |e|
  key = e[0]
  val = e[1]
  next if val.nil?
  h[key] ||= []
  h[key] << val
end
p h
################################





