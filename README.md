PackManager Code Metrics
------------------------

GitHub Repository for Code Maat
https://github.com/adamtornhill/code-maat

GitHub Repository for Visualizing Code Metrics
https://github.com/adamtornhill/MetricsTreeMap

Command for generating the logifle for anaylsis:
> git log --pretty=format:'[%h] %an %ad %s' --date=short --numstat --after=2014-01-01 > logfile.log

Use the metrics.rb script to generate the raw PackManager code metrics.
The raw metrics are written to the out/ folder.

Use the filter.rb script to filter some of the raw PackManager code metrics.
The blacklists that controls filtering are specified in the filters/ folder.
