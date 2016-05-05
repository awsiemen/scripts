#!/bin/bash

# A so-easy-a-CS-first-grader-could-do-it script that literally just does
# search-n-replace on a template file based on user input.

echo -n "Username: "
read name
echo -n "Skype name: "
read skype
echo -n "Extension: "
read ext
echo -n "VM Pass: "
read pass

cat ~/scripts/onboarding.template | sed -e "s/\[user\]/$name/g" | sed -e "s/\[skypeuser\]/$skype/g" | sed -e "s/\[ext\]/$ext/g" | sed -e "s/\[vmpass\]/$pass/g" | less

exit 0
