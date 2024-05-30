#!/bin/bash

# get rank number of current MPI process
rank=$OMPI_COMM_WORLD_NODE_RANK

# distinguish...
if [ $rank = "0" ]; then
    # ... if root: write to file and print on screen
    "$@" | tee "temp_$rank"
else
    # ... else: only write to file 
    "$@" > "temp_$rank"
fi
