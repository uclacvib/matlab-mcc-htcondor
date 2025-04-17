# matlab-mcc-htcondor
```
a hello world for 
compiling matlab code with mcc 
and submit job to run the compiled code via htcondor
```

+ clone repo, setup git lfs for matlab binary
```
mkdir bin
git lfs track "quux"
```

+ build container for development
    
    + add all required packages in env `ADDITIONAL_PRODUCTS`, `MATLAB_Compiler` is a must.

```
build_and_push_dev.sh

```

+ develop/test your code

```

docker run --init --rm -it --shm-size=512M \
  -v $PWD:/opt/myapp \
  pangyuteng/matlab-foobar:dev \
  bash

# start interactive matlab and enter credentials
cd /opt/myapp
bash /bin/run.sh
run('/opt/myapp/qux.m');

run('/opt/myapp/quux.m');
mcc -v -R -nodisplay -R -singleCompThread -m /opt/myapp/quux.m -a /opt/myapp/foobar/*

```

+ head in to running container and test the compiled code.

```

docker exec -it $container_name bash
cd ~/Documents/MATLAB

# "999" will be printed 
bash run_quux.sh  /opt/matlab/R2024a 999

# copy compiled code to `bin` folder
cp quux /opt/myapp/bin
cp run_quux.sh /opt/myapp/bin

```

+ commit compiled binary file and sh file to your repo in bin folder


+ build production contain to be used by condor

```

build_and_push_prod.sh

```

+ test out production container

```
docker run --init --rm -it --shm-size=512M \
  -w /opt/myapp/bin pangyuteng/matlab-foobar:prod \
  bash
bash run_quux.sh /opt/matlab/R2024a 1

```

+ test execution via condor

```
condor_submit condor.sub

# check printout in log/*.out
cat log/*.out

# the values in argFloat should match the input arguments provided in `condor.sub`

```