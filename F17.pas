// Nama File: F3.pas
// Deskripsi File: Unit prosedur upgrade inventori untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F17;

interface
	uses uDef,F1;
	procedure upgradeInventori(var Nmax: longint);
	{Prosedur untuk menambah jumlah kapasitas inventori}
	{Ketika prosedur ini dijalankan, kapasitas inventori akan bertambah 25 setiap kali
	prosedur ini dijalankan}
	
implementation

	procedure upgradeInventori(var Nmax: longint);
	begin
		Nmax := Nmax + 25;
	end;

end.
