.SUFFIXES: .m4 .ru .en .es .ptbr .pl .it .de .fr
.m4.en:
	m4 --define=lang=en $*.m4 >$*.en
.m4.ru:
	m4 --define=lang=ru $*.m4 >$*.ru
.m4.es:
	m4 --define=lang=es $*.m4 >$*.es
.m4.ptbr:
	m4 --define=lang=ptbr $*.m4 >$*.ptbr
.m4.pl:
	m4 --define=lang=es $*.m4 >$*.pl
.m4.it:
	m4 --define=lang=it $*.m4 >$*.it
.m4.de:
	m4 --define=lang=de $*.m4 >$*.de
.m4.fr:
	m4 --define=lang=fr $*.m4 >$*.fr

M4SOURCES := $(shell find . $(pwd) -name '*.m4')
RU_LISTINGS := $(M4SOURCES:%.m4=%.ru)
EN_LISTINGS := $(M4SOURCES:%.m4=%.en)
ES_LISTINGS := $(M4SOURCES:%.m4=%.es)
PL_LISTINGS := $(M4SOURCES:%.m4=%.pl)
PTBR_LISTINGS := $(M4SOURCES:%.m4=%.ptbr)
IT_LISTINGS := $(M4SOURCES:%.m4=%.it)
DE_LISTINGS := $(M4SOURCES:%.m4=%.de)
FR_LISTINGS := $(M4SOURCES:%.m4=%.fr)

all:    RU EN RU-A5 EN-A5 RU-lite EN-lite RU-A5-lite EN-A5-lite

clean:
	rm -f *.aux
	rm -f *.fls
	rm -f *.swp
	rm -f *.pdf
	rm -f *.out
	rm -f *.toc
	rm -f *.stackdump
	rm -f *.bbl
	rm -f *.blg
	rm -f *.fdb_latexmk
	rm -f *.idx
	rm -f *.ilg
	rm -f *.ind
	rm -f *.html
	rm -f *.tmp
	rm -f *-2k
	rm -f *.4ct
	rm -f *.4tc
	rm -f *.dvi
	rm -f *.glg
	rm -f *.glo
	rm -f *.gls
	rm -f *.idv
	rm -f *.ist
	rm -f *.xref
	rm -f *.torrent
	rm -f *.en
	rm -f *.ru
	rm -f RE_for_beginners-*.log
	rm -f Reverse_Engineering_for_Beginners-*.log
	rm -f RE4B-*.log
	rm -f *~
	rm -f *.log
	rm -f *.lyx
	rm -f *.ni
	rm -f *.odt
	rm -f *.rtf

# there are two xelatex invocations at the end, because \myref{} doesn't show pages correctly otherwise
define compile
	rm -f *.fls
	rm -f *.bbl
	rm -f *.aux
	xelatex $1
	biber $1
	makeindex $1
	makeglossaries $1
	xelatex $1
	xelatex $1
endef

RU: $(RU_LISTINGS)
	$(call compile,RE4B-RU)

EN: $(EN_LISTINGS)
	$(call compile,RE4B-EN)

RU-A5: $(RU_LISTINGS)
	$(call compile,RE4B-RU-A5)

EN-A5: $(EN_LISTINGS)
	$(call compile,RE4B-EN-A5)

RU-lite: $(RU_LISTINGS)
	$(call compile,RE4B-RU-lite)

EN-lite: $(EN_LISTINGS)
	$(call compile,RE4B-EN-lite)

RU-A5-lite: $(RU_LISTINGS)
	$(call compile,RE4B-RU-A5-lite)

EN-A5-lite: $(EN_LISTINGS)
	$(call compile,RE4B-EN-A5-lite)

ES:	$(ES_LISTINGS)
	$(call compile,RE4B-ES)

PTBR:	$(PTBR_LISTINGS)
	$(call compile,RE4B-PTBR)

ES-lite: $(ES_LISTINGS)
	$(call compile,RE4B-ES-lite)

PTBR-lite: $(PTBR_LISTINGS)
	$(call compile,RE4B-PTBR-lite)

PL:	$(PL_LISTINGS)
	$(call compile,RE4B-PL)

PL-lite: $(PL_LISTINGS)
	$(call compile,RE4B-PL-lite)

IT:	$(IT_LISTINGS)
	$(call compile,RE4B-IT)
IT-lite: $(IT_LISTINGS)
	$(call compile,RE4B-IT-lite)

DE:	$(DE_LISTINGS)
	$(call compile,RE4B-DE)
DE-lite: $(DE_LISTINGS)
	$(call compile,RE4B-DE-lite)

FR:	$(FR_LISTINGS)
	$(call compile,RE4B-FR)

FR-A5:	$(FR_LISTINGS)
	$(call compile,RE4B-FR-A5)

FR-lite: $(FR_LISTINGS)
	$(call compile,RE4B-FR-lite)

FR-A5-lite: $(FR_LISTINGS)
	$(call compile,RE4B-FR-A5-lite)
