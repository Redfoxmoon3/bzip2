CFLAGS_SHARED_ATTR	+= 
CFLAGS_STATIC_ATTR	+= 
CFLAGS_APP_ATTR		+= 

install-headers-custom:
				mkdir -p $(DESTDIR)$(INCLUDEDIR)
				
				cp $(SOURCE_DIR)/include/bzlib.h $(DESTDIR)$(INCLUDEDIR)


install-app-extras:
				mkdir -p $(DESTDIR)$(BINDIR)
				mkdir -p $(DESTDIR)$(MANDIR)/man1
				
				cp -f $(SOURCE_DIR)/bzgrep $(DESTDIR)$(BINDIR)
				cp -f $(SOURCE_DIR)/bzmore $(DESTDIR)$(BINDIR)
				cp -f $(SOURCE_DIR)/bzdiff $(DESTDIR)$(BINDIR)
				
				ln -sf $(DESTDIR)$(BINDIR)/bzgrep $(DESTDIR)$(BINDIR)/bzegrep
				ln -sf $(DESTDIR)$(BINDIR)/bzgrep $(DESTDIR)$(BINDIR)/bzfgrep
				ln -sf $(DESTDIR)$(BINDIR)/bzmore $(DESTDIR)$(BINDIR)/bzless
				ln -sf $(DESTDIR)$(BINDIR)/bzdiff $(DESTDIR)$(BINDIR)/bzcmp
				
				cp -f $(SOURCE_DIR)/bzip2.1 $(DESTDIR)$(MANDIR)/man1
				
				ln -sf $(DESTDIR)$(MANDIR)/bzip2.1 $(DESTDIR)$(MANDIR)/man1/bunzip2.1
				ln -sf $(DESTDIR)$(MANDIR)/bzip2.1 $(DESTDIR)$(MANDIR)/man1/bzcat.1
				ln -sf $(DESTDIR)$(MANDIR)/bzip2.1 $(DESTDIR)$(MANDIR)/man1/bzip2recover.1
				
				echo ".so man1/bzgrep.1" > $(DESTDIR)$(MANDIR)/man1/bzegrep.1
				echo ".so man1/bzgrep.1" > $(DESTDIR)$(MANDIR)/man1/bzfgrep.1
				echo ".so man1/bzmore.1" > $(DESTDIR)$(MANDIR)/man1/bzless.1
				echo ".so man1/bzdiff.1" > $(DESTDIR)$(MANDIR)/man1/bzcmp.1


bzip2recover.o:
	$(CC) $(CFLAGS) -c $(SOURCE_DIR)/src/bzip2recover.c -o $(SOURCE_DIR)/src/bzip2recover.o

bzip2recover: bzip2recover.o
	$(CC) $(LDFLAGS_APP) -o $(SOURCE_DIR)/bin/bzip2recover $(SOURCE_DIR)/src/bzip2recover.o -Llib -lbz2
			
app: bzip2recover



clean: cleanbzip2register

cleanbzip2register:
	rm -f $(SOURCE_DIR)/src/bzip2recover.o
	rm -f $(SOURCE_DIR)/bin/bzip2recover