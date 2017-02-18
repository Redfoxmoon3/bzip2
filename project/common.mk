API_SRCS = \
	src/common/blocksort.c \
	src/common/huffman.c \
	src/common/crctable.c \
	src/common/randtable.c \
	src/common/compress.c \
	src/common/decompress.c \
	src/common/bzlib.c \

APP_SRCS = src/bzip2.c \
	
COMMON_SRCS = $(API_SRCS)
