
# •¶š—ñ‚ğto_sym‚µ‚Ä‚àHash‚Ìkey‚Æ‚µ‚Äg—p‚Å‚«‚Ü‚·B
h = {}
h[:ct1] = 'text1'
h[:ct4] = 'text4'
h[:ct2] = 'text2'
h[:ct5] = 'text5'
h[:ct3] = 'text3'

pp h
(1..(h.size)).each do |i|
  p h["ct#{i}".to_sym]
end
################################

a = 'CMS01'
p a.start_with?('CM', 'TM')
################################



