FC = gfortran
FFLAGS = -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single 

all: esm_dummy_model.o libesm_dummy_model.a app_main.f90.o 
	mkdir bin
	$(FC) $(FFLAGS) build/$(FC)/esm_dummy_model/app_main.f90.o build/gfortran/esm_dummy_model/libesm_dummy_model.a -o bin/esm_dummy_model

prepare:
	mkdir -p build/dependencies
	mkdir -p build/$(FC)
	mkdir -p build/$(FC)/esm_dummy_model/

esm_dummy_model.o: prepare
	$(FC) -c ././src/esm_dummy_model.f90  $(FFLAGS) -J build/$(FC) -Ibuild/$(FC) -o build/$(FC)/esm_dummy_model/src_esm_dummy_model.f90.o
	
libesm_dummy_model.a: esm_dummy_model.o
	ar -rs build/$(FC)/esm_dummy_model/libesm_dummy_model.a build/$(FC)/esm_dummy_model/src_esm_dummy_model.f90.o

app_main.f90.o:
	$(FC) -c app/main.f90  $(FFLAGS) -J build/$(FC) -Ibuild/$(FC) -o build/$(FC)/esm_dummy_model/app_main.f90.o

clean:
	rm -rf build bin
