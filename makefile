C=g++
CFLAGS=-std=c++1y -O3 -ggdb
CPPGOALS=$(filter %.cpp,$(MAKECMDGOALS))
ifneq ($(CPPGOALS),)
FILE=$(shell basename $(CPPGOALS))
.PHONY: $(MAKECMDGOALS)
$(CPPGOALS):
	@make bin/$(FILE:.cpp=)
endif

.PRECIOUS: bin/%.out

clean:
	@rm -rf bin

bin:
	@mkdir $@

bin/%: %.cpp | bin
	$(CC) -o $@ $^ $(CFLAGS)

all:
