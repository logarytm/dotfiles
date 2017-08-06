values_file := values.toml

all: \
	i3/config \
	x11/Xresources \

_build/%: % $(values_file)
	@mkdir -p $(@D)
	$(CURDIR)/preprocess < $< > $@
