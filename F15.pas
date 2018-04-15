unit F15;

interface
	uses uDef,F1;
	procedure cariresep(FEResep : Aresep ; NResep : integer);

implementation

procedure cariresep(FEResep : Aresep ; NResep : integer);

var
	i : integer;
	namaresep : string;
	
begin
	readln(namaresep);
	for i := 1 to NResep do
	begin
		if (FEResep[i].nama = namaresep) then
		begin
			write(FEResep[i].nama,'|',FEResep[i].harga,'|',FEResep[i].n);
			for j := 1 to bahanresepmax do
			begin
				write('|',FEResep[i].bahan[j]);
			end;
		end
		else writeln('Nama Resep yang dimasukkan tidak ada');
	end;
end;
end.
