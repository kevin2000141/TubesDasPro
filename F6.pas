// Nama File: F6.pas
// Deskripsi File: Unit prosedur olah bahan untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F6;
interface
	uses uDef,sysutils,F1;//untuk ngambil data

	{ Deklarasi Fungsi/Prosedur }

	procedure olahbahan(olah:Abahanolahan;var olahb,mentah:Ainventori;var c : Asimulasi; var NInvBO, NInvBM, NomorSim,aksi,NBahanO: Integer);
	{Prosedur akan mengolah bahan yang ingin dibuat jika sudah benar}
	{I.S menerima masukan berupa string  yang akan di cek kevalidannya}
	{F.S mengambil bahan dan mengubah isi inventori serta mengubah data simulasi}

implementation

	{ Implementasi Fungsi/Prosedur }
	
	procedure olahbahan(olah:Abahanolahan;var olahb,mentah:Ainventori;var c : Asimulasi; var NInvBO, NInvBM, NomorSim,aksi,NBahanO: Integer);
	{Prosedur akan mengolah bahan yang ingin dibuat jika sudah benar}
	{I.S menerima masukan berupa string  yang akan di cek kevalidannya}
	{F.S mengambil bahan dan mengubah isi inventori serta mengubah data simulasi}
	
	{KAMUS}
	var
	nama:string;
	i,j,count,k:longint;
	ketemu:boolean;
	
	{ALGORITMA}
	begin
			repeat//validasi
				i:=1;
				write('Nama bahan yang ingin dibuat: ' );
				readln(nama);{asumsi nama bahan terdapat dalam file}
				ketemu:=False;
				while((ketemu = False) and (i<=NBahanO)) do
				begin
					if (LowerCase(nama)=LowerCase(olah[i].nama)) then
					begin
						ketemu:=True;
					end else
					begin
						i:=i+1;
					end;
				end;
			if (ketemu=False) then writeln('Nama tidak terdaftar');				
			until (ketemu =True);
			count:=0;//untuk bahan yang mencukupi
			for j:=1 to olah[i].n do 
			begin
				ketemu:=False;//var untuk nyari
				k:=1;
				while((ketemu=False)and(k<=NInvBM)) do 
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
				aksi:=aksi+1;
				ketemu:=False;
				k:=1;
				while((ketemu=False)and(k<= NInvBO)) do 
				begin
					if((LowerCase(nama) = LowerCase(olahb[k].nama)) and (c[NomorSim].tanggal= olahb[k].tanggal)) then
					begin
						olahb[k].jumlah :=olahb[k].jumlah+1;
						ketemu:=True;
					end;
					k:=k+1;
				end;
				if (ketemu = false) then 
				begin
					olahb[k].nama:=nama;
					olahb[k].tanggal:=c[NomorSim].tanggal;
					olahb[k].jumlah:=1;
					NInvBO:=NInvBO+1;
				end;
				writeln('Berhasil dibuat');
			end else writeln('Gagal dibuat');
	end;
end.
				
				
				
				
				
