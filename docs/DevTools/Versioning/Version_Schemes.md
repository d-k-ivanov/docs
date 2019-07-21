## PEP

[PepVer](https://www.python.org/dev/peps/pep-0440/#version-scheme) – versioning scheme specified in PEP-420. Based on SemVer, but has much more features. All tools in Python  parse projects versions by this PEP, so you can use it for your project and don’t care about machines. However, this pep allows to make over-complicated versions that really difficult to understand for humans.

## SemVer

[SemVer](https://semver.org/) – Semantic Versioning – most recommend versioning scheme. Allows your users (and machines) by version easily understand when you have broken something in your project, have added some new features or have fixed some bugs. If you don’t know what to use, use it.

Given a version number MAJOR.MINOR.PATCH, increment the:

* MAJOR version when you make incompatible API changes,
* MINOR version when you add functionality in a backwards-compatible manner, and
* PATCH version when you make backwards-compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## ComVer

[ComVer](https://gitlab.com/staltz/comver) – Compatible Versioning – this is semver without patch number. All changes that don’t broke anything increments minor version number. You can use it if in your project it’s difficult to separate bug fixes and features.

Given a version number MAJOR.MINOR, increment the:

* MAJOR version when you make backwards-incompatible updates of any kind
* MINOR version when you make 100% backwards-compatible updates

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR format.

## CalVer

[CalVer](https://calver.org) – Calendar Versioning – it’s when you use current date (year and month) instead of version. For example, 2018.12. DepHell uses 4-numbers year as major number to explicitly indicate that your project uses CalVer. Also you can pass micro rule to add day in the version number. If previous release was today then micro rule will just increment this number. You can use this versioning if you don’t want to care about versioning at all. However, this is strongly discouraged for any projects that can be used as dependency for third-party code.

There are multiple calendar versioning schemes, long used by projects big and small. Rather than declaring a single scheme to be CalVer, it's important to recognize the practicality of each and design the scheme to fit the project. First, the parts of the version:

* Major - The first number in the version. 2 and 3 are Python's famous major versions. The major segment is the most common calendar-based component.
* Minor - The second number in the version. 7 is the most popular minor version of Python.
* Micro - The third and usually final number in the version. Sometimes referred to as the "patch" segment.
* Modifier - An optional text tag, such as "dev", "alpha", "beta", "rc1", and so on.

The vast majority of modern version identifiers are composed of two or three numeric segments, plus the optional modifier. Convention suggests that four-numeric-segment versions are discouraged.

## RomVer

[RomVer](https://dafoster.net/articles/2015/03/14/semantic-versioning-vs-romantic-versioning/) – Romantic Versioning – romantic versioning (not Sentimental Versioning, please) is when humans and marketing more important for you than machines. Bumping major, minor or patch number shows importance of changes and says nothing about type of this changes. Every update can break everything. As calver, never use this versioning in tools that can be used in any third-party code. But it’s OK for products for users like Firefox. DepHell allows only major, minor and patch rules for RomVer because this versioning for humans, and humans don’t understand complicated combinations of pre, post and local.

* A version number is a multi-part value such as X, X.Y, or X.Y.Z; with numeric components.
* A conceptually major change bumps the first component of the value.
* A conceptually minor change or bug fix bumps a later component of the value.

Romantic versioning is meant primarily for humans to understand, at the possible expense of easy understanding by a computer. This makes it suitable for marketing purposes (since marketing is directed at humans) but often not suitable for automated dependency management (which is performed by a computer).

## Serial

[Serial](https://packaging.python.org/guides/distributing-packages-using-setuptools/#serial-versioning) – Serial Versioning – this is just single number that you increment for every release (1, 2, 3…). Simplest versioning scheme, but doesn’t provide any information about release changes type. Avoid this scheme if possible.

## Roman

[Roman](https://en.wikipedia.org/wiki/Roman_numerals) – Roman numerals – roman numbers versioning. Never use it. It won’t work after third release. However, you can try it for your internal project. Just for fun. Don’t say anyone that I’ve recommended it to you.

## ZeroVer

[ZeroVer](https://0ver.org/) – 0-based Versioning – kind of semver, but your major number always 0. Sounds like joke, but this is the best versioning for experimental projects that can broke anything in any release. It says to your users that they can’t upgrade without running quite strong integration tests.

Unlike other versioning schemes like Semantic Versioning and Calendar Versioning, ZeroVer (AKA 0ver) is simple: Your software's major version should never exceed the first and most important number in computing: zero.

A down-to-earth demo:

* YES: 0.0.1, 0.1.0dev, 0.4.0, 0.4.1, 0.9.8n, 0.999999999
* NO: 1.0, 1.0.0-rc1, 18.0, 2018.04.01

In short, software versioning best practice is like the modern list/array: 0-based.

We'll leave it to computer scientists to determine how expert coders wield the power of the "zero-point" to produce top-notch software. Meanwhile, open-source and industry developers agree: ZeroVer is software's most popular versioning scheme for good reason.

## FebVer

[FebVer](https://fibver.org/) – Fibonacci Versioning – In the world of software management there exists a dreaded place called “dependency hell.” The bigger your system grows and the more packages you integrate into your software, the more likely you are to find yourself, one day, in this pit of despair.

In systems with many dependencies, releasing new package versions can quickly become a nightmare. Many different versioning systems exists, including the very popular Semantic Versioning - currently in version 1.2.0 2.0.0. While all they are really trying to help you with moving your project forward, it is not the numbers and rules used that make it so problematic, but rather our human nature.

As a solution to this problem, I propose yet another one broken versioning rules, consisting with some numbers and dots. With this very simple set of rules and requirements that dictate how version numbers are assigned and incremented, you can communicate changes to your public API or software units. As by default they won’t help you in maintaining your software, it is at least mathematically elegant.

Given a version number MAJOR.MINOR.PATCH, increment to the next Fibonacci number the:

* MAJOR version when you make incompatible API changes,
* MINOR version when you add functionality in a backwards compatible manner, and
* PATCH version when you make backwards compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
