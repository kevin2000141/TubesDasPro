unit delete_array;

interface

uses uDef,F1;

	procedure deletearray (var arr : Ainventori; var Neff : Integer; var index : Integer);
	
implementation

procedure deletearray (var arr : Ainventori; var Neff : Integer; var index : Integer);
	begin	
		if (Neff<>index) then
			begin
			for i := index to Neff-1 do
				begin
					arr[i] := arr[i+1];
				end;
		end;
		Neff:=Neff-1; { Mengeset panjang array menjadi panjang array-1 }
	end;
end.
//Immplementasi
	//Inventori bahan mentah
	
	//deletearray ( FEInventoribahanmentah[NomorSim],NInvBM[NomorSim], i):
