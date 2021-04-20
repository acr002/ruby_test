# coding: cp932

def html_gt(csv, base)
  gt = []
  html_head(gt)
  gt << "<script type=\"text/javascript\" src=\"../js/#{base[:basename]}.js\"></script>"
  width_bar = 33
  csv.each do |k_h, table|
    gt << '<section>'
    gt << table[:face][:title].tag(:h1)
    gt << '<table class="gt-table">'
    gt << '<tr>'
    gt << '<td></td><td>total</td>'
    gt << table[:data][0][:count][:add][:total].tag(:td)
    gt << table[:data][0][:percent][:add][:total].tag(:td)
    gt << '</tr>'
    ar = []
    (1..table[:face][:cts]).each do |i|
      gt << '<tr>'
      gt << i.to_s.tag(:td)
      gt << table[:face][:ct_texts][i].tag(:td)
      gt << "#{table[:data][0][:count][:data][i]}件".tag(:td)
      gt << "#{table[:data][0][:percent][:data][i]}%".tag(:td)
      gt << '</tr>'
    end
    gt << '<tr>'
    gt << '<td></td><td>N/A</td>'
    gt << table[:data][0][:count][:add][:na].tag(:td)
    gt << table[:data][0][:percent][:add][:na].tag(:td)
    gt << '</tr>'
    gt << '</table>'
    gt << "<canvas id=\"#{k_h}\" width=\"420\" height=\"#{(table[:face][:cts] + 1) * width_bar + 8}\"></canvas>"
    gt << table.analysis_comment
    gt << '</section>'
  end
  html_foot(gt)
  gt
end

def js_gt(csv)
  js = []
  js << 'window.onload = function(){'
  width_bar = 33
  csv.each do |k_h, table|
    js << "var cv= document.getElementById('#{k_h}');"
    js << "var ctx= cv.getContext('2d');"
    js << 'if(!cv||!cv.getContext){return false;}'
    js << 'ctx.fillStyle = "rgb(70, 130, 180)";'
    js <<  "ctx.font = \"12px serif\";"
    ar = []
    (1..table[:face][:cts]).each do |i|
      position_w = table[:data][0][:percent][:data][i] * 4
      position_h = (i - 1) * width_bar + 4
      js <<  "ctx.fillRect(4, #{position_h}, #{position_w}, #{width_bar - 6});"
      js <<  "ctx.fillText(\"#{table[:data][0][:percent][:data][i]}%\", #{position_w + 8}, #{position_h + 16});"
    end
    js << 'ctx.fillStyle = "rgb(198, 198, 198)";'
    js <<  "ctx.fillRect(4, #{(table[:face][:cts]) * width_bar + 4}, #{table[:data][0][:percent][:add][:na].to_f * 4}, #{width_bar - 4});"
  end
  js << '}'
  js
end

def html_cross(csv)
  cross = []
  html_head(cross)
  csv.each do |k_h, table|
    cross << '<section>'
    cross << table[:face][:title].tag(:h1)
    cross << '<table class="cross-table">'
    cross << '<tr>'
    cross << '<th></th><th>件数</th>'
    (1..table[:face][:cts]).each do |i|
      cross << "[#{i}]".tag(:th)
    end
    cross << '<th>無回答</th></tr>'
    table[:data].each do |k_side, side|
      cross << side[:count][:add][:title].tag(:th, rowspan: '2')
      cross << "#{delimited(side[:count][:add][:total])}件".tag(:td, class: 'count')
      side[:count][:data].each do |k_ct, ct|
        cross << "#{delimited(ct)}件".tag(:td, class: 'count')
      end
      cross << "#{delimited(side[:count][:add][:na])}件".tag(:td, class: 'count')
      cross << '</tr><tr>'
      # cross << side[:percent][:add][:title].tag(:td)
      cross << "#{side[:percent][:add][:total]}%".tag(:td, class: 'percent')
      side[:percent][:data].each do |k_ct, ct|
        cross << "#{ct}%".tag(:td, class: 'percent')
      end
      cross << "#{side[:percent][:add][:na]}%".tag(:td, class: 'percent')
      cross << '</tr>'
    end
    cross << '</table>'
    cross << '<table>'
    (1..table[:face][:cts]).each do |i|
      cross << '<tr>'
      cross << "[#{i}]".tag(:td)
      cross << table[:face][:ct_texts][i].tag(:td)
      cross << '</tr>'
    end
    cross << '</table></section>'
  end
  html_foot(cross)
  cross
end

