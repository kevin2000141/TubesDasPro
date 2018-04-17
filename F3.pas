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
