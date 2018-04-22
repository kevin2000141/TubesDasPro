// Nama File: F3.pas
// Deskripsi File: Unit prosedur start simulasi untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F3;

interface
uses uDef, sysutils, restock;

	procedure startSimulasi(var countis, countm, aksi: Integer; FESimulasi: ASimulasi; NomorSim: Integer; var FEBahanMentah: Abahanmentah; NBahanM: Integer);

implementation

	procedure startSimulasi(var countis, countm, aksi: Integer; FESimulasi: ASimulasi; NomorSim: Integer; var FEBahanMentah: Abahanmentah; NBahanM: Integer);
	begin
		countis:=0;
		countm:=0;
		aksi:=0;
		restockbahan(FESimulasi, NomorSim, FEBahanMentah, NBahanM);
	end;

end.
