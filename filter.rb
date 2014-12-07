#!/usr/bin/env ruby -w

def filter_metrics(options)
  raw_metrics_filename = "out/#{options.fetch(:analysis)}.raw.txt"
  filtered_metrics_filename = raw_metrics_filename.gsub('.raw.', '.filtered.')

  blacklist_filename = "filters/#{options.fetch(:analysis)}.blacklist"

  blacklist = []
  File.open(blacklist_filename, 'r') do |f|
    f.each_line do |line|
      blacklist << Regexp.quote(line.chomp)
    end
  end

  blacklist_regexp = Regexp.new(blacklist.join('|'))

  File.open(filtered_metrics_filename, 'w') do |filtered|
    File.open(raw_metrics_filename, 'r') do |raw|
      raw.each_line do |line|
        filtered.write(line) unless line.chomp.match(blacklist_regexp)
      end
    end
  end
end


filter_metrics analysis: 'authors'
filter_metrics analysis: 'coupling'
filter_metrics analysis: 'entity-churn'
