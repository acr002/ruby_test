
# eachÇ2âÒÇ©ÇØÇΩÇ‡ÇÃÇ≈Ç∑ÅB
keys = ['S17', 'S18', 'S19', 'S20', 'S21', 'S22', 'S23', 'S24', 'S25', 'S26', 'S27', 'S28', 'S30', 'S31', 'S32', 'S33', 'S34', 'S35', 'S36', 'S37', 'S38', 'S39', 'S40', 'S41', 'S42', 'S43', 'S44', 'S45', 'S46', 'S47', 'S48', 'S49', 'S50', 'S51', 'S52', 'S53', 'S54', 'S55', 'S56', 'S57', 'S58', 'S59', 'S60', 'S61', 'S62', 'S63', 'S64', 'S65', 'S66', 'S67']
File.open('result_each.txt', 'w') do |f|
  cn = 0
  keys.each do |e1|
    keys.each do |e2|
      unless e1 == e2
        cn += 1
        f.puts "CRS#{cn.to_s.rjust(4, '0')}#{e1}#{e2}"
      end
    end
  end

end
