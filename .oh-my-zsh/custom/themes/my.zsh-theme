# https://github.com/blinks zsh theme

function _git_prompt_switch() {
  if [ -n "${NO_GIT_PROMPT}" ]; then
      echo ''
  else
      echo "$(git_prompt_info)"
  fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%K{${bkg}}%B%F{green}%}%{%B%F{blue}%}%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{green}%}$(_git_prompt_switch)%E%{%f%k%b%}
%{%K{${bkg}}%}%{%K{${bkg}}%}%{%f%k%b%} '

# PROMPT='%{%f%k%b%}
# %{%K{${bkg}}%B%F{green}%}%{%B%F{blue}%}%{%B%F{cyan}%}%m%{%B%F{green}%} %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%f%k%b%}
# %{%K{${bkg}}%}$(_prompt_char)%{%K{${bkg}}%}%{%f%k%b%} '

# RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'
