unit F17;

interface
	uses uDef,F1;
	procedure upgradeInventori(Nmax: integer);

implementation

	procedure upgradeInventori(Nmax: integer);
	begin
		Nmax := Nmax + 25;
	end;

end.
