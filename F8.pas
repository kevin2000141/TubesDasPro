unit F8;
interface
	uses uDef,F1;//untuk ngambil data
	procedure jualresep (resep:Aresep; var c:Asimulasi;var mentah,olah:Ainventori; NomorSim: Integer);

implementation
	procedure jualresep (resep:Aresep; var c:Asimulasi;var mentah,olah:Ainventori; NomorSim: Integer);
	var
		nama:string;
		i,j,count,k:longint;
		ketemu:boolean;
	begin
			writeln('Hidangan yang ingin dijual dari resep: ');
			readln(nama);
			i:=1;
			while (resep[i].nama <> nama) do//mencari dimana bahan resepan yang ingin dibuat pada kamus
			begin
					i:=i+1;
			end;
			count:=0;//untuk bahan yang mencukupi
			for j:=1 to resep[i].n do 
			begin
				ketemu:=False;//var untuk nyari
				k:=1;
				while((ketemu=False)and((k<=NInvBM)or(k<=NInvBO))) do 
				begin
					if((k<=NInvBM)and(resep[i].bahan[j]=mentah[k].nama) and (mentah[k].jumlah>0)) then
					begin
						ketemu:=True;
						count:=count+1;
					end;
					if((k<=NInvBO)and(resep[i].bahan[j]=olah[k].nama) and (olah[k].jumlah>0)) then
					begin
						ketemu:=True;
						count:=count+1;
					end;
					k:=k+1;
				end;
			end;
			if((count=resep[i].n)and(c[NomorSim].tEnergi>0)) then
			begin
				for j:=1 to resep[i].n do 
				begin
					ketemu:=False;//var untuk nyari
					k:=1;
					while((ketemu=False)and((k<=NInvBM)or(k<=NInvBO))) do 
					begin
						if((k<=NInvBM)and (resep[i].bahan[j]=mentah[k].nama) and (mentah[k].jumlah>0)) then//hapus mentah
						begin
							ketemu:=True;
							mentah[k].jumlah:=mentah[k].jumlah-1;//ngurangi jumlah bahan mentah di inventori
						end;
						if((k<=NInvBO) and(resep[i].bahan[j]=olah[k].nama) and (olah[k].jumlah>0)) then//hapus olah
						begin
							ketemu:=True;
							olah[k].jumlah:=olah[k].jumlah-1;//ngurangi jumlah bahan mentah di inventori
						end;
						k:=k+1;
					end;
					c[NomorSim].tEnergi:=c[NomorSim].tEnergi-1;
					c[NomorSim].tResepDijual:=c[NomorSim].tResepDijual+1;
					c[NomorSim].tPemasukan:=c[NomorSim].tPemasukan+resep[i].harga;
					c[NomorSim].tUang:=c[NomorSim].tUang+resep[i].harga;
				end;
			end else writeln('gak bisa dibeli');
		end;
end.
