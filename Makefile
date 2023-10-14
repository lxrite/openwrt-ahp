include $(TOPDIR)/rules.mk

PKG_NAME:=ahp
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/lxrite/azure-http-proxy.git
PKG_SOURCE_VERSION:=b82ee90b8338b8fd75c8381581e2001fa024e582
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/ahpc
	SECTION:=base
	CATEGORY:=Network
	TITLE:= Azure Http Proxy Client
	URL:=https://github.com/lxrite/azure-http-proxy
	DEPENDS:=+libopenssl +libstdcpp
endef

define Package/ahps
	SESION:=base
	CATEGORY:=Network
	TITLE:= Azure Http Proxy Server
	URL:=https://github.com/lxrite/azure-http-proxy
	DEPENDS:=+libopenssl +libstdcpp
endef

define Package/ahpc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ahpc $(1)/usr/bin
endef

define Package/ahps/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ahps $(1)/usr/bin
endef

$(eval $(call BuildPackage,ahpc))
$(eval $(call BuildPackage,ahps))
