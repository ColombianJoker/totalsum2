
from setuptools import setup
from Cython.Build import cythonize
import numpy as np

setup(
    name="totalsum_cy",
    ext_modules=cythonize(
        "totalsum_cython_module.pyx",
        compiler_directives={
            'language_level': 3,
            'boundscheck': False,
            'wraparound': False,
        }
    ),
    include_dirs=[np.get_include()],
)
