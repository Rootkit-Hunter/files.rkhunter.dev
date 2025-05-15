#!/usr/bin/env bash
#
# Description:  A script to start grabbing basic data from the logs to show us 
#                how many systems are using rkhunter and the versions they are using.
#
# Usage:  $0 > versions.html
#
# Notes:  Yeah it's dirty, when was the last time you wrote HTML from an awk script :-p
#

LOG_DIR="/var/log/nginx"
LOG_PATTERN="files.rkhunter.dev.access.log*"
GREP_PATTERN='GET /i18n/[^/]+/i18n\.ver'

zless $(find "$LOG_DIR" -type f -name "$LOG_PATTERN" -mtime -30) 2>/dev/null \
| grep -E "$GREP_PATTERN" \
| awk '
{
    total_lines++
    ip = $1
    if (match($0, /GET \/i18n\/([^/]+)\/i18n\.ver/, m)) {
        version = m[1]
        seen[version, ip] = 1
        ips[ip] = 1
    }
}
END {
    total_unique_ips = length(ips)

    print "<html><head><title>Logs Report</title></head><body>"
    print "<h1>Logs Report</h1>"
    print "<p>Logs processed for the last 30 days</p>"
    print "<p><strong>Lines Processed:</strong> " total_lines "</p>"
    print "<p><strong>Unique IPs:</strong> " total_unique_ips "</p>"
    print "<h3>Version Distribution (by unique IPs)</h3>"
    print "<table border=\"1\"><tr><th>Version</th><th>Unique IPs</th><th>Percentage</th></tr>"

    for (key in seen) {
        split(key, parts, SUBSEP)
        version = parts[1]
        uniq_ips[version]++
    }

    for (version in uniq_ips) {
        pct = (uniq_ips[version] / total_unique_ips) * 100
        printf "<tr><td>%s</td><td>%d</td><td>%.1f%%</td></tr>\n", version, uniq_ips[version], pct
    }

    print "</table></body></html>"
}
'

