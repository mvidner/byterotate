help:
	@echo "Targets:"
	@echo "  make install"
	@echo "  make install_user"
	@echo "  make help (this one)"

PROGRAMS = byterotate
DESKTOPS = byterotate-left.desktop byterotate-right.desktop byterotate-upsidedown.desktop

user_bin_dir = $$HOME/bin
user_xdg_data_dir = $$HOME/.local/share

system_bin_dir = /usr/bin
system_xdg_data_dir = /usr/share

install: install_system

install_user install_system: install_%:
	install -d ${$*_bin_dir}
	install -t ${$*_bin_dir} ${PROGRAMS}
	install -d ${$*_xdg_data_dir}/applications
	install -t ${$*_xdg_data_dir}/applications -m 644 ${DESKTOPS}
	-kbuildsycoca4
	-kbuildsycoca5
