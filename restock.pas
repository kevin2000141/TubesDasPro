// Nama File: restock.pas
// Deskripsi File: Unit prosedur restock bahan untuk beberapa prosedur pada program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit restock;

interface
uses F1, sysutils, uDef;

	procedure restockbahan(FESimulasi: ASimulasi; NomorSim: Integer; var FEBahanMentah: Abahanmentah; NBahanM: Integer);
	
implementation

	procedure restockbahan(FESimulasi: ASimulasi; NomorSim: Integer; var FEBahanMentah: Abahanmentah; NBahanM: Integer);
	var
		Date: TDateTime;
		i: Integer;
		year, month, day: Word;
	begin
		Date:=FESimulasi[NomorSim].tanggal;
		DecodeDate(Date,year,month,day);
		if day mod 2 = 0 then
		begin
			for i:=1 to NBahanM do
			begin
				FEBahanMentah[i].jumlah:=25;
			end;
		end;
	end;

end.
