#!/usr/bin/env uv run
# /// script
# dependencies = [
#   "cython",
#   "setuptools",
# ]
# ///

from Cython.Build import cythonize
from setuptools import Extension, setup

# Metadata is defined here for the build process
setup(
    name="totalsum2_cy",
    ext_modules=cythonize(
        Extension(
            "totalsum2_cy",
            sources=["totalsum2_cy.pyx"],
            # Link against the standard math library on UNIX-like systems
            libraries=["m"],
        ),
        annotate=True,  # Generates the HTML report to see C-conversions
        language_level="3",
    ),
)
