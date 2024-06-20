==================
Thesis LaTeX Template for Beijing University of Posts and Telecommunications
==================

|license|
|xelatex|
|university|

This is a latex template for PhDs in BUPT to finish their dissertation in a no-hair-loss manner.

------------------
DOCUMENTATION
------------------

Full docs are listed here_.

------------------
ENVIRONMENT SETUP
------------------

- TeXLive (>= 2017 recommended)

IMPORTANT: All files *MUST* be encoded in UTF-8.

------------------
TUTORIAL
------------------
********************
Recommended Editor
********************

`TeXStudio <http://www.texstudio.org/>`_

******************
How to compile
******************

*Only* ``xelatex`` can be used to compile this project.

- Compile by hand

::

    # with bibtex
    xelatex main.tex
    bibtex main.tex
    xelatex main.tex
    xelatex main.tex

- Compile by TeXStudio

Configure the TeXStudio to use ``xelatex`` as default compiler and press compile button.

***********************
How to add chapter
***********************

- Add a new ``tex`` file in ``Chapter`` directory, assuming the name is ``chapter_I.tex``.
- Open this file, insert ``\chapter{Your chapter title}`` as first line.
- Add a new line ``\include{Chapter/chapter_I.tex}`` in ``main.tex`` after ``\mainmatter``.
- Then compile.

********************************************
How to remove the line number in algorithms
********************************************

- Open class file ``buptthesis.cls``, find the line with ``\RequirePackage[xxx]{algorithm2e}``.
- Remove the option ``linesnumbered`` and re-compile.
- The meanings of the rest options can be found `here <http://tug.ctan.org/macros/latex/contrib/algorithm2e/doc/algorithm2e.pdf>`__ in Chapter 7.

------------------
AUTHOR LIST
------------------

***************
INITIATOR
***************

The first version of this template is designed and implemented by Haojun Yang <yanghaojun.yhj@gmail.com>, great thanks for his creativeness and wisdom.

Check `this file`_ for complete author list.

.. _this file: https://github.com/houluy/bupTemplate/blob/master/AUTHORS.rst
.. _here: https://github.com/houluy/bupTemplate/blob/master/docs/main.rst

.. |license| image:: https://img.shields.io/badge/license-GPL--3.0-blue.svg?style=plastic
.. |xelatex| image:: https://img.shields.io/badge/TeX-XeLaTeX-lightgrey.svg?style=plastic
.. |university| image:: https://img.shields.io/badge/unversity-BUPT-red.svg?style=plastic
