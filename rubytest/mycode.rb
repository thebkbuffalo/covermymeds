require 'pry'
require 'date'

july_first_urls = []
other_urls = []
formatted_lines = {}
File.open('NASA_access_log_sample', 'r') do |f|
  f.each_line do |line|
    date = line.split('[')[1].split(']')[0]
    url = line.split(' /')[1].split('.html')[0]
    formatted_lines.store(date, url)
    if line.include?('1995-07-01')
      july_first_urls.push(url)
    else
      other_urls.push(url)
    end
  end
  puts '******************************'
  puts '*** formatted lines *********'
  puts '******************************'
  formatted_lines.each do |k,v|
    puts k + ' - ' + v
  end
  puts '*****************************************'
  puts '*** most searched questions *************'
  puts '*****************************************'
  most_searched_july_first = july_first_urls.group_by(&:to_s).values.max_by(&:size).first
  most_searched_july_first_count = july_first_urls.group_by(&:to_s).values.max_by(&:size).count
  puts 'Most searched for URL on July 1st 1995 is ' + most_searched_july_first + '. It appeared ' + most_searched_july_first_count.to_s + ' times.'

  most_searched_other = other_urls.group_by(&:to_s).values.max_by(&:size).first
  most_searched_other_count = other_urls.group_by(&:to_s).values.max_by(&:size).count
  puts 'Most search for URL on other dates is ' + most_searched_other + '. It appeared ' + most_searched_other_count.to_s + ' times.'

  
  puts '***********************************************'
  puts '**** server first questions set answers ******'
  puts '***********************************************'
  File.open('testfiles.txt', 'r') do |f|
    apollo = 0
    shuttle = 0
    f.each_line do |line|
      date = line.split('[')[1].split(']')[0].split('T')[0]
      url = line.split('GET')[1].split(' ')[0]
      puts date
      puts url
      split_get = line.split('GET')[1]
      if split_get.include?('apollo')
        apollo += 1
      else
        shuttle += 1
      end
    end
    if apollo > shuttle
      puts 'apollo more frequently searched'
    else
      puts 'shuttle more frequently searched'
    end
  end
end
