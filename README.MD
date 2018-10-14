# Usage
```bash
mpisplit -np 7 bash ./main | cat temp_*
```

# Installation
```
function mpisplit() {
    np=0

    while :; do
        case $1 in
            -np|--flag1) shift; np=$1;
            ;;
            *) break
        esac
        shift
    done


    if [ "$np" -le 1 ]; then
        $@
    else
        mpirun -np $np bash ~/projects/mpi-split/split.sh $@
    fi

}
```
