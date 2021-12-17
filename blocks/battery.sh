#!/usr/bin/zsh

BATTERY=0
BATTERY_INFO=$(acpi -b | grep "Battery ${BATTERY}")
BATTERY_STATE=$(echo "${BATTERY_INFO}" | grep -wo "Full\|Charging\|Discharging")
BATTERY_POWER=$(echo "${BATTERY_INFO}" | grep -o '[0-9]\+%' | tr -d '%')

URGENT_VALUE=20

if [[ "${BATTERY_STATE}" = "Charging" ]]; then
  if [[ ${BATTERY_POWER} < 25 ]]; then
    print "Charging ${BATTERY_POWER}%"
#    print -P "%B%F{166}Charging ${BATTERY_POWER}%%%f%b"
  else
    print "Charging ${BATTERY_POWER}%"
#    print -P "%B%F{035}Charging ${BATTERY_POWER}%%%f%b"
  fi
elif [[ "${BATTERY_STATE}" = "Discharging" ]]; then
  print "Discharging ${BATTERY_POWER}%"
#  print -P "%B%F{080}Discharging ${BATTERY_POWER}%%%f%b"
else
  print "Full ${BATTERY_POWER}%"
#  print -P "%B%F{080}Full ${BATTERY_POWER}%%%f%b"
fi

if [[ "${BATTERY_POWER}" -le "${URGENT_VALUE}" ]]; then
  exit 33
fi

