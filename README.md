sickrage Cookbook
=================
[![Build Status](https://travis-ci.org/som3guy/sickrage.svg?branch=master)](https://travis-ci.org/som3guy/sickrage)

This cookbook will be designed to install and allow you to configure sickrage a well maintained fork of sickbeard.

Requirements
------------
Supported Operating systems:
-RHEL 6.*
-CentOS 6.*

Required cookbooks:
-Git
-Build Essentials
-yum-epel


Attributes
----------
All Default attributes should work at this point for supported operating systems.


Usage
-----
#### sickrage::default

e.g.
Just include `sickrage` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[sickrage]"
  ]
}
```

License and Authors
-------------------
Authors: TODO: Jeremy Miller
