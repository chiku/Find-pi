#!/usr/bin/env ruby

require 'csv'

collection = {}
SAMPLE_SIZE = [1, 10, 100, 1_000, 10_000, 100_000].map(&:to_s)

Dir.glob('**/*.csv').each do |file|
  language, category, extension = file.split "."
  language = File.basename(language).capitalize
  collection[category] = [language]

  data = CSV::read file
  SAMPLE_SIZE.each do |traced_size|
    value = data.detect {|d| d.first == traced_size}
    collection[category] << (value ? "#{value.last}%" : "N.A.")
  end
end

collection.each do |category, data|
  f = File.open "output/#{category}.markdown", "w+"
  f.write "| Language | " + SAMPLE_SIZE.join(" | ") + " |\n"
  f.write "| --- | " + " ---:|" * SAMPLE_SIZE.size + "\n"
  f.write "| " + data.join(" | ") + " |\n"
  f.close
end

