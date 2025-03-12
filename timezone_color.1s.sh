#! /opt/homebrew/anaconda3/bin/python3

#
# <xbar.title>Timezones Display</xbar.title>
#  <xbar.version>v1.0</xbar.version>
#  <xbar.author>Your Name, Another author name</xbar.author>
#  <xbar.author.github>your-github-username,another-github-username</xbar.author.github>
# <xbar.desc>Displays the current time in PST, CST, and GMT with emojis in the menu bar. Also highlights when these hours are inside/outside of set working hours</xbar.desc>
#  <xbar.image>http://www.hosted-somewhere/pluginimage</xbar.image>
#  <xbar.dependencies>python,ruby,node</xbar.dependencies>
#  <xbar.abouturl>http://url-to-about.com/</xbar.abouturl>



# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>

import time
import pytz
from datetime import datetime


# Function to get time in specific timezone
def get_time(timezone_str):
    tz = pytz.timezone(timezone_str)
    return datetime.now(tz)




#   check if the current time is within working hours
def is_working_hours(current_time, start_hour, end_hour):
    return start_hour <= current_time.hour < end_hour



# ANSI escape codes for red and green colors
RED = "\033[31m"
GREEN = "\033[32m"
RESET = "\033[0m"
BRIGHT_GREEN = "\033[92m"
BRIGHT_RED = "\033[91m"


# Get current times in different timezones
pst_time = get_time("US/Pacific")
cst_time = get_time("America/Chicago")
gmt_time = get_time("GMT")



# Set the working hours for each timezone
pst_working = (9, 17)  # 09:00-17:00 PST
cst_working = (8, 16)  # 08:00-16:00 CST
gmt_working = (9, 17)  # 09:00-17:00 GMT


# Color the timezones in green if they are within working hours, otherwise red
pst_color = BRIGHT_GREEN if is_working_hours(pst_time, *pst_working) else BRIGHT_RED
cst_color = BRIGHT_GREEN if is_working_hours(cst_time, *cst_working) else BRIGHT_RED
gmt_color = BRIGHT_GREEN if is_working_hours(gmt_time, *gmt_working) else BRIGHT_RED



# print all times on a single line with correct colors, displaying only hours and minutes
print(f"{pst_color}🏄🏻 {pst_time.strftime('%H:%M')} {RESET} "
      f"{cst_color}💨 {cst_time.strftime('%H:%M')} {RESET} "
      f"{gmt_color}🇮🇪 {gmt_time.strftime('%H:%M')} {RESET} | ansi=true")



