// Nama File: F15.pas
// Deskripsi File: Unit prosedur cari resep untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F15;

interface
	uses uDef,F1,sysutils;
	procedure cariresep(FEResep: Aresep; NResep: integer);
	{Prosedur untuk mancari resep dalam array ressep}
	{I.S. Prosedur menerima masukkan nama resep dari pengguna}
	{F.S. Prosedur akan menampilkan nama resep yang dicari, harga resep, jumlah bahan yang digunakan, dan nama bahan - bahan yang digunakan.
	Jika nama resep yang dimasukkan tidak ada, maka akan muncul pesan kesalahan.}

implementation

	procedure cariresep(FEResep: Aresep; NResep: integer);
	{Prosedur untuk mancari resep dalam array ressep}
	{I.S. Prosedur menerima masukkan nama resep dari pengguna}
	{F.S. Prosedur akan menampilkan nama resep yang dicari, harga resep, jumlah bahan yang digunakan, dan nama bahan - bahan yang digunakan.
	 Jika nama resep yang dimasukkan tidak ada, maka akan muncul pesan kesalahan.}

	{KAMUS}
	var
		i : integer;
		namaresep : string; {variabel masukkan dari pengguna berupa nama resep}
	
	{ALGORITMA}
	begin
		write('Masukkan nama resep yang ingin dicari: ');
		readln(namaresep);
		for i := 1 to NResep do
		begin
			if (lowercase(FEResep[i].nama) = lowercase(namaresep)) then
			begin
				writeln('Nama Resep: ', FEResep[i].nama);{Menampilkan nama resep yang dicari}
				writeln('Harga Resep: ', FEResep[i].harga);{Menampilkan harga resep}
				writeln('Jumlah Bahan: ', FEResep[i].n);{Menampilkan jumlah bahan yang digunakan}
				writeln('Bahan-bahan: ', FEResep[i].bahan[j]);{Menampilkan bahan - bahan yang digunakan}
				for j := 2 to FEResep[i].n do
				begin
					write(', ', FEResep[i].bahan[j]);
				end;
			end else 
			begin
				writeln('Nama Resep yang dimasukkan tidak ada');{Pesan kesalahan ketika nama resep yang dicari tidak ada di array}
			end;
		end;
	end;

end.
