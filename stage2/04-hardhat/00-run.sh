install -m 644 files/jtagenabler.cpp "${ROOTFS_DIR}/home/pi/jtagenabler.cpp"
install -m 644 files/hardhat/software/pah.py "${ROOTFS_DIR}/root/pah.py"
install -m 755 files/hardhat.sh "${ROOTFS_DIR}/root/hardhat.sh"
install -m 644 files/hardhat.service "${ROOTFS_DIR}/etc/systemd/system/hardhat.service"

on_chroot << EOF
systemctl enable hardhat.service
EOF