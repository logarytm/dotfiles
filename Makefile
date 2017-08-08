values_file := values.toml

all: \
	_build/i3/config \
	_build/i3/i3blocks.conf \
	_build/gtk/settings.ini \
	_build/gtk/gtkrc \
	_build/x11/Xresources \

_build/%: % $(values_file)
	@mkdir -p $(@D)
	$(CURDIR)/preprocess < $< > $@
