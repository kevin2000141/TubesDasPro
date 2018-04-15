unit F7;
interface
	uses uDef,F1;//untuk ngambil data
	procedure jualolahan(olah:Abahanolahan;var olahb:Ainventori;var c : Asimulasi; NomorSim: Integer);
implementation
	procedure jualolahan(olah:Abahanolahan;var olahb:Ainventori;var c : Asimulasi; NomorSim: Integer);
	var
		nama:string;
		ketemu,ketemu2:boolean;
		i,j:integer;
	begin
<<<<<<< HEAD
		write('masukan nama bahan olahan : ');
		readln(nama);//nama yang mau dijual
=======
		write('Masukan nama bahan olahan: ');
		readln(nama);
>>>>>>> e26b5cd4614fe75a47e282a747bf61ee04662248
		ketemu:=False;
		i:=1;
		while ((ketemu = False) and (i<=NInvBO)) do
		begin
			if((nama = olahb[i].nama) and ( olahb[i].jumlah>=1)) then
			begin
				ketemu:=True;
			end;
			i:=i+1;
		end;
		ketemu2:=False;
		j:=1;
		while((ketemu2 = False) and (j<=NBahanO))do//cuman cari j
		begin
			if(nama = olah[j].nama) then
			begin
				ketemu2:=True;
			end;
			j:=j+1;
		end;
		if((ketemu = True)and(c[NomorSim].tEnergi>0)) then
		begin
			olahb[i].jumlah:=olahb[i].jumlah-1;
			c[NomorSim].tBOlahanDijual:=c[NomorSim].tBOlahanDijual+1;
			c[NomorSim].tEnergi:=c[NomorSim].tEnergi-1;
			c[NomorSim].tPemasukan:=c[NomorSim].tPemasukan+olah[j-1].harga;
			c[NomorSim].tUang:=c[NomorSim].tUang+olah[j-1].harga;
		end else writeln('Tidak bisa dibeli');
		end;
		end.
		
		
