#!/bin/bash

module load matlab/R2023a 

# matlab -nodisplay -nodesktop -nosplash -r "argName='$arg'; run('test_script.m'); exit"

#matlab -nodisplay -nodesktop -nosplash -r "run('./crea_movie01.m'); exit"

matlab -nodisplay -nodesktop -nosplash -r "run('crea_movie02b.m'); exit"

