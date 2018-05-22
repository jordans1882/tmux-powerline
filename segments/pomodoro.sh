# Prints current task or warns of no task running
  #curr_task = `task active | tail -3 | head -1 | cut -c -15 --complement`

__process_settings() {
		export TMUX_POWERLINE_SEG_TASKWARRIOR_FORMAT="test print"
}

run_segment() {
  cat ~/.thyme-tmux
	return 0
}
