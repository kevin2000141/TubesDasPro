unit F17;

interface
	uses uDef,F1;
	procedure upgradeInventori(var Nmax: longint);

implementation

	procedure upgradeInventori(var Nmax: longint);
	begin
		Nmax := Nmax + 25;
	end;

end.
