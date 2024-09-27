"""

"""

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
        "rev": "v3.11.10",
        "checkout": "Revision",
        "clone": "Spaces"
    },
)

checkout.add_which_asset(
    rule = { "name": "which_pkg_config" },
    asset = {
        "which": "pkg-config",
        "destination": "sysroot/bin/pkg-config"
    }
)

workspace = info.get_absolute_path_to_workspace();

run.add_exec(
    rule = { "name": "configure" },
    exec = {
        "working_directory": "build",
        "command": "../cpython/configure",
        "args": [
            "--with-pydebug",
            "--prefix={}/build/install".format(workspace)
        ]
    }
)

run.add_exec(
    rule = { "name": "build", "deps": ["configure"] },
    exec = {
        "working_directory": "build",
        "command": "make",
        "args": [
            "-j8"
        ]
    }
)

run.add_exec(
    rule = { "name": "install", "deps": ["build"] },
    exec = {
        "working_directory": "build",
        "command": "make",
        "args": [
            "install"
        ]
    }
)

