# `lab.scarv.org`: "lab. free" side-channel analysis

<!--- -------------------------------------------------------------------- --->

[![Build Status](https://travis-ci.com/scarv/lab.scarv.org.svg)](https://travis-ci.com/scarv/lab.scarv.org)
[![Documentation](https://codedocs.xyz/scarv/lab.scarv.org.svg)](https://codedocs.xyz/scarv/lab.scarv.org)

<!--- -------------------------------------------------------------------- --->

*Acting as a component part of the
[SCARV](https://www.scarv.org)
project,
`lab.scarv.org` is a collection of resources that support the
development and analysis of cryptographic implementations wrt.
[side-channel attack](https://en.wikipedia.org/wiki/Side-channel_attack):
it places particular emphasis on analogue side-channels (e.g.,
power and EM) stemming from
[RISC-V](https://riscv.org)-based
platforms.*

<!--- -------------------------------------------------------------------- --->

## Overview

The field of implementation attacks


Although platforms such as
[ChipWhisperer](https://newae.com/tools/chipwhisperer)

research and development challenges in this field are often
exaserbated by a range of practical problems:

capital investment, maintainence and operational experience, logistics\


we view the result as helping to supporting core scientific
tenets such as
[open access](https://en.wikipedia.org/wiki/Open_access)
and
[reproducibility](https://en.wikipedia.org/wiki/Reproducibility).

support use-cases such as forms of side-channel aware

- [Continuous Integration (CI)](https://en.wikipedia.org/wiki/Continuous_integration)
- [build-it, break-it, fix-it](https://builditbreakit.org) 
  contests

<!--- -------------------------------------------------------------------- --->

## Organisation

Originally this repository housed *all* resources in one place,
but to make them easier to manage, it *now* acts as a container: 
the resources are housed in dedicated submodules.  Specifically, 
these include

- [`scarv/lab-spec`](https://github.com/scarv/lab-spec)
- [`scarv/lab-acquire`](https://github.com/scarv/lab-acquire)
- [`scarv/lab-analyse`](https://github.com/scarv/lab-analyse)
- [`scarv/lab-target`](https://github.com/scarv/lab-target)
- [`scarv/lab-cloud`](https://github.com/scarv/lab-cloud)

<!--- -------------------------------------------------------------------- --->

## Quickstart

1. Install any associated pre-requisites, e.g.,

   - a modern 
     [LaTeX](https://www.latex-project.org)
     distributation,
     such as
     [TeX Live](https://www.tug.org/texlive),
     including any required packages.

2. Execute

   ```sh
   git clone https://github.com/scarv/lab.scarv.org.git
   cd ./lab.scarv.org
   git submodule update --init --recursive
   source ./bin/conf.sh
   ```

   to clone and initialise the repository,
   then configure the environment;
   for example, you should find that the environment variable
   `REPO_HOME`
   is set appropriately.

3. Use targets in the top-level `Makefile` to drive a set of
   common tasks, e.g.,

   - execute

     ```sh
     make doc
     ```

     to build the documentation,

   - execute

     ```sh
     make clean
     ```

     to clean-up
     (e.g., remove everything built in `${REPO_HOME}/build`).

<!--- -------------------------------------------------------------------- --->

## Acknowledgements

This work has been supported in part by EPSRC via grant 
[EP/R012288/1](https://gow.epsrc.ukri.org/NGBOViewGrant.aspx?GrantRef=EP/R012288/1),
under the [RISE](http://www.ukrise.org) programme.

<!--- -------------------------------------------------------------------- --->
