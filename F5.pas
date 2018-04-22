// Nama File: F5.pas
// Deskripsi File: Unit prosedur beli bahan untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F5;
interface
	uses uDef,F1,sysutils,C_Maks;//untuk ngambil data

	{ Deklarasi Fungsi/Prosedur }

	procedure beliBahan(var a,b:Ainventori{type inv dari F1};d:Abahanmentah{untuk data bahan};var c:Asimulasi{type dari soal}; var aksi, NInvBO, NInvBM, NomorSim,NBahanM: Integer);
	{prosedur ini akan memvalidasi bahan mentah yang mau dibeli beserta jumlahnya,mengitung total harga,dan melakukan perubahan pada inventori maupun pada inventori bahan mentah}
	{I.S menerima masukan berupa string dan integer yang akan di cek kevalidannya}
	{F.S memasukan kedalam inventoridan mengubah data}

implementation
	
	procedure beliBahan(var a,b:Ainventori{type inv dari F1};d:Abahanmentah{untuk data bahan};var c:Asimulasi{type dari soal}; var aksi, NInvBO, NInvBM, NomorSim,NBahanM: Integer);
	{prosedur ini akan memvalidasi bahan mentah yang mau dibeli beserta jumlahnya,mengitung total harga,dan melakukan perubahan pada inventori maupun pada inventori bahan mentah}
	{I.S menerima masukan berupa string dan integer yang akan di cek kevalidannya}
	{F.S memasukan kedalam inventoridan mengubah data}
	
	{KAMUS}
	var
		namabahan:string;
		i,j,k:longint;
		ketemu:boolean;
	
	{ALGORITMA}
	begin{satu kali prosedur satu kali beli satu unit}
		repeat//validasi
			i:=1;
			write('Nama bahan : ' );
			readln(namabahan);{asumsi nama bahan terdapat dalam file}
			write('Kuantitas : ');
			readln(j);
			ketemu:=False;
			while((ketemu = False) and (i<=NBahanM)) do
			begin
				if (LowerCase(namabahan)=LowerCase(d[i].nama)) then
				begin
					ketemu:=True;
				end else
				begin
					i:=i+1;
				end;
			end;
			if (ketemu=False) then writeln('Nama tidak terdaftar');				
		until (ketemu =True);
		ketemu:=False;
		i:=1;
		while((ketemu = False) and (i<=NBahanM)) do
		begin
			if ((LowerCase(namabahan)=LowerCase(d[i].nama)) and (j<=d[i].jumlah)) then
			begin
					ketemu:=True;
				end else
				begin
					i:=i+1;
			end;
		end;
		write('Total harga : ');
		writeln(d[i].harga*j);
		if ((cekmaksimum (c,NInvBO, NInvBM, NomorSim,j,a,b)=True)and (c[NomorSim].tEnergi>0) and (c[NomorSim].tUang >= (d[i].harga*j))) then 
		begin
				
				c[NomorSim].tEnergi:=c[NomorSim].tEnergi-1;{energibaru}
				c[NomorSim].tPengeluaran:=c[NomorSim].tPengeluaran+(d[i].harga*j);{total pengeluaran}
				c[NomorSim].tUang:=c[NomorSim].tUang-(d[i].harga*j);{pendapatan bersih berkurang}
				c[NomorSim].tBMentahDibeli := c[NomorSim].tBMentahDibeli + j ;
				d[i].jumlah:=d[i].jumlah-j;
				ketemu:=False;
				aksi:=aksi+1;
				k:=1;
				while((ketemu=False)and(k<= NInvBM)) do 
				begin
					if((LowerCase(namabahan)=LowerCase(a[k].nama)) and (c[NomorSim].tanggal= a[k].tanggal)) then
					begin
						a[k].jumlah :=a[k].jumlah+j;
						ketemu:=True;
					end;
					k:=k+1;
				end;
				if (ketemu = false) then 
				begin
					NInvBM:=NInvBM+1;
					a[NInvBM].nama:=namabahan;
					a[NInvBM].tanggal:=c[NomorSim].tanggal;
					a[NInvBM].jumlah:=j;
				end;
				writeln('Berhasil dibeli');
		end else 
		writeln('Gagal dibeli');
	end;
end.
