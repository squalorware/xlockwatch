all:
	sed 's|%LOCALBIN%|'"$(HOME)"'/.local/bin|g'\
         xlockwatch.service.in > /tmp/xlockwatch.service

install:
	chmod +x ./install.sh && ./install.sh
