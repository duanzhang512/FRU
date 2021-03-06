DIR_INC = ./include
DIR_SRC = ./src
DIR_OBJ = ./obj
DIR_BIN = ./bin

SRC = $(wildcard ${DIR_SRC}/*.c)
OBJ = $(patsubst %.c, ${DIR_OBJ}/%.o, ${notdir ${SRC}})

TARGET = parser

BIN_TARGET = ${DIR_BIN}/${TARGET}

CC = gcc
CFLAGS = -g -Wall -I${DIR_INC}

${BIN_TARGET}:${OBJ}
	${CC} ${OBJ} -o $@

${DIR_OBJ}/%.o: ${DIR_SRC}/%.c
	${CC} ${CFLAGS} -c $< -o $@
.PHONY: clean	
clean:
	rm -rf ${DIR_OBJ}/*.o ${DIR_BIN}/*
