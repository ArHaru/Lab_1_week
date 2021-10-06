
#!/bin/bash

number="$1"

while [ $number != 0 ]; do
	dividend=$(($number%10))
	let number=$number/10
	# let number/=10
	echo -n  "$dividend"
done
