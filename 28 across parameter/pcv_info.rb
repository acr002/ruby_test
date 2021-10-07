
# load cm
# put apf
# put cross

# h = {}
# h[:key] = h1
# h1[:cts] = {ct1: text, ct2: text, ct3: text,,,}
# h1[:title] = ''
# h1[:type]
# h1[:same_key]
# h1[:select] = {select1: {key: 'S01', ct: 1}, select2: {key: 'S02', ct: 1},,}

cm = {}
Dir.glob('*.cm') do |fn|
  File.foreach(fn) do |line|
    a = line.strip
    next if a.empty?
    next if a.start_with?('*')
    next unless a.start_with?('CM', 'TM')
    # •K—v‚Èî•ñ‚ğŠi”[‚·‚é
    key = a[2, 3].upcase.to_sym
    num = a[5, 2].to_i
    # text = a[]   # ‘SŠp•¶š—ñ‚È‚Ì‚Å

    cm[key]

  end
end




