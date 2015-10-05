PACKAGE_TYPE:=rpm  # 'deb' or 'rpm'

clean:
	rm -f ./maitred*.$(PACKAGE_TYPE) || :
	rm -r src/var || :

package: src/var/log/maitred
	fpm -s dir -t $(PACKAGE_TYPE) \
	    -n "maitred" \
	    --maintainer 'richard@cruxdigit.al' \
	    --vendor 'cruxdigital' \
	    -v 0.3.0 \
	    -a all \
	    -C ./src \
	    --prefix / \
	    --config-files /etc/maitred.conf \
	    --depends git \
	    .

src/var/log/maitred:
	mkdir -p src/var/log/maitred

.PHONY: clean package
