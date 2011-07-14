#!/usr/bin/env ruby

require 'csv'

collection = {}
SAMPLE_SIZE = [1, 10, 100, 1_000, 10_000, 100_000].map(&:to_s)

Dir.glob('output/*.csv').each do |file|
  language, category, extension = file.split "."
  language = File.basename(language).capitalize
  collection[category] ||= {}
  collection[category][language] ||= []

  data = CSV::read file
  SAMPLE_SIZE.each do |traced_size|
    value = data.detect {|d| d.first == traced_size}
    collection[category][language] << (value ? "#{value.last}%" : "N.A.")
  end
end

collection.each do |category, values|
  f = File.open "output/#{category}.markdown", "w+"
  f.write "| Language | " + SAMPLE_SIZE.join(" | ") + " |\n"
  f.write "| --- | " + " ---:|" * SAMPLE_SIZE.size + "\n"
  values.each do |language, data|
    f.write "| " + language + " | " + data.join(" | ") + " |\n"
  end
  f.close
end

