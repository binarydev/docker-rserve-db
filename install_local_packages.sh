cd /local_R_packages

for f in *.tar.gz
do
	echo "Installing package - $f"
	R CMD INSTALL $f
done
