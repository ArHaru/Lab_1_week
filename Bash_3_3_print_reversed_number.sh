
#!/bin/bash

number="$1"

if [ $number == 0 ]; then
	echo -n 0
fi

while [ $number -gt 0 ]; do
	dividend=$(($number%10))
	let number=$number/10
	# let number/=10
	echo -n  "$dividend"
done
