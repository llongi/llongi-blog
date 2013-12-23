---
title: KVM, slow IO and strange options
categories: Gentoo, Software
author: Luca Longinotti
date: 2011/02/08 17:40:00
updated: 2011/02/08 17:53:25
---
In my quest for portability, I wanted to test a few things on several operating systems, mostly BSDs and
<span style="text-decoration: line-through;">Sun</span> Oracle Solaris.  
Seeing as virtualization is the current hype, I decided to give [Linux KVM][1] a try, as it promised to be
the more open solution, while requiring less effort to setup, which in my case, for a few dev-VMs to try
stuff on, is kinda important, I don't want to spend hours maintaining this setup, but I also don't expect
stellar performance to run heavy workloads on it.  
[Gentoo][2] makes the installation quite easy, all you need is to enable KVM in your kernel and emerge
app-emulation/qemu-kvm.

* clearly the kernel needs to have KVM support enabled for your CPU, but I have all the VirtIO stuff disabled,
  I don't need it and I tried VirtIO-blk to speed-up IO performance, but didn't notice any difference, it
  doesn't probably do much when you only have 1-2, max. 3 VMs running at any time, with not that much going on
  in them, for development.
* qemu-kvm, careful of the USE flags and the QEMU_*_TARGETS!

**package.use entries:**

$$code(lang=bash)
media-libs/libsdl X audio video opengl xv
app-emulation/qemu-kvm aio sdl
# remember "alsa" if you use it, for both packages!
$$/code

**make.conf entries:**

$$code(lang=bash)
QEMU_SOFTMMU_TARGETS="arm i386 ppc ppc64 sparc sparc64 x86_64"
QEMU_USER_TARGETS="${QEMU_SOFTMMU_TARGETS}"
$$/code

'aio' is important for native AsyncIO support and 'sdl' to get a window with your VM in it (unless you always
want to use VNC to connect). Most people can also probably reduce QEMU_SOFTMMU_TARGETS to "i386 x86_64", but
I wanted to keep the option to emulate some alternative architectures.  
Once that's all done, KVM worked perfectly, and I started installing a [Xubuntu][3] image just to test it, but
noticed that IO was incredibly slow, and set out to find out how to better its performance, I ended up with
the following two Bash functions to install VMs from ISOs and start them, to get a somewhat usable performance.
The options are explained below.

$$code(lang=bash)
# KVM support
kvm-start() {
	/usr/bin/kvm -net nic,macaddr=random -net user -cpu host -smp 4 -m 768 -usb
	-usbdevice tablet -vga cirrus -drive file=$1,cache=writeback,aio=native
}
kvm-install() {
	/usr/bin/qemu-img create -f raw $1 6G
	/usr/bin/kvm -net nic,macaddr=random -net user -cpu host -smp 4 -m 768 -usb
	-usbdevice tablet -vga cirrus -drive file=$1,cache=writeback,aio=native
	-cdrom $2 -boot d
}
$$/code

* -drive's cache=writeback,aio=native are crucial for storage performance, while aio helped just a little,
  changing the cache mode to writeback <span style="text-decoration: underline;">massively</span> improved IO
  performance! Also, raw disk images do perform better than qcow2!
* -cpu host -smp 4 -m 768 passes along all available CPU features, and raising memory from the default 128
  helps too.
* -usb -usbdevice tablet was needed to fix the broken mouse (it just didn't react at all in my case!), it
  also makes it possible to drag the mouse off the screen of the VM and back without having to always
  CTRL+ALT, but this also kinda depends on the OS you're emulating.
* -vga cirrus enables support for resolutions up to 1024x768 and has very good compatibility all around.
  You could use -vga vmware for Linux guests to get very high resolutions, but it doesn't work that well
  with other (especially older) operating systems.
* -net nic,macaddr=random -net user is for the standard, software routed networking, documented as "slow",
  but more than fast enough for development work (of course not for some kind of high-traffic
  thousands-of-connections server). Remember to set a valid, random MAC address!

[1]: http://www.linux-kvm.org/page/Main_Page "Linux KVM"
[2]: http://www.gentoo.org/ "Gentoo"
[3]: http://www.xubuntu.org/ "Xubuntu"
