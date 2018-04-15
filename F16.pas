unit F16;

interface
	uses uDef,F1;
	procedure tambahresep (FEResep: Aresep; NResep: integer; FEBahanMentah: Abahanmentah ; FEBahanOlahan: Abahanolahan);
	
implementation

	procedure tambahresep (FEResep: Aresep; NResep: integer; FEBahanMentah: Abahanmentah ; FEBahanOlahan: Abahanolahan);
	var
		resepbaru : string;
		a, b : string;
		i : integer;
		j : integer;
	
begin
		readln(resepbaru);
		readln(a);
		FEResep.N[NResep + 1] := 0 ;
		for i:=1 to NBahanM do
		begin
			if a = FEBahanMentah[i].nama then
			begin
					writeln('Bahan tidak tersedia');
			end else
			begin	
				for j := 1 to NResep do
				begin
					FEResep.bahan[NResep + 1] := a;
					FEResep.N[NResep +1] := FEResep.N[NResep +1] + 1;
				end;
			end;
	end;
	readln(b);
	for i:=1 to NBahanM do
	begin
		if a = FEBahanMentah[i].nama then
		begin
			writeln('Bahan tidak tersedia');
		end
		else
			for j := 1 to NResep do
			begin
				FEResep.bahan[NResep + 1] := b;
				FEResep.N[NResep +1] := FEResep.N[NResep +1] + 1;
			end;
	FEResep.harga[NResep + 1] := 0.125 * (
end;
end;
end.
