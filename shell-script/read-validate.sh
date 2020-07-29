#!/bin/bash

# read-validate : validate input


invalid_input () {
	echo "Invalid input $REPLY" >&2
	exit 1
}

read -p "Enter the single item > "

# check input is empty (invalid)
[[ -z $REPLY ]] && invalid_input

# input is multiple items (invalid)
(( $(echo $REPLY | wc -w) > 1 )) && invalid_input

# is input a valid filename?
if [[ $REPLY =~ ^[-[:alnum:]\._]+$ ]]; then
	echo "$REPLY is a valid filename."
	if [[ -e $REPLY ]]; then
		echo "And file  $REPLY exists."
	else
		echo "However, file $REPLY does not exit."
	fi
	
	# is input a floating point number?
	if [[ $REPLY =~ ^-?[[:digit:]]*\.[[:digit:]]+$ ]]; then
		echo "$REPLY is floating point number"
	else
		echo "$REPLY is not a floating point number."
	fi

	# is input an integer?
	if [[ $REPLY =~ ^-?[[:digit:]]+$ ]]; then
		echo "$REPLY is an integer."
	else
		echo "$REPLY is not an integer."
	fi
else
	echo "the string $REPLY is not a valid filename."
fi

