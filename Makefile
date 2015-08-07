/usr/bin/fpm:
	echo "error: fpm missing, see https://github.com/jordansissel/fpm" >&2
	exit 1

clean:
	rm -f ./maitred_*.deb || :
	rm -r var/ || :

package: var/log/maitred
	/usr/bin/fpm -s dir -t deb -n "maitred" --maintainer 'richard@cruxdigit.al' --vendor 'cruxdigital' -v 0.2.0 -a all -C ./src --prefix / --config-files /etc/maitred.conf --depends git .

var/log/maitred:
	mkdir -p var/log/maitred

.PHONY: clean package
