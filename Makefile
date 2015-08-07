/usr/bin/fpm:
	echo "error: fpm missing, see https://github.com/jordansissel/fpm" >&2
	exit 1

clean:
	rm -f ./maitred_*.deb

package:
	fpm -s dir -t deb -n "maitred" --maintainer 'richard@cruxdigit.al' --vendor 'cruxdigital' -v 0.2.0 -a all -C ./src --prefix / --config-files /etc/maitred.conf --depends git .
