luci-app-njitclient
===================

LuCI configuration pages for <a href="https://github.com/liuqun/njit8021xclient/" target="_blank">njit8021xclient</a> (NJIT 802.1X Client)

适用于<a href="https://github.com/liuqun/njit8021xclient" target="_blank">njit8021xclient</a> (NJIT 802.1X Client) 的LuCI网页管理界面，支持设置是否自启动NJIT Client、保存用户配置信息等。

由于代码中只包含Lua和Bash脚本，所以不受限于平台，编译后的文件可以在任何平台安装。
同时由于没有设置依赖包，所以可以直接安装。

安装后请访问LuCI中的“系统”->“启动项”，并将“njitclient”设置为启用。
