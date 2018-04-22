// Nama File: F4.pas
// Deskripsi File: Unit prosedur stop simulasi untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F4;

interface
uses uDef, sysutils;

	{ Deklarasi Fungsi/Prosedur }
	
	procedure stopSimulasi(var FESimulasi: Asimulasi; NomorSim: Integer);
	{Prosedur yang menampilkan kondisi simulasi terakhir dan memberhentikan simulasi}
	{I.S.: FESimulasi dan NomorSim terdefinisi}
	{F.S.: Status simulasi [NomorSim] ditampilkan pada layar}

implementation

	procedure stopSimulasi(var FESimulasi: Asimulasi; NomorSim: Integer);
	{Prosedur yang menampilkan kondisi simulasi terakhir dan memberhentikan simulasi}
	{I.S.: FESimulasi dan NomorSim terdefinisi}
	{F.S.: Status simulasi [NomorSim] ditampilkan pada layar}

	{KAMUS}

	{ALGORITMA}
	begin
		writeln ('Nomor Simulasi: ', FESimulasi[NomorSim].nomor);
		DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		writeln ('Tanggal: ', FormatDateTime('ddddd',FESimulasi[NomorSim].tanggal)); {Penampilan tanggal menggunakan format d/m/yyyy}
		writeln ('Jumlah Hari Hidup: ', FESimulasi[NomorSim].tHariHidup);
		writeln ('Jumlah Energi: ', FESimulasi[NomorSim].tEnergi);
		writeln ('Kapasitas Maksimum Inventori: ', FESimulasi[NomorSim].maxInventori);
		writeln ('Total Bahan Mentah Dibeli: ', FESimulasi[NomorSim].tBMentahDibeli);
		writeln ('Total Bahan Olahan Dibuat: ', FESimulasi[NomorSim].tBOlahanDibuat);
		writeln ('Total Bahan Olahan Dijual: ', FESimulasi[NomorSim].tBOlahanDijual);
		writeln ('Total Resep Dijual: ', FESimulasi[NomorSim].tResepDijual);
		writeln ('Total Pemasukan: ', FESimulasi[NomorSim].tPemasukan);
		writeln ('Total Pengeluaran: ', FESimulasi[NomorSim].tPengeluaran);
		writeln ('Total Uang: ', FESimulasi[NomorSim].tUang);
	end;
			
end.
