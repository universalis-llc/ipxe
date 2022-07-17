#!/usr/bin/sh
set -e

OUTDIR=/tmp/ipxe

mkdir -p $OUTDIR

TRUST=ssl/codesign.crt
CERT=ssl/codesign.crt
#DEBUG=tls,x509:3,certstore,privkey
#DEBUG=efi_driver,snp
#DEBUG=tls
#DEBUG=efi_image
#DEBUG=asn1
OPTIONS="DEBUG=$DEBUG NO_WERROR=1 EMBED=boot.ipxe TRUST=$TRUST CERT=$CERT"

# X86_64
#make -j11 bin-x86_64-efi/10ec8168.efi $OPTIONS
#cp bin-x86_64-efi/10ec8168.efi $OUTDIR/x86_64-efi-10ec8168.efi
make -j11 bin-x86_64-efi/ipxe.efi $OPTIONS
cp bin-x86_64-efi/ipxe.efi $OUTDIR/x86_64-efi-ipxe.efi
make -j11 bin-x86_64-efi/snp.efi $OPTIONS
cp bin-x86_64-efi/snp.efi $OUTDIR/x86_64-efi-snp.efi
#make -j11 bin-x86_64-efi/ipxe.usb $OPTIONS
#cp bin-x86_64-efi/ipxe.usb $OUTDIR/x86_64-efi-ipxe.usb
#make -j11 bin-x86_64-efi/snp.usb $OPTIONS
#cp bin-x86_64-efi/snp.usb $OUTDIR/x86_64-efi-snp.usb
#make -j11 bin-x86_64-efi/snponly.efi $OPTIONS
#cp bin-x86_64-efi/snponly.efi $OUTDIR/x86_64-efi-snponly.efi

# Arm64
#make CROSS=aarch64-linux-gnu- -j11 bin-arm64-efi/ipxe.efi $OPTIONS
#cp bin-arm64-efi/ipxe.efi $OUTDIR/arm64-efi-ipxe.efi
#make CROSS=aarch64-linux-gnu- -j11 bin-arm64-efi/snp.efi $OPTIONS
#cp bin-arm64-efi/snp.efi $OUTDIR/arm64-efi-snp.efi

