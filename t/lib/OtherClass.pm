package OtherClass;
use B::Hooks::EndOfScope;
BEGIN { on_scope_end { 1 } }
1;
