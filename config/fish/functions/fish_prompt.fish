function fish_prompt --description 'Write out the prompt'
	set -l last_status $status
	set -l normal (set_color normal)
	set -l mode_str

	switch "$fish_key_bindings"
	case '*_vi_*' '*_vi'
		# possibly fish_vi_key_bindings, or custom key bindings
		# that includes the name "vi"
		set mode_str (
			echo -n " "
			switch $fish_bind_mode
			case default
				set_color --bold --background red white
				echo -n "[N]"
			case insert
				set_color --bold green
				echo -n "[I]"
			case visual
				set_color --bold magenta
				echo -n "[V]"
			end
			set_color normal
		)
	end

  set_color magenta
  echo -n '🍔  '
  set_color normal

  # PWD
  set_color normal
  echo -n (prompt_pwd)
  set_color normal

  # git
  set -l index (git status --porcelain 2>/dev/null)
  if test -z "$index"
    set_color green
  else
    set_color yellow
  end
  echo -n (__fish_git_prompt | sed 's/[\(\)]//g')
  set_color normal

  # exit status
  if not test $last_status -eq 0
    set_color $fish_color_error
    echo -n " $last_status"
    set_color normal
  end

  set_color blue
  echo
  echo -n '⚡️  '
  set_color normal
end
