"""

"""

load("tools/sysroot-gh/publish.star", "add_publish_archive")
load("tools-python/config.star", "version")


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

add_publish_archive(
    name = "python",
    input = "build/install",
    version = version,
    deploy_repo = "https://github.com/work-spaces/tools-python",
    deps = ["install"]
)