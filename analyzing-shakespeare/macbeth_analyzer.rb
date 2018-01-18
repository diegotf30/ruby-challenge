require 'open-uri'
require 'nokogiri'

doc = Nokogiri::XML(open("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"))

speakers = Hash.new(0) #Speaker => no. of lines, starts at 0
speeches = doc.xpath('//SPEECH')

speeches.each do |speech|
  curr_speaker = speech.at_xpath('SPEAKER').content #Gets name of the current speaker
  unless curr_speaker == 'ALL'
    lines = speech.xpath('LINE') # Gets all the lines curr_speaker says
    speakers[curr_speaker] += lines.length
  end
end

speakers.each do |key, value|
    puts value.to_s + ' ' + key.capitalize
end