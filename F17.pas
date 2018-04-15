unit F17;

interface
	uses uDef,F1;
	procedure upstorage(Nmax : integer);

implementation

procedure upstorage(Nmax : integer);

begin
	Nmax := Nmax + 25;
end;
end.
