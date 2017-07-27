preprocess = $(CURDIR)/preprocess < $< > $@
values_file := values.toml

all: \
	i3/config \
	x11/Xresources \

%: %.in $(values_file)
	$(preprocess)

i3/config: i3/config.in $(values_file)
	$(preprocess)
	i3-msg reload

x11/Xresources: x11/Xresources.in $(values_file)
	$(preprocess)
	xrdb $(HOME)/.Xresources
