TARGET=test01

TOOLS_PATH = ../hardware/tools
CC = $(TOOLS_PATH)/msp430/bin/msp430-gcc
LD = $(TOOLS_PATH)/msp430/bin/msp430-ld
SIZE = $(TOOLS_PATH)/msp430/bin/mps430-size
STRIP = $(TOOLS_PATH)/msp430/bin/msp430-strip
MSPDEBUG = $(TOOLS_PATH)/mspdebug/mspdebug

CFLAGS = -Os -Wall -g -mmcu=msp430g2553 -ffunction-sections -fdata-sections -fno-inline-small-functions

LDFLAGS = -Wl,-Map=$(TARGET).map,--cref
LDFLAGS += -Wl,--relax
LDFLAGS += -Wl,--gc-sections

OBJS=main.o os.o
CFLS=main.c os.c


all: $(TARGET).out

$(TARGET).out: $(OBJS)
	$(CC) $(CFLAGS) -o$(TARGET).out $(OBJS) $(LDFLAGS)
	$(SIZE) --format=sysv $(TARGET).out

program: $(TARGET).out
	sudo $(MSPDEBUG) rf2500 "prog $(TARGET).out"

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -rf $(TARGET).out $(OBJS) $(TARGET).map

test:
	$(CC) $(CFLAGS) -o$(TARGET).out $(LDFLAGS) $(CFLS) 
