module("luci.controller.njitclient", package.seeall)

function index()
	local e
        e = entry({"admin", "network", "njitclient"}, cbi("njitclient/njitclient"), _("NJIT Client"), 100)
	e.leaf = true
	e.acl_depends = { "luci-app-njitclient" }
end

