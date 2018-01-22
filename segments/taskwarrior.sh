# Prints current task or warns of no task running
  #curr_task = `task active | tail -3 | head -1 | cut -c -15 --complement`

__process_settings() {
  # Currently non-functional... Maybe transfer things below up to here?
		export TMUX_POWERLINE_SEG_TASKWARRIOR_FORMAT="test print"
}

run_segment() {
  # Store number of characters up to 'Description' in task active
  char_ct="$(task active | head -2 | tail -1 | sed 's/ Description//' | wc -m)"

  # Store accumulated time from timewarrior
  total_time="$(timew | tail -1 | head -1 | cut -c -22 --complement)"

  # Store Actice Task
  curr_task="$(task active | tail -3 | head -1 | cut -c -${char_ct} --complement)"

  # Switch for active task or no active task
  if [ $? -eq 0 ]; then
    echo "Current Task: ${curr_task} ${total_time}"
  else
    echo "Warning! No current task!!"
  fi
	return 0
}
