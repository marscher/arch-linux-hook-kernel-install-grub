pkgname='kernel-install-initramfs-dracut'
pkgver=1.0
pkgrel=0
pkgdesc='pacman libalpm hooks to install vmlinuz to /boot and run dracut to generate initramfs'
arch=('any')
url='https://github.com/marscher/'
license=('Apache')
depends=('dracut' 'grub')
source=('99-install-vmlinuz+initrd.hook' 'install-vmlinuz-run-dracut.sh')

package() {
    install -o root -g root -D ${srcdir}/99-install-vmlinuz+initrd.hook	${pkgdir}/etc/pacman.d/hooks/99-install-vmlinuz+initrd.hook
    install -o root -g root -D ${srcdir}/install-vmlinuz-run-dracut.sh ${pkgdir}/usr/share/libalpm/scripts/install-vmlinuz-run-dracut.sh 
}
sha256sums=(
fb862329ca6a3098102cb6a38a6295e9e9fa5804ea68adbcd0626335fce1a133 
86f0412b972e4698a941baa7cde95550a8b5fa67d123935e489e1eb75ee41f4b
)
