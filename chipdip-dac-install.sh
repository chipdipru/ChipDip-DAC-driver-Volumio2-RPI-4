#!/bin/sh

echo "Installing ChipDip DACs..."

sudo cp ChipDip-DAC-driver-Volumio-RPI4/snd-soc-chipdip-dac-4.19.188-v71+.ko /lib/modules/`uname -r`/kernel/sound/soc/bcm/snd-soc-chipdip-dac.ko
sudo cp ChipDip-DAC-driver-Volumio-RPI4/chipdip-dac.dtbo /boot/overlays/chipdip-dac.dtbo
sudo depmod

sed -i '4 a {"id":"chipdip-master-dac","name":"ChipDip DAC","overlay":"chipdip-dac","alsanum":"2","mixer":"","modules":"","script":"","needsreboot":"yes"},' /volumio/app/plugins/system_controller/i2s_dacs/dacs.json

echo "Reboot to complete installation"
