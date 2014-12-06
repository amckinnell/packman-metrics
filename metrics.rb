#!/usr/bin/env ruby -w

def generate_metrics(options)
  # Configuration
  jvm_config = '-Djava.awt.headless=true -Xmx4g'
  code_maat_jar = '/Users/alistair/dev/code-maat/target/code-maat-0.8.1-SNAPSHOT-standalone.jar'

  # Standard options
  standard_options = '--log logfile.log --version-control git'

  # Options
  analysis = "--analysis #{options.fetch(:analysis)}"
  rows = "--rows #{options.fetch(:rows)}" if options.include? :rows
  output_filename = "#{options.fetch(:analysis)}.raw.txt"

  puts "Generating #{options.fetch(:analysis)} analysis..."

  system("java #{jvm_config} -jar #{code_maat_jar} #{standard_options} #{analysis} #{rows} > #{output_filename}")
end


generate_metrics analysis: 'summary'
generate_metrics analysis: 'authors'
generate_metrics analysis: 'coupling'
generate_metrics analysis: 'author-churn'
generate_metrics analysis: 'abs-churn'
generate_metrics analysis: 'entity-churn'
generate_metrics analysis: 'entity-effort'
