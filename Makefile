build: virtop%.gem

clean:
	rm -rf virtop-?.?.?.gem man/virtop.1.gz doc

doc: man/virtop.1.gz

doc-prepare: man/virtop.1

doc-yard: doc/index.html

man-open: man/virtop.1
	nroff -man man/virtop.1 | more

virtop%.gem: doc
	gem build virtop.gemspec

man/virtop.1: VIRTOP.md
	ronn -r --pipe VIRTOP.md > man/virtop.1

man/virtop.1.gz: man/virtop.1
	gzip -c man/virtop.1 > man/virtop.1.gz

doc/index.html: README.md bin/* lib/*.rb lib/*/*.rb
	yard

.PHONY: build clean doc doc-prepare doc-yard
