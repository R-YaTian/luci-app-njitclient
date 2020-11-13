include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-njitclient
PKG_VERSION=1.0
PKG_RELEASE:=7

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-njitclient
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=NJIT 802.1X Client for LuCI
	PKGARCH:=all
endef

define Package/luci-app-njitclient/description
	This package contains LuCI configuration pages for njit8021xclient.
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/po/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-njitclient/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/njitclient.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/crontabs
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/njitclient
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d

	$(INSTALL_CONF) ./files/root/etc/config/njitclient $(1)/etc/config/njitclient
	$(INSTALL_DATA) ./files/root/etc/crontabs/root $(1)/etc/crontabs/root
	$(INSTALL_BIN) ./files/root/etc/init.d/njitclient $(1)/etc/init.d/njitclient
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/model/cbi/njitclient/njitclient.lua $(1)/usr/lib/lua/luci/model/cbi/njitclient/njitclient.lua
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/controller/njitclient.lua $(1)/usr/lib/lua/luci/controller/njitclient.lua
	$(INSTALL_DATA) ./files/root/usr/share/rpcd/acl.d/luci-app-njitclient.json $(1)/usr/share/rpcd/acl.d/luci-app-njitclient.json
endef

$(eval $(call BuildPackage,luci-app-njitclient))

