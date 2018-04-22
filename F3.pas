// Nama File: F3.pas
// Deskripsi File: Unit prosedur start simulasi untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F3;

interface
uses uDef, sysutils, Dateutils, restock, delete_array;

	procedure startSimulasi(var countis, countm, aksi: Integer; FESimulasi: ASimulasi; NomorSim: Integer; var FEBahanMentah: Abahanmentah; NBahanM: Integer; var FEInventoriBahanMentah, FEInventoriBahanOlahan: AInventori; var NInvBM, NInvBO: integer);

implementation

	procedure startSimulasi(var countis, countm, aksi: Integer; FESimulasi: ASimulasi; NomorSim: Integer; var FEBahanMentah: Abahanmentah; NBahanM: Integer; var FEInventoriBahanMentah, FEInventoriBahanOlahan: AInventori; var NInvBM, NInvBO: integer);
	var
		i,j,k: Integer;

	begin
		countis:=0;
		countm:=0;
		aksi:=0;
		restockbahan(FESimulasi, NomorSim, FEBahanMentah, NBahanM);
		for i:=1 to NInvBM do								
			begin
				j:=i;
				for k:=1 to NBahanM do
				begin
					if (FEInventoriBahanMentah[i].nama = FEBahanMentah[k].nama) then	
					{Mengecek apakah nama di array file inventori sama di file bahan mentah, jika nama sama akan dilakukan pengecekan kadaluarsa}
					begin
						if (DaysBetween(FESimulasi[NomorSim].tanggal,FEInventoriBahanMentah[i].tanggal)>FEBahanMentah[k].kadaluarsa) or (FEInventoriBahanMentah[i].jumlah=0) or (FESimulasi[NomorSim].tanggal < FEInventoriBahanMentah[i].tanggal) then
						   {DaysBetween digunakan utnuk mengecek selisih hari, dan menentukan apakan bahan mentah sudah kadaluarsa atau belum.
						    Lalu apabila di jumlah bahan mentah inventori bahan mentah sudah 0, maka akan dihapuskan elemennya dari array}
						begin
							deletearray(FEInventoriBahanMentah,NInvBM,j)	{mendelete array elemen ke j}
						end;
					end;
				end;
			end;
		for i:=1 to NInvBO do
			begin
				j:=i;
					if (DaysBetween(FESimulasi[NomorSim].tanggal,FEInventoriBahanOlahan[i].tanggal)>3) or (FEInventoriBahanOlahan[i].jumlah=0) or (FESimulasi[NomorSim].tanggal < FEInventoriBahanOlahan[i].tanggal) then
					{Mengecek apakah bahan olahan sudah kadaluarsa atau belum}
					begin
						deletearray(FEInventoriBahanOlahan,NInvBO,j)		{menghapus array elemen ke j}
					end;
			end;
	end;

end.
