# SCA3S: "side-channel analysis as a service"

<!--- -------------------------------------------------------------------- --->

*Acting as a component part of the wider
[SCARV](https://www.scarv.org)
project,
SCA3S is a collection of resources that support the development 
and analysis of cryptographic implementations wrt.
[side-channel attack](https://en.wikipedia.org/wiki/Side-channel_attack):
SCA3A is, more specifically, pitched as offering
"side-channel analysis as a service":
it allows users to acquire and analyse side-channel data-sets which stem 
from execution of their implementation, without (necessarily) owning or 
operating the associated infrastructure.
Mirroring the goals of SCARV, it places particular emphasis on analogue 
side-channels (e.g., power and EM) stemming from
[RISC-V](https://riscv.org)-based
platforms.*

<!--- -------------------------------------------------------------------- --->

## Overview

Forming a sub-field of more general implementation attacks, a
[side-channel attack](https://en.wikipedia.org/wiki/Side-channel_attack)
on some cryptographic target demands (at least) two phases:
a) acquisition of a data set,
   then
b) (crypt)analysis of said data set, which aims to satisfy a
   goal such as key recovery.
Particularly where the side-channel in question is
*analogue* (e.g., power consumption)
vs.
 *digital* (e.g., execution time)
in nature, the acquisition phase can present some significant
practical challenges.  Examples include
capital investment wrt. equipment, maintenance and operational experience, and logistics;
even though low-cost platforms such as
[ChipWhisperer](https://newae.com/tools/chipwhisperer)
help to some extent, the concept of
[Total Cost of Ownership (TCO)](https://en.wikipedia.org/wiki/Total_cost_of_ownership)
means they can still impact on how applicable the approach is.

The SCA3S project is intended to act as a suite of tools that, 
in combination, help to address such challenges.  The concept 
is simple: it aims to deliver a form of
"side-channel analysis [as a service](https://en.wikipedia.org/wiki/As_a_service)",
in a sense virtualising the resources and processes required
by locating them in the cloud and offering remote access via
high-level APIs.  As a result, it has applications in a wide
range of potential use-cases: examples include

- a side-channel oriented form of
  [Continuous Integration (CI)](https://en.wikipedia.org/wiki/Continuous_integration),
  potentially allowing small development teams to improve the
  resilience of their cryptographic implementations,
- shared use of bespoke or niche equipment, e.g., where some
  cryptographic design or standardisation process requires a
  forms of
  [build-it, break-it, fix-it](https://builditbreakit.org) 
  approach,
- forms of
  [CTF-like](https://en.wikipedia.org/wiki/Capture_the_flag#Computer_security)
  contest,
- as a means of supporting scientific tenets such as
  [open access](https://en.wikipedia.org/wiki/Open_access)
  and
  [reproducibility](https://en.wikipedia.org/wiki/Reproducibility)
  wrt. research publications.

<!--- -------------------------------------------------------------------- --->

## Organisation

```
├── bin                    - scripts (e.g., environment configuration)
├── build                  - working directory for build
├── doc                    - documentation
└── extern                 - external resources (e.g., submodules)
    ├── sca3s-backend        - submodule: scarv/sca3s-backend
    ├── sca3s-example        - submodule: scarv/sca3s-example
    ├── sca3s-harness        - submodule: scarv/sca3s-harness
    ├── sca3s-middleware     - submodule: scarv/sca3s-middleware
    ├── texmf                - submodule: scarv/texmf
    └── wiki                 - submodule: scarv/sca3s.wiki
```

*Originally* this was a 
[monorepo](https://en.wikipedia.org/wiki/Monorepo)
that housed *all* resources in one place, but, to make them easier to 
manage, it *now* acts as a container where each resource is housed in 
dedicated submodule.  Specifically, these include:

- [`scarv/sca3s-harness`](https://github.com/scarv/sca3s-harness)
  houses a
  framework for developing target implementations.  The idea is
  that users will fork the repository, which then supports a
  a) uniform communication interface to,
     and
  b) build system for
  the target implementation then developed within it.

- [`scarv/sca3s-example`](https://github.com/scarv/sca3s-example)
  houses an 
  example (or demonstration) instance of
  [`scarv/sca3s-harness`](https://github.com/scarv/sca3s-harness),
  and, more specifically, a basic 
  [AES-128](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard)
  implementation within the associated framework.

- [`scarv/sca3s-backend`](https://github.com/scarv/sca3s-backend)
  houses the
  software portion of the acquisition appliance; in combination
  with appropriate hardware, it allows generation data sets
  (e.g., power consumption traces)
  stemming from execution of a given target implementation.

- `scarv/sca3s-frontend`
  houses the
  cloud-based, specifically
  [AWS](https://aws.amazon.com)-based,
  infrastructure that provides all the user-facing functionality
  accessible via
  [`sca3s.scarv.org`](https://sca3s.scarv.org).

  software portion of the acquisition appliance; in combination
  with appropriate hardware, it allows generation data sets
  (e.g., power consumption traces)
  stemming from execution of a given target implementation.

- [`scarv/sca3s-middleware`](https://github.com/scarv/sca3s-middleware)
  houses various
  shared components, e.g., allowing consistent interfaces between 
  the frontend and backend.

<!--- -------------------------------------------------------------------- --->

## Quickstart (with more detail in the [wiki](https://github.com/scarv/sca3s/wiki))

Given the role as a container, you don't really *use* this repository in
the same way as some others.  Rather, various forms of documentation are
the most natural route to getting started:

- From a user-facing perspective, the 
  [harness repository](https://github.com/scarv/sca3s-harness)
  is the central resource: almost everything else relates to either the front- 
  and/or back-end infrastructure.
  The associated
  [wiki](https://github.com/scarv/sca3s-harness/wiki)
  contains a step-by-step workflow for using it, and so SCA3S more generally.

- This repository houses some system-wide documentation:

  1. Install any associated pre-requisites, e.g.,
  
     - a modern 
       [LaTeX](https://www.latex-project.org)
       distribution,
       such as
       [TeX Live](https://www.tug.org/texlive),
       including any required packages.
  
  2. Execute
  
     ```sh
     git clone https://github.com/scarv/sca3s.git ./sca3s
     cd ./sca3s
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
  
     | Command                   | Description                                                                          |
     | :------------------------ | :----------------------------------------------------------------------------------- |
     | `make build-doc`          | build the [LaTeX](https://www.latex-project.org)-based documentation                 |
     | `make spotless`           | remove *everything* built in `${REPO_HOME}/build`                                    |
  
- We maintain some 
  [Postman](https://www.postman.com)-based 
  [API documentation](https://documenter.getpostman.com/view/2245984/SzfCV6Nk)
  for the front-end infrastructure.

<!--- -------------------------------------------------------------------- --->

## Questions?

- read the
  [wiki](https://github.com/scarv/sca3s/wiki),
- raise an
  [issue](https://github.com/scarv/sca3s/issues),
- raise a
  [pull request](https://github.com/scarv/sca3s/pulls),
- drop us an 
  [email](mailto:sca3s@scarv.org).

<!--- -------------------------------------------------------------------- --->

## Acknowledgements

This work has been supported in part 

- by EPSRC via grant 
  [EP/R012288/1](https://gow.epsrc.ukri.org/NGBOViewGrant.aspx?GrantRef=EP/R012288/1) (under the [RISE](https://www.ukrise.org) programme), 
  and 
- by the
  [AWS Cloud Credits for Research](https://aws.amazon.com/research-credits)
  programme.

<!--- -------------------------------------------------------------------- --->
