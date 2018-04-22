// Nama File: F12.pas
// Deskripsi File: Unit prosedur lihat statistik untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F12;

interface
	uses uDef, F1, sysutils;

	{ Deklarasi Fungsi/Prosedur }

	procedure lihatStatistik (var SimulasiX: simulasi);
	{Menampilkan array hasil load dari file eksternal simulasi}

implementation

	procedure lihatStatistik (var SimulasiX: simulasi);
	{Manampilkan array hasil load dari file eksternal simulasi}


	{KAMUS}

	{ALGORITMA}
	begin
		writeln('Nomor simulasi              : ', SimulasiX.nomor);
		DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		writeln('Tanggal                     : ', FormatDateTime('ddddd',SimulasiX.tanggal));
		writeln('Hari hidup                  : ', SimulasiX.tHariHidup);
		writeln('Energi                      : ', SimulasiX.tEnergi);
		writeln('Inventori maksimum          : ', SimulasiX.maxInventori);
		writeln('Total barang mentah dibeli  : ', SimulasiX.tBMentahDibeli);
		writeln('Total barang olahan dibuat  : ', SimulasiX.tBOlahanDibuat);
		writeln('Total barang olahan dijual  : ', SimulasiX.tBOlahanDijual);
		writeln('Total resep                 : ', SimulasiX.tResepDijual);
		writeln('Total pemasukan             : ', SimulasiX.tPemasukan);
		writeln('Total pengeluaran           : ', SimulasiX.tPengeluaran);
		writeln('Total uang                  : ', SimulasiX.tUang);
	end;
end.
