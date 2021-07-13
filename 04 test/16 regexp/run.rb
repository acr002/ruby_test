
# text = <<BUF
# comment
# /* comment body
# ******************************
# //////////////////////////////
# comment end */
# BUF
# p text
# pat = %r{\/\*[^\*]*\*+(([^\*\/][^\*]*)\*+)*\/}
# pat = %r{\/\*(?~\*\/)\*\/}
# p text.match(pat)

# text.match(pat) do |e|
#   p $1
# end

text = "/* comments */"
pat = %r{\/\*(.*?)\*\/}
p text.match(pat)
################################

