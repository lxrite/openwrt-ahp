AHP for OpenWrt/LEDE
===

- 使用 OpenWrt 提供的 [SDK](https://openwrt.org/docs/guide-developer/obtain.firmware.sdk) 来编译

    ```bash
    # 以 mt7620 为例
    # 下载 SDK
    wget https://archive.openwrt.org/releases/17.01.4/targets/ramips/mt7620/lede-sdk-17.01.4-ramips-mt7620_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz
    tar -xf lede-sdk-17.01.4-ramips-mt7620_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz
    cd lede-sdk-17.01.4-ramips-mt7620_gcc-5.4.0_musl-1.1.16.Linux-x86_64
    # 安装 feeds
    ./scripts/feeds update
    ./scripts/feeds install boost-system boost-regex libstdcpp libopenssl libatomic
    # 获取 Makefile
    git clone https://github.com/lxrite/openwrt-ahp.git package/ahp
    # 选择要编译的包 Network -> (ahpc ahps)
    # 同时也可以取消一些不需要编译的包来节省编译时间（比如boost只需要boost-system和boost-regex）
    make menuconfig
    # 开始编译
    make package/ahp/compile V=s
    # 查看编译完成的 ipk 包
    find bin -name ahp*.ipk
    # bin/packages/mipsel_24kc/base/ahpc_1.0.0-1_mipsel_24kc.ipk
    # bin/packages/mipsel_24kc/base/ahps_1.0.0-1_mipsel_24kc.ipk
    # 上传到 OpenWrt 上使用 opkg 进行安装
    ```
