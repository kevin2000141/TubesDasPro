unit F2;

interface
uses uDef, sysutils;
	
	const
		NMax = 100;	

	var
		a,b,e,f: Text;
		c,d: array[1..NMax] of Text;
		i,j : Integer;
		S:String;
	
	{ Deklarasi Fungsi/Prosedur }
	
	procedure exit( var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var NInvBM: Afileinventori;
					var NInvBO: Afileinventori;
					var NResep: Integer;
					var NSim: Integer);

implementation
	
	procedure exit( var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var NInvBM: Afileinventori;
					var NInvBO: Afileinventori;
					var NResep: Integer;
					var NSim: Integer);

	var
	 	temp, temp1 : AnsiString;
	
	begin
	for i:=1 to NSim do
	begin
	S:='InvBahanMentah.txt';
	Insert (IntToStr(i),s,15);
	assign (c[i], s);
	rewrite (c[i]);
	for j:=1 to NInvBM[i] do
		begin
		temp:='';
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		temp:= FEInventoriBahanMentah[i,j].nama + ' | ' + FormatDateTime('ddddd',FEInventoriBahanMentah[i,j].tanggal) + ' | ' + IntToStr(FEInventoriBahanMentah[i,j].jumlah);
		writeln(c[i], temp);
		end;
	close(c[i]);
	{for j:=1 to NInvBM[i] do
	begin
		writeln (FEInventoriBahanMentah[i,j].nama, ' ', FormatDateTime('ddddd',FEInventoriBahanMentah[i,j].tanggal), ' ', FEInventoriBahanMentah[i,j].jumlah);
	end;
	writeln();}

	S:='InvBahanOlahan.txt';
	Insert (IntToStr(i),s,15);
	assign (d[i], s);
	rewrite (d[i]);
	for j:=1 to NInvBO[i] do
		begin
		temp:='';
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		temp:= FEInventoriBahanOlahan[i,j].nama + ' | ' + FormatDateTime('ddddd',FEInventoriBahanOlahan[i,j].tanggal) + ' | ' + IntToStr(FEInventoriBahanOlahan[i,j].jumlah);
		writeln(d[i], temp);
		end;
	close(d[i]);
	{for j:=1 to NInvBO[i] do
	begin
		writeln (FEInventoriBahanOlahan[i,j].nama, ' ', FormatDateTime('ddddd',FEInventoriBahanOlahan[i,j].tanggal), ' ', FEInventoriBahanOlahan[i,j].jumlah);
	end;
	writeln();}

	end;

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
	{for i:=1 to NResep do
	begin
		write(FEResep[i].nama, ' ', FEResep[i].harga, ' ', FEResep[i].n);
		for j:=1 to FEResep[NResep].n do
		begin
			write(' ', FEResep[i].bahan[j]);
		end;
		writeln();
	end;
	writeln();}
	close(e);
	end;
end.
