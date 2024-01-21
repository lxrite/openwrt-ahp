AHP for OpenWrt/LEDE
===

- 使用 OpenWrt 提供的 [SDK](https://openwrt.org/docs/guide-developer/toolchain/using_the_sdk) 来编译

    ```bash
    # 以 mt7620 和 OpenWrt 23.05.0 为例
    # 下载 SDK
    wget https://downloads.openwrt.org/releases/23.05.0/targets/ramips/mt7620/openwrt-sdk-23.05.0-ramips-mt7620_gcc-12.3.0_musl.Linux-x86_64.tar.xz
    tar -xf openwrt-sdk-23.05.0-ramips-mt7620_gcc-12.3.0_musl.Linux-x86_64.tar.xz
    cd openwrt-sdk-23.05.0-ramips-mt7620_gcc-12.3.0_musl.Linux-x86_64
    # 安装 feeds
    ./scripts/feeds update
    ./scripts/feeds install libstdcpp
    # 获取 Makefile
    git clone https://github.com/lxrite/openwrt-ahp.git package/ahp
    # 选择要编译的包 Network -> (ahpc ahps)
    # 同时也可以取消一些不需要编译的来节省编译时间
    make menuconfig
    # 开始编译
    make package/ahp/compile V=s
    # 查看编译完成的 ipk 包
    find bin -name ahp*.ipk
    # bin/packages/mipsel_24kc/base/ahpc_1.0.0-1_mipsel_24kc.ipk
    # bin/packages/mipsel_24kc/base/ahps_1.0.0-1_mipsel_24kc.ipk
    # 上传到 OpenWrt 上使用 opkg 进行安装
    ```
