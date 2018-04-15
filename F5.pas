unit F5;
interface
	uses uDef,F1;//untuk ngambil data
	function inv (c : Asimulasi ): Boolean ; //gak perlu dipanggil

	procedure beliBahan(var a:Ainventori{type inv dari F1};d:Abahanmentah{untuk data bahan};var c:Asimulasi{type dari soal}; NomorSim: Integer);

implementation
	function inv(c : Asimulasi ):Boolean;
	begin
		if ((NInvBM + NInvBO)<c[NomorSim].maxInventori)then 
		begin
			inv := True;
		end else
		begin
			inv :=False;
		end;
	end;
	procedure beliBahan(var a:Ainventori{type inv dari F1};d:Abahanmentah{untuk data bahan};var c:Asimulasi{type dari soal}; NomorSim: Integer);
	var
		namabahan:string;
		i,j,k:longint;
		ketemu:boolean;
	begin{satu kali prosedur satu kali beli satu unit}
		write('Nama bahan :' );
		readln(namabahan);{asumsi nama bahan terdapat dalam file}
		write('Kuantitas : ');
		readln(j);
		write('Total harga : ');
		i:=1;
		while (not(namabahan = d[i].nama)) do
		begin 
			i:=i+1;
		end;
		writeln(d[i].harga*j);
		
		if ((inv (c))and (c[NomorSim].tEnergi>0) and (c[NomorSim].tUang >= (d[i].harga*j)) ) then 
		begin
				
				c[NomorSim].tEnergi:=c[NomorSim].tEnergi-1;{energibaru}
				c[NomorSim].tPengeluaran:=c[NomorSim].tPengeluaran+(d[i].harga*j);{total pengeluaran}
				c[NomorSim].tUang:=c[NomorSim].tUang-(d[i].harga*j);{pendapatan bersih berkurang}
				c[NomorSim].tBMentahDibeli := c[NomorSim].tBMentahDibeli + j ;
				ketemu:=False;
				k:=1;
				while((ketemu=False)and(k<= NInvBO)) do 
				begin
					if((namabahan = a[k].nama) and (c[NomorSim].tanggal= a[k].tanggal)) then
					begin
						a[k].jumlah :=a[k].jumlah+j;
						ketemu:=True;
					end;
					k:=k+1;
				end;
				if (ketemu = false) then 
				begin
					a[k].nama:=namabahan;
					a[k].tanggal:=c[NomorSim].tanggal;
					a[k].jumlah:=j;
					NInvBM:=NInvBM+1;
				end;
				writeln('Berhasil dibeli');
		end else writeln('Gagal dibeli');
	end;
end.
