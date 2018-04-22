// Nama File: F16.pas
// Deskripsi File: Unit prosedur tambah resep untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F16;

interface
	uses uDef,F1,math, sysutils;

	{ Deklarasi Fungsi/Prosedur }

	procedure tambahresep (var FEResep: Aresep; var NResep: integer; FEBahanMentah: Abahanmentah; FEBahanOlahan: Abahanolahan; FEInventoriBahanMentah, FEInventoriBahanOlahan: AInventori; NBahanM, NBahanO, NInvBM, NInvBO: Integer);
	{Prosedur untuk menambahkan resep ke dalam array resep}
	{I.S. Prosedur menerima masukkan berupa nama resep dari pengguna}
	{F.S. Program akan menyimpan nama resep, jumlah bahan yang digunakan untuk membuat resep tersebut, bahan - bahan yang digunakan, dan
	 harga jual dari resep tersebut jika resep yang dimasukkan belum ada di dalam array FEResep. Jika resep sudah ada, maka akan muncul pesan kesalahan dan pengguna diminta untuk memasukkan
	 nama resep yang lain.}

implementation

	{ Implementasi Fungsi/Prosedur }
	
	procedure tambahresep (var FEResep: Aresep; var NResep: integer; FEBahanMentah: Abahanmentah; FEBahanOlahan: Abahanolahan; FEInventoriBahanMentah, FEInventoriBahanOlahan: AInventori; NBahanM, NBahanO, NInvBM, NInvBO: Integer);
	{Prosedur untuk menambahkan resep ke dalam array resep}
	{I.S. Prosedur menerima masukkan berupa nama resep dari pengguna}
	{F.S. Program akan menyimpan nama resep, jumlah bahan yang digunakan untuk membuat resep tersebut, bahan - bahan yang digunakan, dan
	 harga jual dari resep tersebut jika resep yang dimasukkan belum ada di dalam array FEResep. Jika resep sudah ada, maka akan muncul pesan kesalahan dan pengguna diminta untuk memasukkan
	 nama resep yang lain.}

	{KAMUS}
	var
	resepbaru, namabahan : string;{Variabel nama resep baru}
	n,i,k,l,m : integer;
	harga : Real;{Variabel untuk harga resep}
	ketemu : boolean;{Untuk mengecek apakah bahan ada atau tidak}
	
	{ALGORITMA}
	begin
		repeat {Validasi masukkan nama resep}
		write('Masukkan nama resep : ');{Menerima masukkan nama resep dari pengguna}
		readln(resepbaru);
		m := 1;
		ketemu := false;
		while ((ketemu=false) and (m<=NResep)) do
		begin
			if (lowercase(resepbaru)=lowercase(FEResep[m].nama)) then
			begin
				ketemu := true;
			end else 
				begin
					m := m + 1;
				end;
			end;
			if (m<=NResep) then writeln('Resep Sudah Ada');
		until (m > NResep);
		
		if (ketemu = false) then
			begin
				write('Masukkan jumlah bahan : ');{Memasukkan jumlah bahan yang digunakan}
				readln(n);
				while (n<2) do
				begin
					writeln('Resep harus terbuat dari minimal 2 bahan');
					write('Masukkan jumlah bahan : ');{Memasukkan jumlah bahan yang digunakan}
					readln(n);
				end;
				NResep := m;
				harga := 0;
				for i:=1 to n do
				begin
				repeat {Validasi masukkan nama bahan}
				k:=1;
				l := 1;
				write('Nama bahan ke - ',i, ': ' );
				readln(namabahan);
				ketemu:=False;
				while((ketemu = False) and (k<=NBahanM)) do
				begin
					if (LowerCase(namabahan)=LowerCase(FEBahanMentah[k].nama)) then
					begin
						ketemu:=True;
						FEResep[m].bahan[i]:= namabahan;
						harga:=harga + FEBahanMentah[k].harga;
					end else
					begin
						k:=k+1;
					end;
				end;
				while((ketemu = False) and (l<=NBahanO)) do
				begin
					if (LowerCase(namabahan)=LowerCase(FEBahanOlahan[l].nama)) then
					begin
						ketemu:=True;
						FEResep[m].bahan[i]:= namabahan;
						harga:=harga + FEBahanOlahan[l].harga;
					end else
					begin
						l:=l+1;
					end;
				end;
				if (ketemu=False) then writeln('Bahan tidak terdaftar');				
				until (ketemu =True);	
			end;
	end;
	writeln('Harga resep : ',harga:0:0);{Memunculkan harga resep}
	end;
end.
