REBAR=$(shell which rebar)

ifeq ($(REBAR),)
#$(error "Rebar not available on this system, try running make get-rebar")
REBAR=$(CURDIR)/rebar
endif

.PHONY: all compile clean deps get-deps

all: deps compile

$(REBAR):
	wget https://github.com/rebar/rebar/wiki/rebar
	chmod a+x rebar

get-rebar: $(REBAR)

deps:
	$(REBAR) get-deps
	$(REBAR) compile

get-deps: $(REBAR)
	$(REBAR) get-deps
	$(REBAR) compile

compile: $(REBAR) deps
	$(REBAR) compile

clean:
	$(REBAR) skip_deps=true clean
