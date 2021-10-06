
#!/bin/bash

givenFile="$1"

wc -l < $givenFile # < is needed so that the file name is not printed in the terminal
