virtop(1) -- top for libvirt
============================

Synopsis
--------

    virtop <uri>...

Description
-----------

The machine to connect to is specified by the <uri> argument(s). The URIs are
documented on <http://libvirt.org/uri.html>.

As top, virtop is to be exited with the [q] key.

The list of VMs running is sortable by columns:

Name (1), State (2), Current memory (3), Maximum memory (4), Current number of
CPUs (5), CPU time (6).

Multiple URIs to connect to if no argument is given can be specified in YAML
format in `~/.virtop.yaml`:

    urls:
	  - qemu:///system
	  - qemu+ssh://localhost/system

Author
------

    henning mueller <henning@orgizm.net>

License
-------

License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.

This is free software: you are free to change and redistribute it. There is NO
WARRANTY, to the extent permitted by law.
