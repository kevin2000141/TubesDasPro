// Nama File: F3.pas
// Deskripsi File: Unit prosedur upgrade inventori untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F17;

interface
	uses uDef,F1;
	procedure upgradeInventori(var Nmax: longint);
	{Prosedur untuk menambah jumlah kapasitas inventori}
	{I.S. Prosedur upgradeInventori terinisialisasi}
	{F.S. Kapasitas inventori bertambah 25}

implementation

	procedure upgradeInventori(var Nmax: longint);
	{Prosedur untuk menambah jumlah kapasitas inventori}
	{I.S. Prosedur upgradeInventori terinisialisasi}
	{F.S. Kapasitas inventori bertambah 25}

	{KAMUS}

	{ALGORITMA}
	begin
		Nmax := Nmax + 25; {Kapasitas inventori bertambah 25}
	end;

end.
