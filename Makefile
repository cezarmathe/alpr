# Makefile for an Arch Linux local package repository.

# Include the local configuration, if present.
sinclude local.mk

# The location of the chroot.
CHROOT ?= /var/alpr-chroot

# The name of the repository.
REPO_NAME ?= alpr
# The path to the repository root.
REPO_ROOT ?= /var/alpr

# The path to the repository file.
REPO_PATH = $(REPO_ROOT)/$(REPO_NAME).db.tar.gz

# The packages that shall be built.
PKGS ?= $(shell ls src)

# The default recipe.
default: $(PKGS) add

# Flags to pass to makepkg.
MAKEPKG_FLAGS ?= --syncdeps --noconfirm --log --holdver --clean
# The command used to build the packages inside the chroot.
MAKECHROOTPKG ?= makechrootpkg -c -r "$(CHROOT)" -- $(MAKEPKG_FLAGS)

# The gpg command to run for generating the package signature.
GPG ?= gpg --detach-sign --use-agent

# Build, sign and move packages.
$(PKGS): init
	@echo "---> Building package $@."
	cd src/$@; $(MAKECHROOTPKG)
	@echo "---> Signing package $@."
	cd src/$@; $(GPG) *.pkg.tar.zst
	@echo "---> Moving package archive and signature for $@ to repository root $(REPO_ROOT)."
	cd src/$@; mv *.pkg.tar.zst "$(REPO_ROOT)/"
	cd src/$@; mv *.sig "$(REPO_ROOT)/"
.PHONY: $(PKGS)

# The command used for adding packages to the repository.
REPO_ADD ?= repo-add --sign --verify --new --remove

# Add all packages to the repository.
add: init $(PKGS)
	@echo "---> Adding all packages to repository $(REPO_NAME)."
	$(REPO_ADD) $(REPO_PATH) $(REPO_ROOT)/*.pkg.tar.zst
.PHONY: add

# Initialize the system.
init: $(CHROOT)/root $(REPO_PATH)

# Create the chroot.
$(CHROOT)/root:
	mkdir -p $(CHROOT)
	mkarchroot $(CHROOT)/root base-devel

# Create the repository.
$(REPO_PATH):
	mkdir -p $(REPO_ROOT)
	repo-add $(REPO_PATH)

# Update the chroot.
update:
	arch-nspawn "$(CHROOT)/root" pacman -Syu
.PHONY: update

# Command used to remove packages from the repository.
REPO_REMOVE ?= repo-remove -s -v
# The package to be removed.
REMOVE_PKG ?=

# Remove packages from the repository.
remove:
	$(REPO_REMOVE) $(REPO_PATH) $(REMOVE_PKG)
	rm $(REPO_ROOT)/$(REMOVE_PKG)-*.pkg.tar.zst
	rm $(REPO_ROOT)/$(REMOVE_PKG)-*.pkg.tar.zst.sig
.PHONY: remove
