
gc = load_text
apf = load_apf

gc.each do |line|
  h[:s01] = line.to_x(:s01)
  h[:s02] = line.to_x(:s02)
  h[:s02].clear if h[:s01].include?(1)
  h[:s01].add(1) unless h[:s02].empty?
end





