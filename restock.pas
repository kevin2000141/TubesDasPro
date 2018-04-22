// Nama File: restock.pas
// Deskripsi File: Unit prosedur restock bahan untuk beberapa prosedur pada program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit restock;

interface
uses F1, sysutils, uDef;

	procedure restockbahan(FESimulasi: ASimulasi; NomorSim: Integer; var FEBahanMentah: Abahanmentah; NBahanM: Integer);
	{Prosedur yang menambah jumlah stock bahan menjadi 25 pada file bahan mentah jika tanggal genap} 
	{I.S. FESimulasi, NomorSim, FEBahanMentah, NBahanM terinisialiasai}
	{F.S. Jumlah bahan di FEBahanMentah menjadi 25}

implementation

	procedure restockbahan(FESimulasi: ASimulasi; NomorSim: Integer; var FEBahanMentah: Abahanmentah; NBahanM: Integer);
	{Prosedur yang menambah jumlah stock bahan menjadi 25 pada file bahan mentah jika tanggal genap}
	{I.S. FESimulasi, NomorSim, FEBahanMentah, NBahanM terinisialiasai}
	{F.S. Jumlah bahan di FEBahanMentah menjadi 25}

	{KAMUS}
	var
		Date: TDateTime;
		i: Integer;
		year, month, day: Word;
	
	{ALGORITMA}
	begin
		Date:=FESimulasi[NomorSim].tanggal;
		DecodeDate(Date,year,month,day);
		if day mod 2 = 0 then {Pengecekan apakah tanggal genap}
		begin
			for i:=1 to NBahanM do
			begin
				FEBahanMentah[i].jumlah:=25; {Untuk semua bahan stock menjadi 25}
			end;
		end;
	end;

end.
