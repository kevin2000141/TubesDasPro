// Nama File: F3.pas
// Deskripsi File: Unit prosedur upgrade inventori untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F17;

interface
	uses uDef,F1;

	{ Deklarasi Fungsi/Prosedur }

	procedure upgradeInventori(var Nmax: longint);
	{Prosedur untuk menambah jumlah kapasitas inventori}
	{I.S. Nmax terinisialisasi}
	{F.S. Kapasitas inventori bertambah 25}

implementation

	{ Implementasi Fungsi/Prosedur }
	
	procedure upgradeInventori(var Nmax: longint);
	{Prosedur untuk menambah jumlah kapasitas inventori}
	{I.S. Nmax terinisialisasi}
	{F.S. Kapasitas inventori bertambah 25}

	{KAMUS}

	{ALGORITMA}
	begin
		Nmax := Nmax + 25; {Kapasitas inventori bertambah 25}
		writeln('Inventori ditambah 25 menjadi ', NMax);
	end;

end.
