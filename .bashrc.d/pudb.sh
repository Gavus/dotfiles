#!/bin/bash -e

pudb-tty() {
	echo "export PUDB_TTY=$(tty)"
	perl -MPOSIX -e pause
}
