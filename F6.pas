unit F6;
interface
	uses uDef,F1;//untuk ngambil data
	procedure olahbahan(olah:Abahanolahan;var olahb,mentah:Ainventori;var c : Asimulasi; NomorSim: Integer);
implementation
	procedure olahbahan(olah:Abahanolahan;var olahb,mentah:Ainventori;var c : Asimulasi; NomorSim: Integer);
	var
	nama:string;
	i,j,count,k:longint;
	ketemu:boolean;
	begin
			writeln('Bahan yang mau dibuat : ');
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
<<<<<<< HEAD
				while((ketemu=False)and(k<= NInvBM[NomorSim])) do 
=======
				while((ketemu=False)and(k<NInvBM)) do 
>>>>>>> e26b5cd4614fe75a47e282a747bf61ee04662248
				begin
					if((olah[i].bahan[j]=mentah[k].nama) and (mentah[k].jumlah>0)) then
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
					while((ketemu=False)and(k<= NInvBM)) do 
					begin
						if((olah[i].bahan[j]=mentah[k].nama) and (mentah[k].jumlah>0)) then
						begin
							ketemu:=True;
							mentah[k].jumlah:=mentah[k].jumlah-1;//ngurangi jumlah bahan mentah di inventori
						end;
						k:=k+1;
					end;
				end;
				c[NomorSim].tEnergi:=c[NomorSim].tEnergi-1;
				c[NomorSim].tBOlahanDibuat:=c[NomorSim].tBOlahanDibuat+1;
				ketemu:=False;
				k:=1;
				while((ketemu=False)and(k<= NInvBO)) do 
				begin
					if((nama = olahb[k].nama) and (c[NomorSim].tanggal= olahb[k].tanggal)) then
					begin
						olahb[k].jumlah :=olahb[k].jumlah+1;
						ketemu:=True;
					end;
					k:=k+1;
				end;
				if (ketemu = false) then 
				begin
<<<<<<< HEAD
					NInvBO[NomorSim]:=NInvBO[NomorSim]+1;
					olahb[NomorSim][NInvBO[NomorSim]].nama:=nama;
					olahb[NomorSim][NInvBO[NomorSim]].tanggal:=c[NomorSim].tanggal;
					olahb[NomorSim][NInvBO[NomorSim]].jumlah:=1;
=======
					olahb[k].nama:=nama;
					olahb[k].tanggal:=c[NomorSim].tanggal;
					olahb[k].jumlah:=1;
					NInvBO:=NInvBO+1;
>>>>>>> e26b5cd4614fe75a47e282a747bf61ee04662248
				end;
			end else writeln('Tidak bisa beli');
	end;
end.
				
				
				
				
				
