unit F16;

interface
	uses uDef,F1,math, sysutils;
	procedure tambahresep (var FEResep: Aresep; var NResep: integer; FEBahanMentah: Abahanmentah; FEBahanOlahan: Abahanolahan; FEInventoriBahanMentah, FEInventoriBahanOlahan: AInventori; NBahanM, NBahanO, NInvBM, NInvBO: Integer);
	{Prosedur untuk menambahkan resep ke dalam array resep}
	{Prosedur akan menerima masukkan nama resep dari pengguna, lalu akan mengecek apakah nama resep yang dimasukkan sudah ada di dalam array atau belum.
	Jika nama resep yang dimasukkan belum ada, maka akan diminta untuk memasukkan jumlah bahan yang dibutuhkan untuk membuat resep tersebut. Lalu pengguna
	diminta untuk memasukkan harga jual dari resep tersebut. Harga jual harus 12,5% lebih tinggi dari jumlah harga bahan - bahan yang digunakan.}
implementation

procedure tambahresep (var FEResep: Aresep; var NResep: integer; FEBahanMentah: Abahanmentah; FEBahanOlahan: Abahanolahan; FEInventoriBahanMentah, FEInventoriBahanOlahan: AInventori; NBahanM, NBahanO, NInvBM, NInvBO: Integer);

var
	resepbaru : string;
	n,i,j,k,l,m : integer;
	sumBhn : Longint;
	hargaresep : Real;
	x : string;
	found: Boolean;
	
begin
	write('Masukkan nama resep : ');
	readln(resepbaru);
	for m := 1 to NResep do
	begin
		if lowercase(resepbaru) = lowercase(FEResep[m].nama) then
		begin
			writeln('Resep Sudah Ada')
		end
		else
		begin
			write('Masukkan jumlah bahan : ');
			readln(n);
			NResep := NResep + 1;
			sumBhn := 0;
	
			for i:=1 to n do
			begin
				found:=False;
				while not(found) do
				begin
					write('Masukkan nama bahan ke-', i, ' : ');
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
						FEResep[NResep].N := FEResep[NResep].N + 1;
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
			while hargaresep < (sumBhn / 8) do
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
