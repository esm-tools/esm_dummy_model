# `esm_dummy_model`: A Minimal Fortran "Model" for Testing

This is a minimal `FORTRAN` program, made with
[`fpm`](https://fpm.fortran-lang.org/en/index.html). It counts to 5 while
sleeping.

# Install

First, you can download the code via git:
```console
$ git clone https://github.com/esm-tools/esm_dummy_model.git
$ cd esm_dummy_model
```

If you have [`fpm` installed (see link for
instructions)](https://fpm.fortran-lang.org/en/install/index.html#install)
you can build and then run it with simple `fpm` commands:

```console
$ fpm build # <-- will build the binary
 + mkdir -p build/gfortran_2A42023B310FA28D
 + mkdir -p build/gfortran_2A42023B310FA28D/esm_dummy_model/
 + gfortran -c ././src/esm_dummy_model.f90  -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single -J build/gfortran_2A42023B310FA28D -Ibuild/gfortran_2A42023B310FA28D -o build/gfortran_2A42023B310FA28D/esm_dummy_model/src_esm_dummy_model.f90.o
 + ar -rs build/gfortran_2A42023B310FA28D/esm_dummy_model/libesm_dummy_model.a build/gfortran_2A42023B310FA28D/esm_dummy_model/src_esm_dummy_model.f90.o
ar: creating archive build/gfortran_2A42023B310FA28D/esm_dummy_model/libesm_dummy_model.a
 + gfortran -c app/main.f90  -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single -J build/gfortran_2A42023B310FA28D -Ibuild/gfortran_2A42023B310FA28D -o build/gfortran_2A42023B310FA28D/esm_dummy_model/app_main.f90.o
 + mkdir -p build/gfortran_2A42023B310FA28D/app/
 + gfortran  -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single  build/gfortran_2A42023B310FA28D/esm_dummy_model/app_main.f90.o build/gfortran_2A42023B310FA28D/esm_dummy_model/libesm_dummy_model.a -o build/gfortran_2A42023B310FA28D/app/esm_dummy_model
$ fpm run  # <-- will build if needed, and immediately run the program
 Hello, esm_dummy_model!
 Sleeping...           1
 Sleeping...           2
 Sleeping...           3
 Sleeping...           4
 Sleeping...           5
 Goodbye, esm_dummy_model!
$ fpm install # <-- will put the binary into ${HOME}/.local/bin
# Update: build/gfortran_2A42023B310FA28D/app/esm_dummy_model -> /Users/pgierz/.local/bin
```

For testing use with the ESM Tools, we also have a small Makefile:

```console
$ make clean
rm -rf build bin
$ make
mkdir -p build/dependencies
mkdir -p build/gfortran
mkdir -p build/gfortran/esm_dummy_model/
gfortran -c ././src/esm_dummy_model.f90  -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single  -J build/gfortran -Ibuild/gfortran -o build/gfortran/esm_dummy_model/src_esm_dummy_model.f90.o
ar -rs build/gfortran/esm_dummy_model/libesm_dummy_model.a build/gfortran/esm_dummy_model/src_esm_dummy_model.f90.o
ar: creating archive build/gfortran/esm_dummy_model/libesm_dummy_model.a
gfortran -c app/main.f90  -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single  -J build/gfortran -Ibuild/gfortran -o build/gfortran/esm_dummy_model/app_main.f90.o
mkdir bin
gfortran -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single  build/gfortran/esm_dummy_model/app_main.f90.o build/gfortran/esm_dummy_model/libesm_dummy_model.a -o bin/esm_dummy_model
```
You can now run the program (found in `bin/`):
```console
$ ./bin/esm_dummy_model
 Hello, esm_dummy_model!
 Sleeping...           1
 Sleeping...           2
 Sleeping...           3
 Sleeping...           4
 Sleeping...           5
 Goodbye, esm_dummy_model!
```
