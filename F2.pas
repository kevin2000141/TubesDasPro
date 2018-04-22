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

implementation
	
	procedure exit( var FEBahanMentah: Abahanmentah;
					var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var NBahanM: Integer;
					var NInvBM: Integer;
					var NInvBO: Integer;
					var NResep: Integer);

	var
	 	temp, temp1: AnsiString;
	
	begin
	assign (a, 'BahanMentah.txt');
	rewrite (a);
	for j:=1 to NBahanM do
	begin
		temp:='';
		temp:= FEBahanMentah[j].nama + ' | ' + IntToStr(FEBahanMentah[j].harga) + ' | ' + IntToStr(FEBahanMentah[j].kadaluarsa) + ' | ' + IntToStr(FEBahanMentah[j].jumlah);
		writeln(a, temp);
	end;
	close (a);

	assign (c, 'InvBahanMentah.txt');
	rewrite (c);
	for j:=1 to NInvBM do
	begin
		temp:='';
		DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		temp:= FEInventoriBahanMentah[j].nama + ' | ' + FormatDateTime('ddddd',FEInventoriBahanMentah[j].tanggal) + ' | ' + IntToStr(FEInventoriBahanMentah[j].jumlah);
		writeln(c, temp);
	end;
	close(c);

	assign (d, 'InvBahanOlahan.txt');
	rewrite (d);
	for j:=1 to NInvBO do
	begin
		temp:='';
		DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		temp:= FEInventoriBahanOlahan[j].nama + ' | ' + FormatDateTime('ddddd',FEInventoriBahanOlahan[j].tanggal) + ' | ' + IntToStr(FEInventoriBahanOlahan[j].jumlah);
		writeln(d, temp);
	end;
	close(d);

	assign (e, 'Resep.txt');
	rewrite (e);
	for i:=1 to NResep do
	begin
		temp:='';
		for j:=1 to FEResep[i].n do
		begin
			temp := (temp + ' | ' + FEResep[i].bahan[j]);
		end;
		temp1 := FEResep[i].nama + ' | ' + IntToStr(FEResep[i].harga) + ' | ' + IntToStr(FEResep[i].n) + temp;
		writeln(e, temp1);
	end;
	close(e);

	end;
end.
