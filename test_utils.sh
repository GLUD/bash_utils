#!/bin/bash

# . utils
source utils


# COLORS,HEADERS,LOGGIN
e_header "I am a sample script"
e_success "I am a success message"
e_error "I am an error message"
e_warning "I am a warning message"
e_underline "I am underlined text"
e_bold "I am bold text"
e_note "I am a note"


# Seeking User Confirmation
e_header "I am a sample script"

seek_confirmation "Do you want to print a success message?"
if is_confirmed; then
  e_success "Here is a success message"
else
  e_error "You did not ask for a success message"
fi


# Sending Notifications to Pushover
pushover "We just finished performing a lengthy task."


# Testing for scripts, packages, OSes
e_header "I am a sample script"

## Check for Git
if type_exists 'git'; then
  e_success "Git good to go"
else
  e_error "Git should be installed. It isn't. Aborting."
  exit 1
fi

if is_os "darwin"; then
  e_success "You are on a mac"
else
  e_error "You are not on a mac"
  exit 1
fi


# Comparing a list
e_header "Check Homebrew Packages"

recipes=(
  A-random-package
  bash
  Another-random-package
  git
)
list="$(to_install "${recipes[*]}" "$(brew list)")"
if [[ "$list" ]]; then
for item in ${list[@]}
  do
    echo "$item is not on the list"
  done
else
e_arrow "Nothing to install.  You've already got them all."
fi


