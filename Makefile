CC=gcc
CMAKE=cmake

SRC=./src/main.c
FLAGS=-lGL -lX11 -lpthread -lXrandr -lXi -ldl  -lglfw
INCLUDE=./Dependencies/include

GLAD=./Dependencies/src/GLAD/src/glad.c
GLFW_SOURCE=./Dependencies/src/GLFW
GLFW_BUILD=${GLFW_SOURCE}/build
GLFW_BIN=${GLFW_BUILD}/src/libglfw.so
DEPS=glad.o

all: 	
	make glad && make glfw && make main

main: ${SRC}
	${CC} -o $@ -I${INCLUDE} -L. ${SRC} ${DEPS} ${FLAGS} -Wl,-rpath=.

clear:
	rm main glad.o libglfw.so libglfw.so.3 -r ${GLFW_BUILD}

glad:
	${CC} -I ${INCLUDE} -c ${GLAD}

glfw:
	${CMAKE} -S ${GLFW_SOURCE} -B ${GLFW_BUILD} -D BUILD_SHARED_LIBS=ON && ${CMAKE} --build ${GLFW_BUILD} && cp ${GLFW_BIN} . && cp ${GLFW_BIN}.3 .
