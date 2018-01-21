# Prints current task or warns of no task running
  #curr_task = `task active | tail -3 | head -1 | cut -c -15 --complement`

__process_settings() {
		export TMUX_POWERLINE_SEG_TASKWARRIOR_FORMAT="test print"
}

run_segment() {
  char_ct="$(task active | head -2 | tail -1 | sed 's/ Description//' | wc -m)"
  curr_task="$(task active | tail -3 | head -1 | cut -c -${char_ct} --complement)"
  if [ $? -eq 0 ]; then
    echo "Current Task: ${curr_task}"
  else
    echo "Warning! No current task!!"
  fi
	return 0
}
