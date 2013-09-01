# keepalived Vagrant demo setup

This configuration demonstrates ``keepalived`` with two Vagrant-managed
virtual machines, ``ha1`` and ``ha2``. 

Both have a private permanent IP address (``10.11.0.10`` and ``10.11.0.11``) 
for ``eth1``, and ``keepalived`` configured to manage and set up a virtual 
interface ``eth1:vi1`` with the IP address ``10.11.1.100``.

First, boot up both virtual machines with the command

    vagrant up ha1 ha2

You should be able to ping ``10.11.1.100``, which should be initially managed
by the master node, ``ha1``.

Then, shut down ``ha1`` with the command

    vagrant halt ha1

At this point, ``ha2`` should be taking over the above IP, and you should
again be getting answers to your ping.

Bring ``ha1`` up again with the command

    vagrant up ha1
    
At this point, ``ha1`` should take over the master role again, and the pings
should be hitting it.

You can SSH into either of the machines with the command

    vagrant ssh ha1
    
    vagrant ssh ha2

You can follow what ``keepalived`` is doing by tailing the file ``/var/log/syslog``.

## VMWare ESX

When you're running ``keepalived`` or any VRRP software on VMWare ESX, please
make sure to configure VMWare according to its manual, to which the following
blog posts give pointers:

http://www.vyatta.org/node/40206

http://roggyblog.blogspot.fi/2010/05/using-hsrpcarp-and-vrrp-within-vmware.html

http://gregsowell.com/?p=3468

