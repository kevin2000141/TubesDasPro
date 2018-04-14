unit F7;
interface
	uses uDef,F1;//untuk ngambil data
	procedure jualbahan(olah:Abahanolahan;var olahb:Ainventori;var c : Asimulasi);
implementation
	procedure jualbahan(olah:Abahanolahan;var olahb:Ainventori;var c : Asimulasi);
	var
		nama:string;
		ketemu,ketemu2:boolean;
		i,j:integer;
	begin
		write('masukan nama bahan olahan : ');
		readln(nama);
		ketemu:=False;
		i:=1;
		while ((ketemu = False) and (i<=NInvBO[NomorSim])) do
		begin
			if((nama = olahb[NomorSim][i].nama) and ( olahb[NomorSim][i].jumlah>=1)) then
			begin
				ketemu:=True;
			end;
			i:=i+1;
		end;
		ketemu2:=False;
		j:=1;
		while((ketemu2 = False) and (j<=NBahanO))do
		begin
			if(nama = olah[j].nama) then
			begin
				ketemu2:=True;
			end;
			j:=j+1;
		end;
		if(ketemu = True) then
		begin
			olahb[NomorSim][i].jumlah:=olahb[NomorSim][i].jumlah-1;
			c[NomorSim].tBOlahanDijual:=c[NomorSim].tBOlahanDijual+1;
			c[NomorSim].tEnergi:=c[NomorSim].tEnergi-1;
			c[NomorSim].tPemasukan:=c[NomorSim].tPemasukan+olah[j-1].harga;
			c[NomorSim].tUang:=c[NomorSim].tUang+olah[j-1].harga;
		end else writeln('gak bisa dibeli');
		end;
		end.
		
		
