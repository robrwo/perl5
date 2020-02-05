################################################################################
#
#            !!!!!   Do NOT edit this file directly!   !!!!!
#
#            Edit mktests.PL and/or parts/inc/uv instead.
#
#  This file was automatically generated from the definition files in the
#  parts/inc/ subdirectory by mktests.PL. To learn more about how all this
#  works, please read the F<HACKERS> file that came with this distribution.
#
################################################################################

use FindBin ();

BEGIN {
  if ($ENV{'PERL_CORE'}) {
    chdir 't' if -d 't';
    unshift @INC, '../lib' if -d '../lib' && -d '../ext';
    require Config; import Config;
    use vars '%Config';
    if (" $Config{'extensions'} " !~ m[ Devel/PPPort ]) {
      print "1..0 # Skip -- Perl configured without Devel::PPPort module\n";
      exit 0;
    }
  }

  use lib "$FindBin::Bin";
  use lib "$FindBin::Bin/../parts/inc";

  die qq[Cannot find "$FindBin::Bin/../parts/inc"] unless -d "$FindBin::Bin/../parts/inc";

  sub load {
    require 'testutil.pl';
    require 'inctools';
  }

  if (11) {
    load();
    plan(tests => 11);
  }
}

use Devel::PPPort;
use strict;
BEGIN { $^W = 1; }

package Devel::PPPort;
use vars '@ISA';
require DynaLoader;
@ISA = qw(DynaLoader);
bootstrap Devel::PPPort;

package main;

BEGIN { require warnings if "$]" > '5.006' }

is(&Devel::PPPort::sv_setuv(42), 42);
is(&Devel::PPPort::newSVuv(123), 123);
is(&Devel::PPPort::sv_2uv("4711"), 4711);
is(&Devel::PPPort::sv_2uv("1735928559"), 1735928559);
is(&Devel::PPPort::SvUVx("1735928559"), 1735928559);
is(&Devel::PPPort::SvUVx(1735928559), 1735928559);
is(&Devel::PPPort::SvUVx(0xdeadbeef), 0xdeadbeef);
is(&Devel::PPPort::XSRETURN_UV(), 42);
is(&Devel::PPPort::PUSHu(), 42);
is(&Devel::PPPort::XPUSHu(), 43);
is(&Devel::PPPort::my_strnlen("abc\0def", 7), 3);
