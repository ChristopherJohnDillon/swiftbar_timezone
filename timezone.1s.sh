
#!/usr/bin/env bash

# <xbar.title>Timezones Display</xbar.title>
# <xbar.version>1.0</xbar.version>
# <xbar.author>Your Name</xbar.author>
# <xbar.author.github>YourGitHubUsername</xbar.author.github>
# <xbar.desc>Displays the current time in PST, EST, and GMT in the menu bar.</xbar.desc>
# <xbar.dependencies>bash, date</xbar.dependencies>
PST=$(TZ="PST8PDT" date +"%H:%M")
EST=$(TZ="EST5EDT" date +"%H:%M")
GMT=$(TZ="GMT" date +"%H:%M")

echo 🏄🏻 $PST 🍏 $EST 🇮🇪 $GMT 

