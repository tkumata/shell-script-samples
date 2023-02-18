powerline() {
  clock=' '$(echo -e '\xE2\x97\xB4')' '
  apple=' '$(echo -e '\xef\xa3\xbf')' '
  r_ptr=$(echo -e '\xEE\x82\xB0')
  l_ptr=$(echo -e '\xee\x82\xb2\x0a')
  datetime=$(date '+%Y-%m-%d %H:%M')
  directory=${PWD/#$HOME/\~}''
  branch_name=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

  echo -n "$(tput setaf  0)$(tput setab 27)$(tput bold)${apple}"
  echo -n "$(tput setaf 27)$(tput setab 32)${r_ptr}"
  echo -n "$(tput setaf  0)$(tput setab 32)${directory}"
  echo -n "$(tput setaf 32)$(tput setab 37)${r_ptr}"
  echo -n "$(tput setaf  0)$(tput setab 37)${branch_name}"
  echo -n "$(tput setaf 37)$(tput setab 0)${r_ptr}"
  tput sgr0
  tput cuf $(($(tput cols) - ${#apple} - ${#clock} - ${#datetime} - ${#directory} - ${#branch_name} - ${#r_ptr}*4 - 1))
  echo -n "$(tput setaf  2)$(tput setab 0)$(tput bold)${l_ptr}"
  echo -n "$(tput setaf  0)$(tput setab 2)${datetime}"
  echo -n "$(tput setaf  0)$(tput setab 2)${clock}"
  tput sgr0
}
PS1="\[\$(powerline)\]\n\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;31m\]\h\[\e[0m\]\\$ "
