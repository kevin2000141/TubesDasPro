unit F6;
interface
	uses uDef,F1;//untuk ngambil data
	procedure olahbahan(a:Abahanolahan;var b:Ainventori;var c : Asimulasi);
implementation
	procedure olahbahan(a:Abahanolahan;var b:Ainventori;var c : Asimulasi);
	var
	nama:string;
	jlh,i,j:longint;
	cukup:=boolean;
	begin
			writeln('bahan yang mau dibuat : ');
			readln(nama);
			writeln('kuantitas : ');
			readln(jlh);
			i:=1;
			while (a[i].nama <> nama) do
			begin
					i:=i+1;
			end;
			cukup:=True;
			for j:=1 to a[i].n do 
			begin
				
