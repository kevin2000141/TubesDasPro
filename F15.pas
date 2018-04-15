unit F15;

interface
	uses uDef,F1;
	procedure cariresep(FEResep: Aresep; NResep: integer);

implementation

	procedure cariresep(FEResep: Aresep; NResep: integer);
	var
		i : integer;
		namaresep : string;
	
	begin
		write('Masukkan nama resep yang ingin dicari: ');
		readln(namaresep);
		for i := 1 to NResep do
		begin
			if (FEResep[i].nama = namaresep) then
			begin
				writeln('Nama Resep: ', FEResep[i].nama);
				writeln('Harga Resep: ', FEResep[i].harga);
				writeln('Jumlah Bahan: ', FEResep[i].n);
				writeln('Bahan-bahan: ', FEResep[i].bahan[j])
				for j := 2 to FEResep[i].n do
				begin
					write(', ', FEResep[i].bahan[j]);
				end;
			end else 
			begin
				writeln('Nama Resep yang dimasukkan tidak ada');
			end;
		end;
	end;

end.
