# alpr

Arch Linux package repository.

## Adding the repository to pacman

```conf
# Put this at the end of /etc/pacman.conf.
#
# Replace the repository name and/or server if you changed them in local.mk.
[alpr]
SigLevel = Required
Server = file:///var/alpr
```

## Adding the local repository as a second cache

Add these lines under `[options]` inside `/etc/pacman.conf`.

```conf
CacheDir = /var/cache/pacman/pkg/
CacheDir = file:///var/alpr
```

This prevents duplicating packages.
