unit F6;
interface
	uses uDef,F1;//untuk ngambil data
	procedure olahbahan(olah:Abahanolahan;var olahb,mentah:Ainventori;var c : Asimulasi);
implementation
	procedure olahbahan(olah:Abahanolahan;var olahb,mentah:Ainventori;var c : Asimulasi);
	var
	nama:string;
	i,j,count,k:longint;
	ketemu:boolean;
	begin
			writeln('bahan yang mau dibuat : ');
			readln(nama);
			i:=1;
			while (olah[i].nama <> nama) do//mencari dimana bahan olahan yang ingin dibuat pada kamus
			begin
					i:=i+1;
			end;
			count:=0;//untuk bahan yang mencukupi
			for j:=1 to olah[i].n do 
			begin
				ketemu:=False;//var untuk nyari
				k:=1;
				while((ketemu=False)and(k< NInvBM[NomorSim])) do 
				begin
					if((olah[i].bahan[j]=mentah[NomorSim][k].nama) and (mentah[NomorSim][k].jumlah>0)) then
					begin
						ketemu:=True;
						count:=count+1;
					end;
					k:=k+1;
				end;
			end;
			if((count=olah[i].n)and(c[NomorSim].tEnergi>0)) then
			begin
				for j:=1 to olah[i].n do 
				begin
					ketemu:=False;//var untuk nyari
					k:=1;
					while((ketemu=False)and(k<= NInvBM[NomorSim])) do 
					begin
						if((olah[i].bahan[j]=mentah[NomorSim][k].nama) and (mentah[NomorSim][k].jumlah>0)) then
						begin
							ketemu:=True;
							mentah[NomorSim][k].jumlah:=mentah[NomorSim][k].jumlah-1;//ngurangi jumlah bahan mentah di inventori
						end;
						k:=k+1;
					end;
				end;
				c[NomorSim].tEnergi:=c[NomorSim].tEnergi-1;
				c[NomorSim].tBOlahanDibuat:=c[NomorSim].tBOlahanDibuat+1;
				ketemu:=False;
				k:=1;
				while((ketemu=False)and(k<= NInvBO[NomorSim])) do 
				begin
					if((nama = olahb[NomorSim][k].nama) and (c[NomorSim].tanggal= olahb[NomorSim][k].tanggal)) then
					begin
						olahb[NomorSim][k].jumlah :=olahb[NomorSim][k].jumlah+1;
						ketemu:=True;
					end;
					k:=k+1;
				end;
				if (ketemu = false) then 
				begin
					olahb[NomorSim][k].nama:=nama;
					olahb[NomorSim][k].tanggal:=c[NomorSim].tanggal;
					olahb[NomorSim][k].jumlah:=1;
				end;
			end else writeln('gak bisa beli');
	end;
end.
				
				
				
				
				
