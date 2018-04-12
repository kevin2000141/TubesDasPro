unit F1;

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
	function shorten(panjang:AnsiString):AnsiString;

	procedure load( var FEBahanMentah: Abahanmentah; 
					var FEBahanOlahan: Abahanolahan;
					var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var FESimulasi: Asimulasi;
					var NBahanM: Integer;
					var NBahanO: Integer;
					var NInvBM: Afileinventori;
					var NInvBO: Afileinventori;
					var NResep: Integer;
					var NSim: Integer);


implementation
	
	function shorten(panjang:AnsiString):AnsiString;
	begin
		shorten := StringReplace(panjang, ' | ', '|', [rfReplaceAll]);
	end;

	procedure load( var FEBahanMentah: Abahanmentah; 
					var FEBahanOlahan: Abahanolahan;
					var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var FESimulasi: Asimulasi;
					var NBahanM: Integer;
					var NBahanO: Integer;
					var NInvBM: Afileinventori;
					var NInvBO: Afileinventori;
					var NResep: Integer;
					var NSim: Integer);

	var
	 	temp : AnsiString;
	
	begin
	assign(a,'bahanmentah.txt');
	reset (a);
	assign (b, 'BahanOlahan.txt');
	reset (b);
	assign (e, 'Resep.txt');
	reset (e);
	assign (f, 'Simulasi.txt');
	reset (f);
	
	NBahanM:=1;
	while not(eof(a)) do
		begin
		readln (a, temp);
		temp := shorten(temp);
		FEBahanMentah[NBahanM].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		FEBahanMentah[NBahanM].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEBahanMentah[NBahanM].kadaluarsa:=StrToInt(temp);
		NBahanM:=NBahanM+1;
		end;
	NBahanM:=NBahanM-1;	
	{for i:=1 to NBahanM do
	begin
		writeln(FEBahanMentah[i].nama, ' ', FEBahanMentah[i].harga, ' ', FEBahanMentah[i].kadaluarsa);
	end;
	writeln();}

	NBahanO:=1;
	while not(eof(b)) do
		begin
		readln (b, temp);
		temp := shorten(temp);
		FEBahanOlahan[NBahanO].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		FEBahanOlahan[NBahanO].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEBahanOlahan[NBahanO].n:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		if FEBahanOlahan[NBahanO].n>1 then 
		begin
			for i:=1 to (FEBahanOlahan[NBahanO].n - 1) do
			begin
				FEBahanOlahan[NBahanO].bahan[i]:=(copy(temp, 1, (pos('|',temp) -1)));
				delete(temp,1,(pos('|',temp)));
			end;
		end;
		FEBahanOlahan[NBahanO].bahan[FEBahanOlahan[NBahanO].n]:=temp;
		NBahanO:=NBahanO+1;
		end;
	NBahanO:=NBahanO-1;
	{for i:=1 to NBahanO do
	begin
		write(FEBahanOlahan[i].nama, ' ', FEBahanOlahan[i].harga, ' ', FEBahanOlahan[i].n);
		for j:=1 to FEBahanOlahan[NBahanO].n do
		begin
			write(' ', FEBahanOlahan[i].bahan[j]);
		end;
		writeln();
	end;
	writeln();}

	NSim:=1;
	while not(eof(f)) do
		begin
		readln (f, temp);
		temp := shorten(temp);
		FESimulasi[NSim].nomor:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		FESimulasi[NSim].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tHariHidup:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tEnergi:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].maxInventori:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tBMentahDibeli:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tBOlahanDibuat:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tBOlahanDijual:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tResepDijual:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tPemasukan:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tPengeluaran:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tUang:=StrToInt(temp);
		NSim:=NSim + 1;
		end;
	NSim:= NSim - 1;
	{for i:=1 to NSim do
	begin
		writeln(FESimulasi[i].nomor, ' ', DateToStr(FESimulasi[NSim].tanggal), ' ', FESimulasi[NSim].tHariHidup, ' ', FESimulasi[NSim].tEnergi, ' ', FESimulasi[NSim].maxInventori, ' ', FESimulasi[NSim].tBMentahDibeli, ' ', FESimulasi[NSim].tBOlahanDibuat, ' ', FESimulasi[NSim].tBOlahanDijual, ' ',FESimulasi[NSim].tResepDijual, ' ', FESimulasi[NSim].tPemasukan, ' ', FESimulasi[NSim].tPengeluaran, ' ', FESimulasi[NSim].tUang);
	end;}

	for i:=1 to NSim do
	begin
	S:='InvBahanMentah.txt';
	Insert (IntToStr(i),s,15);
	assign (c[i], s);
	reset (c[i]);
	NInvBM[i]:=1;
	while not(eof(c[i])) do
		begin
		readln (c[i], temp);
		temp := shorten(temp);
		FEInventoriBahanMentah[i,NInvBM[i]].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		FEInventoriBahanMentah[i,NInvBM[i]].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEInventoriBahanMentah[i,NInvBM[i]].jumlah:=StrToInt(temp);
		NInvBM[i]:=NInvBM[i] + 1;
		end;
	NInvBM[i]:= NInvBM[i] - 1;
	close(c[i]);
	{for j:=1 to NInvBM[i] do
	begin
		writeln (FEInventoriBahanMentah[i,j].nama, ' ', DateToStr(FEInventoriBahanMentah[i,j].tanggal), ' ', FEInventoriBahanMentah[i,j].jumlah);
	end;
	writeln();}

	S:='InvBahanOlahan.txt';
	Insert (IntToStr(i),s,15);
	assign (d[i], s);
	reset (d[i]);
	NInvBO[i]:=1;
	while not(eof(d[i])) do
		begin
		readln (d[i], temp);
		temp := shorten(temp);
		FEInventoriBahanOlahan[i,NInvBO[i]].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		FEInventoriBahanOlahan[i,NInvBO[i]].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEInventoriBahanOlahan[i,NInvBO[i]].jumlah:=StrToInt(temp);
		NInvBO[i]:=NInvBO[i] + 1;
		end;
	NInvBO[i]:= NInvBO[i] - 1;
	close(d[i]);
	{for j:=1 to NInvBO[i] do
	begin
		writeln (FEInventoriBahanOlahan[i,j].nama, ' ', DateToStr(FEInventoriBahanOlahan[i,j].tanggal), ' ', FEInventoriBahanOlahan[i,j].jumlah);
	end;
	writeln();}

	end;

	NResep:=1;
	while not(eof(e)) do
		begin
		readln (e, temp);
		temp := shorten(temp);
		FEResep[NResep].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		FEResep[NResep].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEResep[NResep].n:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		for i:=1 to (FEResep[NResep].n - 1) do
		begin
			FEResep[NResep].bahan[i]:=(copy(temp, 1, (pos('|',temp) -1)));
			delete(temp,1,(pos('|',temp)));
		end;
		FEResep[NResep].bahan[FEResep[NResep].n]:=temp;
		NResep:=NResep+1;
		end;
	NResep:=NResep-1;
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



	close(a);
	close(b);
	close(e);					
	close(f);
	writeln('Loading file sukses.');	
	end;
end.
