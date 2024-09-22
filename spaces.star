"""

"""

checkout.add_repo(
    rule = {"name": "tools/sysroot-ninja"},
    repo = {"url": "https://github.com/work-spaces/sysroot-ninja", "rev": "v1", "checkout": "Revision"},
)

checkout.add_repo(
    rule = {"name": "tools/sysroot-cmake"},
    repo = {
        "url": "https://github.com/work-spaces/sysroot-cmake",
        "rev": "v3",
        "checkout": "Revision",
    },
)

checkout.add_repo(
    rule = {"name": "tools/sysroot-llvm" },
    repo = {
        "url": "https://github.com/work-spaces/sysroot-llvm",
        "rev": "v19",
        "checkout": "Revision"
    }
)

checkout.add_repo(
    rule = {"name": "cpython"},
    repo = {
        "url": "https://github.com/python/cpython",
        "rev": "v3.11.10",
        "checkout": "Revision",
    }
)
