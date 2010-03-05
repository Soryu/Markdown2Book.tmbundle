#!/usr/bin/env ruby

STDIN.each_line do |line|
  line.gsub!(/<img(?![^>]*?(?:width|height)=)[^>*]src="(.*?)"/) do |tag|
    size = %x(sips -g pixelWidth -g pixelHeight "#{$1}")
    size.gsub(/pixel(Width|Height): (\d+)/) { |str| tag += " #{$1.downcase}=\"#{$2}\"" }
    # use the next line to change the image path
    # tag.gsub(/src="([^"]+)"/, 'src="http://yoursite.com/path/to/images/\1"')
    tag.gsub(/src="([^"]+)"/, 'src="\1"')
  end
  print line
end
