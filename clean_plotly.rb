#!/usr/bin/env ruby

require 'nokogiri'
require 'pry'
require 'json'

arg = ARGV[0]

html_files = Dir.glob('visuals/*/**.html')

def json_files
  return Dir.glob('visuals/*/**.json')
end


def hash_from_plotly_html_file_path(file_path)
  file = open(file_path)
  parsed_file = Nokogiri::HTML.parse(file)
  rough_cut = parsed_file.xpath('//script').to_s.match(/\[{.*}/)
  parseable_string  = "[" + rough_cut.to_s + "]"
  data = JSON.parse(parseable_string)
  return data
end

def save_json_to_file(output_hash, original_file_path)
  json_file_path = original_file_path.gsub(".html",".json")

  File.open(json_file_path,"w") do |f|
    f.write(JSON.pretty_generate(output_hash))
  end
end

def process_all_plotly_html(html_files)
  html_files.each do |file_path|
    h = hash_from_plotly_html_file_path(file_path)
    save_json_to_file(h, file_path)
  end
end

case arg
when "process_plotlys"
  p "Processing Plotly to JSON"
  process_all_plotly_html(html_files)
when "pry"
  Binding.pry
else
  p "No valid argument (try process_plotlys)"
end
