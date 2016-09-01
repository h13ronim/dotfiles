function bluetooth-not-available-fix() {
  sudo rm -f /Library/Preferences/com.apple.Bluetooth.plist
  echo "Bluetooth preferences file removed. Please restart your computer."
  echo ""
  echo "If bluetooth doesn't work after restart then please reset the SMC."
  echo "How to reset the SMC: https://support.apple.com/en-us/HT201295"
}

alias nproc='sysctl -n hw.ncpu'
