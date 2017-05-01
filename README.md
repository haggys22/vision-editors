# vision-editors

[![Build Status](https://travis-ci.org/vision-it/vision-editors.svg?branch=production)](https://travis-ci.org/vision-it/vision-editors)

This puppet profile allows the integration of various editors including their
setup on the nodes.

## Parameter


## Usage

Include in the *Puppetfile*:

```
mod vision_editors:
    :git => 'https://github.com/vision-it/vision-editors.git,
    :ref => 'production'
```

Include in a role/profile:

```puppet
contain ::vision_editors::vim
```
