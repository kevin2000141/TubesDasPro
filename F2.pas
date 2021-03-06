// Nama File: F2.pas
// Deskripsi File: Unit prosedur exit untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F2;

interface
uses uDef, sysutils;
	
	const
		NMax = 100;	

	var
		a,b,c,d,e,f: Text;
		i,j : Integer;
		S:String;
	
	{ Deklarasi Fungsi/Prosedur }
	
	procedure exit( var FEBahanMentah: Abahanmentah;
					var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var NBahanM: Integer;
					var NInvBM: Integer;
					var NInvBO: Integer;
					var NResep: Integer);
	{Prosedur yang menuliskan perubahan array  bahan mentah, inventori bahan mentah, inventori bahan olahan, dan resep yang terjadi ketika simulasi pada file eksternal}
	{I.S.: Array-array bahan mentah, inventori bahan mentah, inventori bahan olahan, dan resep terinisialisasi dan juga nilai efektifnya}
	{F.S.: File eksternal bahan mentah, inventori bahan mentah, inventori bahan olahan, dan resep ditulis dengan data dari array-array}

implementation
	
	{ Implementasi Fungsi/Prosedur }
	
	procedure exit( var FEBahanMentah: Abahanmentah;
					var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var NBahanM: Integer;
					var NInvBM: Integer;
					var NInvBO: Integer;
					var NResep: Integer);
	{Prosedur yang menuliskan perubahan array  bahan mentah, inventori bahan mentah, inventori bahan olahan, dan resep yang terjadi ketika simulasi pada file eksternal}
	{I.S.: Array-array bahan mentah, inventori bahan mentah, inventori bahan olahan, dan resep terinisialisasi dan juga nilai efektifnya}
	{F.S.: File eksternal bahan mentah, inventori bahan mentah, inventori bahan olahan, dan resep ditulis dengan data dari array-array}

	{KAMUS}
	var
	 	temp, temp1: AnsiString;
	
	{ALGORITMA}
	begin
	assign (a, 'BahanMentah.txt');
	rewrite (a);
	{Buka file 'BahanMentah.txt'}
	for j:=1 to NBahanM do {Penulisan file per line}
	begin
		temp:='';
		temp:= FEBahanMentah[j].nama + ' | ' + IntToStr(FEBahanMentah[j].harga) + ' | ' + IntToStr(FEBahanMentah[j].kadaluarsa) + ' | ' + IntToStr(FEBahanMentah[j].jumlah);
		writeln(a, temp);
	end;
	close (a);
	{Tutup file 'BahanMentah.txt'}

	assign (c, 'InvBahanMentah.txt');
	rewrite (c);
	{Buka file 'InvBahanMentah.txt'}
	for j:=1 to NInvBM do {Penulisan file per line}
	begin
		temp:='';
		DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		temp:= FEInventoriBahanMentah[j].nama + ' | ' + FormatDateTime('ddddd',FEInventoriBahanMentah[j].tanggal) + ' | ' + IntToStr(FEInventoriBahanMentah[j].jumlah);
		writeln(c, temp);
	end;
	close(c);
	{Tutup file 'InvBahanMentah.txt'}

	assign (d, 'InvBahanOlahan.txt');
	rewrite (d);
	{Buka file 'InvBahanOlahan.txt'}
	for j:=1 to NInvBO do {Penulisan file per line}
	begin
		temp:='';
		DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		temp:= FEInventoriBahanOlahan[j].nama + ' | ' + FormatDateTime('ddddd',FEInventoriBahanOlahan[j].tanggal) + ' | ' + IntToStr(FEInventoriBahanOlahan[j].jumlah);
		writeln(d, temp);
	end;
	close(d);
	{Tutup file 'InvBahanOlahan.txt'}

	assign (e, 'Resep.txt');
	rewrite (e);
	{Buka file 'Resep.txt'}
	for i:=1 to NResep do {Penulisan file per line}
	begin
		temp:='';
		for j:=1 to FEResep[i].n do {Merancang bahan resep untuk siap ditulis}
		begin
			temp := (temp + ' | ' + FEResep[i].bahan[j]);
		end;
		temp1 := FEResep[i].nama + ' | ' + IntToStr(FEResep[i].harga) + ' | ' + IntToStr(FEResep[i].n) + temp;
		writeln(e, temp1);
	end;
	close(e);
	{Tutup file 'Resep.txt'}

	end;
end.
