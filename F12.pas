unit F12;

interface
uses uDef, F1, sysutils;

procedure lihatStatistik (SimulasiX: simulasi);

implementation

procedure lihatStatistik (SimulasiX: simulasi);
begin
		writeln('Nomor simulasi              : ', SimulasiX.nomor);
		DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		writeln('Tanggal 					 : ', FormatDateTime('ddddd',SimulasiX.tanggal));
		writeln('Hari hidup                  : ', SimulasiX.tHariHidup);
		writeln('Energi                      : ', SimulasiX.tEnergi);
		writeln('Iventori maksimum           : ', SimulasiX.maxInventori);
		writeln('Total barang mentah dibeli  : ', SimulasiX.tBMentahDibeli);
		writeln('Total barang olahan dibuat  : ', SimulasiX.tBOlahanDibuat);
		writeln('Total barang olahan dijual  : ', SimulasiX.tBOlahanDijual);
		writeln('Total resep                 : ', SimulasiX.tResepDijual);
		writeln('Total pemasukan             : ', SimulasiX.tPemasukan);
		writeln('Total pengeluaran           : ', SimulasiX.tPengeluaran);
		writeln('Total uang                  : ', SimulasiX.tUang);
end;
end.
