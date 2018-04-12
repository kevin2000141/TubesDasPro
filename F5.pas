unit F5;
interface
	uses uDef,F1;//untuk ngambil data
	function inv (NBahanM,NBahanO,j: integer ; c : Asimulasi ): Boolean ; //gak perlu dipanggil
	procedure beliBahan(var a:Ainventori{type dari F1};d:Abahanmentah{untuk data bahan};var b,e:integer{neff inv bahan};var c:Asimulasi{type dari soal});

implementation
	function inv(NBahanM,NBahanO,j:integer;c : Asimulasi ):Boolean;
	begin
		if (((NBahanM+NBahanO)<c[NSim].maxInventori))
		then begin
			inv := True;
		end else
		begin
			inv :=False;
		end;
	end;
	procedure beliBahan(var a:Ainventori{type inv dari F1};d:Abahanmentah{untuk data bahan};var b,e:integer{neff inv bahan};var c:Asimulasi{type dari soal});
	var
		namabahan:string;
		i,j:longint;
	begin{satu kali prosedur satu kali beli satu unit}
		write('nama bahan :' );
		readln(namabahan);{asumsi nama bahan terdapat dalam file}
		write('kuantitas : ');
		readln(j);
		write('total harga : ');
		i:=1;
		while not(namabahan=d[i].nama) do
		begin
			i:=i+1;
		end;
		writeln(d[i].harga*j);
		
		if ((inv (b,e,j,c))and (c[NSim].tEnergi>0) and (c[NSim].tUang >= (d[i].harga*j)) ) then 
		begin
				b:=b+1;{neff baru(total bahan mentah dibeli)}
				c[NSim].tEnergi:=c[NSim].tEnergi-1;{energibaru}
				{a[b].nama := namabahan; a[b].tanggal :=;
				a[b].jumlah := j;}
				c[NSim].tPengeluaran:=c[NSim].tPengeluaran+(d[i].harga*j);{total pengeluaran}
				c[NSim].tUang:=c[NSim].tUang-(d[i].harga*j);{pendapatan bersih berkurang}
				c[NSim].tBMentahDibeli := c[NSim].tBMentahDibeli + j ;
				writeln('berhasil dibeli');
		end else writeln('gagal dibeli');
	end;
end.
