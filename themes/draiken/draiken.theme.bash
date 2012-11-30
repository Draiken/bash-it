SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""
SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
RVM_THEME_PROMPT_PREFIX=""
RVM_THEME_PROMPT_SUFFIX=""
SCM_GIT_CHAR="${bold_green}±${normal}"
SCM_SVN_CHAR="${bold_cyan}⑆${normal}"
SCM_HG_CHAR="${bold_red}☿${normal}"

case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

PS3=">> "

is_vim_shell() {
	if [ ! -z "$VIMRUNTIME" ]
	then
		echo " [vim]"
	fi
}

modern_scm_prompt() {
	CHAR=$(scm_char)
	if [ $CHAR = $SCM_NONE_CHAR ]
	then
		return
	else
		#echo "[ $(scm_char) ][ $(scm_prompt_info) ]"
		echo " on ${blue}$(scm_prompt_info)${normal}"
	fi
}

rvm_status() {
  echo " using ${cyan}$(ruby_version_prompt)${normal}"
}

prompt() {
  PSL="${TITLEBAR}${bold_blue}\w${normal}"
  PSR="$(is_vim_shell)$(modern_scm_prompt)$(rvm_status)"
  PSL1="$PSL                   $PSR"
  PS1="$PSL1
${cyan}∞${normal} "
}

#PS2="└─▪ "
PS2="∞ "



PROMPT_COMMAND=prompt
