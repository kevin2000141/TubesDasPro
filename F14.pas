// Nama File: F14.pas
// Deskripsi File: Unit prosedur lihat resep untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F14;

interface
	uses uDef,sysutils;

	{ Deklarasi Fungsi/Prosedur }

	procedure lihatResep(var FEResep: AResep; NResep: Integer);
	{Melihat daftar resep yang tersedia, termasuk semua daftar bahan penyusunnya}
	{I.S : FEResep terdefinifisi, NResep merupakan jumlah dari resep}
	{F.S : daftar resep serta bahan penyusunnya tertulis di layar}

implementation

	{ Implementasi Fungsi/Prosedur }
	
	procedure lihatResep(var FEResep: AResep; NResep: Integer);
	{Melihat daftar resep yang tersedia, termasuk semua daftar bahan penyusunnya}
	{I.S : FEResep terdefinifisi, NResep merupakan jumlah dari resep}
	{F.S : daftar resep serta bahan penyusunnya tertulis di layar}
	
	{KAMUS}
	var
		N: longint;
		i,j,k:integer;
		tukarInt:longint;
		urutan: string;
		tukarString : array [1..Nmax] of string;
	
	{ALGORITMA}
	begin
		repeat 
			write('Penampilan terurut abjad "membesar" atau "mengecil" : ');
			readln(urutan);
			if not (lowercase(urutan) = 'membesar') and not (lowercase(urutan) = 'mengecil') then
			begin
				writeln('Input salah, masukkan lagi');
			end;
		until (lowercase(urutan) ='membesar') or (lowercase(urutan) = 'mengecil');
		
		{Menampilkan isi resep sesuai abjad}
		writeln('DAFTAR RESEP');
		writeln('Nama Resep | Harga Jual | N | Bahan-1 | Bahan-2 |..| Bahan-N');
		repeat 
			k:=0; i:=NResep;
			for j:=1 to i do
			begin
				if (FEResep[j-1].nama > FEResep[j].nama) then
				begin
					tukarString[1] := FEResep[j-1].nama;
					FEResep[j-1].nama := FEResep[j].nama;
					FEResep[j].nama := tukarString[1];
					tukarInt :=FEResep[j-1].harga;
					FEResep[j-1].harga := FEResep[j].harga;
					FEResep[j].harga :=tukarInt;
					tukarInt :=FEResep[j-1].n;
					FEResep[j-1].n := FEResep[j].n;
					FEResep[j].n :=tukarInt;
					for N:=1 to FEResep[j].n do
					begin
						tukarString[N] := FEResep[j-1].bahan[N];
					end;
					for N:=1 to FEResep[j-1].n do
					begin
						FEResep[j-1].bahan[N] := FEResep[j].bahan[N];
					end;
					for N:=1 to FEResep[j].n do
					begin
						FEResep[j].bahan[N] := tukarString[N];
					end;
					k := j;
				end;
			end;	
			i := k;	
		until i = 0;
		if (urutan = 'membesar') then
		begin
			i := 1;
			while (NResep>=i) do
			begin
				write (FEResep[i].nama, ' | ', FEResep[i].harga, ' | ', FEResep[i].n, ' | ');
				j := 1;
				while (FEResep[i].n>j) do
				begin
					write (FEResep[i].bahan[j], ' | ');
					j := j+1;
				end;
				writeln (FEResep[i].bahan[j]);
				i := i+1;
			end;
		end else
		begin
			i := NResep;
			while (i>=1) do
			begin
				write (FEResep[i].nama, ' | ', FEResep[i].harga, ' | ', FEResep[i].n, ' | ');
				j := 1;
				while (FEResep[i].n>j) do
				begin
					write (FEResep[i].bahan[j], ' | ');
					j := j+1;
				end;
				writeln (FEResep[i].bahan[j]);
				i := i-1;
			end;
		end;	
	end;
end.

					
		
