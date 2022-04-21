CC=gcc
SRC=./src/main.c
FLAGS=-lglfw -lGL -lX11 -lpthread -lXrandr -lXi -ldl
INCLUDE=./Dependencies/include
DEPS=glad.o

all: ${SRC}
	${CC} -I ${INCLUDE} ${SRC}  glad.o ${FLAGS} -o $@

clear:
	rm main.o glad.o

glad:
	${CC} -I ${INCLUDE} -c ./Dependencies/src/GLAD/src/glad.c
