// Nama File: F7.pas
// Deskripsi File: Unit prosedur jual olahan untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F7;
interface
	uses uDef,sysutils,F1;//untuk ngambil data
	procedure jualolahan(olah:Abahanolahan;var olahb:Ainventori;var c : Asimulasi; var NInvBO, NBahanO, NomorSim,aksi: Integer);
	{akan menerima masukan nama bahan yang ingin dijual,dan akan memvalidas,lalu melaukan perubahan pada inventori dan juga mengubah dat simulasi}
implementation
	procedure jualolahan(olah:Abahanolahan;var olahb:Ainventori;var c : Asimulasi; var NInvBO, NBahanO, NomorSim,aksi: Integer);
	{akan menerima masukan nama bahan yang ingin dijual,dan akan memvalidas,lalu melaukan perubahan pada inventori dan juga mengubah dat simulasi}
	var
		nama:string;
		ketemu,ketemu2:boolean;
		i,j:integer;
	begin
		repeat//validasi
				i:=1;
				write('Nama bahan yang ingin dijual: ' );
				readln(nama);
				ketemu:=False;
				while((ketemu = False) and (i<=NInvBO)) do
				begin
					if ((LowerCase(nama)=LowerCase(olahb[i].nama))) then
					begin
						ketemu:=True;
					end else
					begin
						i:=i+1;
					end;
				end;
				if (ketemu=False) then writeln('nama tidak terdaftar');				
		until (ketemu =True);
		ketemu:=False;
		i:=1;
		while((ketemu=False)and(i<=NInvBO)) do
		begin
			if (( olahb[i].jumlah >=1) and  (LowerCase(nama)=LowerCase(olahb[i].nama))) then 
			begin
				ketemu:=True;
			end else i:=i+1;
		end;
		ketemu2:=False;
		j:=1;
		while((ketemu2 = False) and (j<=NBahanO))do//cuman cari j
		begin
			if(LowerCase(nama) = LowerCase(olah[j].nama)) then
			begin
				ketemu2:=True;
			end;
			j:=j+1;
		end;
		if((ketemu = True)and(c[NomorSim].tEnergi>0)) then//melakukan perubahan data
		begin
			olahb[i].jumlah:=olahb[i].jumlah-1;
			c[NomorSim].tBOlahanDijual:=c[NomorSim].tBOlahanDijual+1;
			c[NomorSim].tEnergi:=c[NomorSim].tEnergi-1;
			c[NomorSim].tPemasukan:=c[NomorSim].tPemasukan+olah[j-1].harga;
			c[NomorSim].tUang:=c[NomorSim].tUang+olah[j-1].harga;
			aksi:=aksi+1;
			writeln('makan nih ',nama);
		end else writeln('Tidak bisa dibeli');
		end;
		end.
		
		
