"""
Spaces configuration for building python
"""

load("tools-python/config.star", "version")

checkout.add_repo(
    rule = {"name": "tools/sysroot-gh"},
    repo = {
        "url": "https://github.com/work-spaces/sysroot-gh",
        "rev": "v2",
        "checkout": "Revision",
    },
)

checkout.add_repo(
    rule = {"name": "cpython"},
    repo = {
        "url": "https://github.com/python/cpython",
        "rev": "v{}".format(version),
        "checkout": "Revision",
        "clone": "Worktree"
    },
)

checkout.add_which_asset(
    rule = { "name": "which_pkg_config" },
    asset = {
        "which": "pkg-config",
        "destination": "sysroot/bin/pkg-config"
    }
)



