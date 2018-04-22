unit F15;

interface
	uses uDef,F1,sysutils;
	procedure cariresep(FEResep: Aresep; NResep: integer);
	{Prosedur untuk mancari resep dalam array ressep}
	{Prosedur ini akan meminta masukkan dari pengguna berupa naam resep, lalu jika nama reeep ada di dalam array resep, maka
	program akan menampilkan nama resep yang dimasukkan, harga resep, jumlah bahan, dan bahan - bahan yang digunakan.}
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
			if (lowercase(FEResep[i].nama) = lowercase(namaresep)) then
			begin
				writeln('Nama Resep: ', FEResep[i].nama);
				writeln('Harga Resep: ', FEResep[i].harga);
				writeln('Jumlah Bahan: ', FEResep[i].n);
				writeln('Bahan-bahan: ', FEResep[i].bahan[j]);
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
