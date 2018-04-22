unit F8;
interface
	uses uDef,F1,sysutils;//untuk ngambil data
	procedure jualresep (resep:Aresep; var c:Asimulasi;var mentah,olah:Ainventori; var NInvBM, NInvBO, NomorSim,aksi: Integer);
	{akan memvalidasi resep yang diterima,dan memroses data mengubah data simulasi dan inventori}
implementation
	procedure jualresep (resep:Aresep; var c:Asimulasi;var mentah,olah:Ainventori; var NInvBM, NInvBO, NomorSim,aksi: Integer);
	{akan memvalidasi resep yang diterima,dan memroses data mengubah data simulasi dan inventori}
	var
		nama:string;
		i,j,count,k:longint;
		ketemu:boolean;
	begin
			repeat//validasi
				i:=1;
				write('Nama resep yang ingin dibuat: ' );
				readln(nama);{asumsi nama bahan terdapat dalam file}
				ketemu:=False;
				while((ketemu = False) and (i<=NBahanO)) do
				begin
					if (LowerCase(nama)=LowerCase(resep[i].nama)) then
					begin
						ketemu:=True;
					end else
					begin
						i:=i+1;
					end;
				end;
				if (ketemu=False) then writeln('nama tidak terdaftar');				
			until (ketemu =True);
			i:=1;
			while (LowerCase(resep[i].nama) <>LowerCase(nama)) do//mencari dimana bahan resepan yang ingin dibuat pada kamus
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
					aksi:=aksi+1;
				end;
			end else writeln('gak bisa dibeli');
		end;
end.
