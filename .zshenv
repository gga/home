export LC_CTYPE=en_US.UTF-8
export EDITOR='emacsclient'

export P4PORT=faith:1666
export P4CONFIG=.p4rc

export P4CHECK_PRUNE=".rb~ .yml~ .xml~ .properties~ .log .css .DS_Store .haml~ .erb~ .feature~ .xsd~"
export P4MERGE=/Applications/Utilities/p4merge.app/Contents/MacOS/p4merge

export PYTHONPATH=/usr/local/lib/python2.5/site-packages:$PYTHONPATH

case "$OSTYPE" in
    darwin*)
	export DEV_ROOT=~/dev
	PATH_ADDITIONS=/Library/PostgreSQL/8.3/bin:/usr/local/git/bin
	MANPATH=$MANPATH:/usr/local/git/man
	;;
    freebsd*)
	export DEV_ROOT=~/dev
	export JAVA_HOME=/usr/local/jdk1.5.0
	PATH_ADDITIONS=$JAVA_HOME/bin:/opt/jruby/bin
	export SWLIB_ROOT=$DEV_ROOT/swlib
	;;
    cygwin)
	export DEV_ROOT=e:/dev
	PATH_ADDITIONS=
	export SWLIB_ROOT=z:/swlib2
	;;
    *)
	;;
esac

export WS_ROOT=$DEV_ROOT/ws
export NETPAGE_TOOLS=$WS_ROOT/tools/main/a/tools/bin

export NNTPSERVER='sbr-news'

PATH=/opt/local/bin:$PATH:/usr/local/bin:$NETPAGE_TOOLS:$NETPAGE_TOOLS/freebsd:$PATH_ADDITIONS
