use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/lib";
use Test::More;

use B::Hooks::EndOfScope;

plan skip_all => 'Skipping XS test in PP mode'
  unless $INC{'B/Hooks/EndOfScope/XS.pm'};

plan tests => 1;

my @warnings;
BEGIN { $SIG{__WARN__} = sub { push @warnings, $_[0] } }

BEGIN { on_scope_end { 1 } }

use OtherClass;

is $warnings[0], undef,
  'on_scope_end used in module where loading module used on_scope_end';
