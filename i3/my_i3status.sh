#!/usr/bin/sh

# Function to modify a string with conditional append
modify_string() {
  local string_to_modify="$1"
  local append_string="$2"
    
  # Check if the string starts with the pattern
  if [[ "$string_to_modify" =~ ',[{' ]]; then
    # Extract elements from the string (excluding brackets)
    elements="${string_to_modify:2:-1}"

    # Create the new string with appended element
    new_string="["$(IFS=, ; echo "$append_string,$elements")"],"
  elif [[ "$string_to_modify" =~ '[{' ]]; then
    elements="${string_to_modify:1:-1}"
    new_string="["$(IFS=, ; echo "$append_string,$elements")"],"
  else
    # Leave the string unchanged if it doesn't match the pattern
    new_string="$string_to_modify"
  fi

  echo "$new_string"
}

# shell script to prepend i3status with more stuff

i3status -c /home/$USER/.config/i3status/i3status.conf | while :
do
    read line
    i3status_output_str=$line
    scratchpad_str=$(echo "$(i3-msg -t get_tree | jq ".nodes|.[]|.|.nodes|.[]|.nodes|.[]|select(.name==\"__i3_scratch\")|.floating_nodes|.[]|.nodes|.[]|.name")")
    if [[ "$scratchpad_str" == '' ]]; then
        echo $(modify_string "$i3status_output_str" '{"name":"scratchpad_bell","full_text":""}') || exit 1
    else
        echo $(modify_string "$i3status_output_str" '{"name":"scratchpad_bell","full_text":"🔔"}') || exit 1
    fi
done
