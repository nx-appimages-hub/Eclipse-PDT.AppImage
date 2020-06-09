SOURCE="http://mirror.dkm.cz/eclipse/technology/epp/downloads/release/2020-03/R/eclipse-php-2020-03-R-linux-gtk-x86_64.tar.gz"
DESTINATION="build.tar.bz2"
OUTPUT="Eclipse-PDT.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)
	
	tar -zxvf $(DESTINATION)
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	mv eclipse/* AppDir/opt/application

	chmod +x AppDir/AppRun
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -rf eclipse
	rm -f $(DESTINATION)
	rm -rf AppDir/opt

