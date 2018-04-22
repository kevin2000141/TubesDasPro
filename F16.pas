// Nama File: F16.pas
// Deskripsi File: Unit prosedur tambah resep untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F16;

interface
	uses uDef,F1,math, sysutils;
	procedure tambahresep (var FEResep: Aresep; var NResep: integer; FEBahanMentah: Abahanmentah; FEBahanOlahan: Abahanolahan; FEInventoriBahanMentah, FEInventoriBahanOlahan: AInventori; NBahanM, NBahanO, NInvBM, NInvBO: Integer);
	{Prosedur untuk menambahkan resep ke dalam array resep}
	{I.S. Prosedur menerima masukkan berupa nama resep dari pengguna}
	{F.S. Program akan menyimpan nama resep, jumlah bahan yang digunakan untuk membuat resep tersebut, bahan - bahan yang digunakan, dan
	 harga jual dari resep tersebut jika resep yang dimasukkan belum ada di dalam array FEResep. Jika resep sudah ada, maka akan muncul pesan kesalahan dan pengguna diminta untuk memasukkan
	 nama resep yang lain.}

implementation

procedure tambahresep (var FEResep: Aresep; var NResep: integer; FEBahanMentah: Abahanmentah; FEBahanOlahan: Abahanolahan; FEInventoriBahanMentah, FEInventoriBahanOlahan: AInventori; NBahanM, NBahanO, NInvBM, NInvBO: Integer);
{Prosedur untuk menambahkan resep ke dalam array resep}
{I.S. Prosedur menerima masukkan berupa nama resep dari pengguna}
{F.S. Program akan menyimpan nama resep, jumlah bahan yang digunakan untuk membuat resep tersebut, bahan - bahan yang digunakan, dan
 harga jual dari resep tersebut jika resep yang dimasukkan belum ada di dalam array FEResep. Jika resep sudah ada, maka akan muncul pesan kesalahan dan pengguna diminta untuk memasukkan
 nama resep yang lain.}

{KAMUS}
var
	resepbaru : string; {Variabel nama resep baru}
	n,i,j,k,l,m : integer;
	sumBhn : Longint; {Untuk menjumlah harga bahan - bahan yang digunakan}
	hargaresep : Real;
	x : string;
	found: Boolean; {Untuk mengecek apakah nama resep baru sudah ada atau belum}

{ALGORITMA}	
begin
	write('Masukkan nama resep : '); {Menerima masukkan nama resep dari pengguna}
	readln(resepbaru);
	for m := 1 to NResep do {Mengecek nama resep yang ada di array FEResep}
	begin
		if lowercase(resepbaru) = lowercase(FEResep[m].nama) then
		begin
			writeln('Resep Sudah Ada')
		end
		else
		begin
			write('Masukkan jumlah bahan : '); {Memasukkan jumlah bahan yang digunakan}
			readln(n);
			NResep := NResep + 1;
			sumBhn := 0;
	
			for i:=1 to n do
			begin
				found:=False;
				while not(found) do
				begin
					write('Masukkan nama bahan ke-', i, ' : '); {Memasukkan nama bahan yang digunakan untuk membuat resep}
					readln(x);
				for j := 1 to NInvBM do
				begin
					if x = FEInventoriBahanMentah[j].nama then
					begin
						FEResep[NResep].bahan[i] := x;
						FEResep[NResep].N := FEResep[NResep].N + 1;
						for l:=1 to NBahanM do
						begin
							if x = FEBahanMentah[l].nama then
							begin
								sumBhn := sumBhn + FEBahanMentah[l].harga;
							end;
						end;
						found := True;
					end;
				end;
				for k := 1 to NInvBO do
				begin
					if x = FEInventoriBahanOlahan[k].nama then
					begin
						FEResep[NResep].bahan[i] := x;
						FEResep[NResep].N := FEResep[NResep].N + 1; {Jumlah elemen efektif dari array FEResep bertambah 1}
						for l:=1 to NBahanM do
						begin
							if x = FEBahanOlahan[l].nama then
							begin
								sumBhn := sumBhn + FEBahanOlahan[l].harga;
							end;
						end;
						found := True;
					end;
				end;
				if not(found) then
				begin
					writeln('Bahan tidak tersedia');
					write('Masukkan nama bahan ke-', i, ' : ');
					readln(x);
				end;
				end;
			end;
			write('Masukkan harga yang diinginkan : ');
			readln(hargaresep);
			while hargaresep < (sumBhn / 8) do {Mengecek apakah harga resep sudah sesuai dengan spesifikasi(12,5% lebih tinggi dari total harga bahan)}
			begin
				writeln('Masukkan harga harus 12,5% lebih tinggi dari total harga bahan.');
				write('Masukkan harga yang diinginkan : ');
				readln(hargaresep);
			end;
			FEResep[NResep].harga:= ceil(hargaresep);
		end;
		end;
		end;
end.
