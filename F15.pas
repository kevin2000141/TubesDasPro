// Nama File: F15.pas
// Deskripsi File: Unit prosedur cari resep untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F15;

interface
	uses uDef,F1,sysutils;

	{ Deklarasi Fungsi/Prosedur }

	procedure cariresep(FEResep: Aresep; NResep: Integer);
	{Prosedur untuk mancari resep dalam array resep}
	{I.S. Prosedur menerima masukkan nama resep dari pengguna}
	{F.S. Prosedur akan menampilkan nama resep yang dicari, harga resep, jumlah bahan yang digunakan, dan nama bahan - bahan yang digunakan.
	Jika nama resep yang dimasukkan tidak ada, maka akan muncul pesan kesalahan.}

implementation

	{ Implementasi Fungsi/Prosedur }
	
	procedure cariresep(FEResep: Aresep; NResep: Integer);
	{Prosedur untuk mancari resep dalam array resep}
	{I.S. Prosedur menerima masukkan nama resep dari pengguna}
	{F.S. Prosedur akan menampilkan nama resep yang dicari, harga resep, jumlah bahan yang digunakan, dan nama bahan - bahan yang digunakan.
	 Jika nama resep yang dimasukkan tidak ada, maka akan muncul pesan kesalahan.}

	{KAMUS}
	var
		j,k : integer;
		namaresep : string;{variabel masukkan dari pengguna berupa nama resep}
		found : boolean;
	
	{ALGORITMA}	
	begin
	repeat
		write('Masukkan nama resep yang ingin dicari: ');
		readln(namaresep);
		k := 1;
		found := false;
		while ((found = false) and (k <= NResep)) do
		begin
			if (lowercase(FEResep[k].nama) = lowercase(namaresep)) then
			begin
				found := true;
			end else
			begin
				k := k + 1;
			end;
		end;
		if (found = false) then writeln('Resep tidak ada');
	until(found = true);
		
	j := 1;
	if (found) then 
		writeln('Nama Resep : ', namaresep);{Menampilkan nama resep yang dicari}
		writeln('Harga Resep : ', FEResep[k].harga);{Menampilkan harga resep}
		writeln('Jumlah Bahan : ', FEResep[k].n);{Menampilkan jumlah bahan yang digunakan}
		write('Bahan-bahan : ', FEResep[k].bahan[j]);{Menampilkan bahan - bahan yang digunakan}
		for j := 2 to FEResep[k].n do
		begin
			write(', ', FEResep[k].bahan[j]);
		end;
	writeln;
	end;

end.
