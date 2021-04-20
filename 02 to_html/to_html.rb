# coding: cp932

require 'fileutils'
require 'H:/A/ruby/54_mcs_table/load_mcs.rb'
require 'H:/A/ruby/54_mcs_table/html_base.rb'
require 'H:/A/ruby/54_mcs_table/ranking_text.rb'
require 'H:\A\ruby\_github\02 to_html/work_html.rb'

def delimited(f)
  a = f.to_s.split('.')
  a[0] = a[0].reverse.gsub(/(\d{3})(?=\d)/, '\1,').reverse
  a.join('.')
end

def makedir_el(path)
  Dir.mkdir(path) unless Dir.exist?(path)
end

def ccfile
  h = {}
  Dir.glob('*.csv').each do |fn|
    basename = File.basename(fn, '.*')
    base = basename.to_sym
    company = basename[0, 3]
    job = basename[-3..-1]
    h[base] ||= Hash.new
    h[base][:basename] = basename
    h[base][:csv_name] = fn
    h[base][:company] = company
    h[base][:job] = job
    h[base][:path] ||= Hash.new
    h[base][:path][:base]     = "result/#{company}/"
    h[base][:path][:style]    = "result/#{company}/style/"
    h[base][:path][:elements] = "result/#{company}/elements/"
    h[base][:path][:job]      = "result/#{company}/elements/#{job}/"
    h[base][:path][:html]     = "result/#{company}/elements/#{job}/html/"
    h[base][:path][:js]       = "result/#{company}/elements/#{job}/js/"
    h[base][:path][:pdf]      = "result/#{company}/elements/#{job}/pdf/"
    h[base][:file] ||= Hash.new
    h[base][:file][:index] = "#{h[base][:path][:base]}index.html"
    h[base][:file][:style] = "#{h[base][:path][:style]}style01.css"
    h[base][:file][:gt]    = "#{h[base][:path][:html]}gt.html"
    h[base][:file][:cross] = "#{h[base][:path][:html]}cross.html"
    h[base][:file][:js]    = "#{h[base][:path][:js]}#{h[base][:basename]}.js"

    h[base][:link] ||= Hash.new
    h[base][:gt][:depth] = 4
    h[base][:cross][:depth] = 4
    h[base][:js][:depth] = 4
    h[base][:link][:gt][:main]     = "../../../index.html"
    h[base][:link][:gt][:style]    = "../../../style/style01.css"
    h[base][:link][:gt][:js]       = "../js/#{basename}.js"
    h[base][:link][:cross][:main]  = "../../../index.html"
    h[base][:link][:cross][:style] = "../../../style/style01.css"
    h[base][:link][:index][:style] = "style/style01.css"
    h[base][:link][:index][:gt]    = "elements/#{job}/html/gt.html"
    h[base][:link][:index][:cross] = "elements/#{job}/html/cross.html"
    h[base][:link][:index][:pdf]   = "elements/#{job}/html/cross.html"
  end
  h
end

def link_to(path_a, path_b)
  ar_a = path_a.split('/')
  ar_b = path_b.split('/')
  cn = 0
  same_depth = 0
  loop do
    cn += 1
    a = ar_a.next
    b = ar_b.next
    unless a == b
      same_depth = cn
      break
    end
  end
  "#{'../' * same_depth}#{ar_b[same_depth..-1].join('/')}"
end


class Hash
  def makedir
    self.each do |k_base, base|
      makedir_el('result')
      base[:path].each do |k, v|
        makedir_el(v)
      end
      FileUtils.cp('style01.css', "#{base[:path][:style]}")
    end
  end

  def put_html
    self.each do |k_base, base|
      csv = load_mcs(base[:csv_name])
      File.open("#{base[:file][:gt]}", 'w'){|f| f.puts html_gt(csv, base)}
      File.open("#{base[:file][:js]}", 'w'){|f| f.puts js_gt(csv)}
      File.open("#{base[:file][:cross]}", 'w'){|f| f.puts html_cross(csv)}
    end
  end
end

fns = ccfile
fns.makedir
fns.put_html

__END__

"result/"
"result/[company]/"
"result/[company]/style/"
"result/[company]/elements/"
"result/[company]/elements/[job]/"
"result/[company]/elements/[job]/html/"
"result/[company]/elements/[job]/js/"

