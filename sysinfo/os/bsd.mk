OS		= bsd
OS_APP_PREFIX	=
OS_APP_SUFFIX	=
OS_LIB_PREFIX	= lib
OS_LIB_SUFFIX	= .so
OS_IMPLIB_EXT	= .invalid
OS_LIBDEF_EXT	= .invalid
OS_ARCHIVE_EXT	= .a
OS_SONAME	= symlink
OS_BINFMT	= ELF

.PHONY:		$(IMPLIB_DEF) $(IMPLIB_VER) $(IMPLIB_SONAME) $(IMPLIB_SOLINK)