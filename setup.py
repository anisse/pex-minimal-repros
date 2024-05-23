#!/usr/bin/env python3

import setuptools

setuptools.setup(
    name="repro",
    version="0.0.1",
    python_requires="~=3.9",
    dependency_links=[],
    entry_points={
        "console_scripts": [
            "entry = entry:main",
        ],
    },
    py_modules=["entry"],
)
