unit delete_array;

interface

uses uDef,F1;

	procedure deletearray (var arr : Ainventori; var Neff : Integer; var index : Integer);
	{procedure deletearrat menerima masukan array dengan tipe Ainventori, Neff suatu array, dan indexnya.
	 misal indeks dinyatakan dengan i, makan procedure deletearray akan menimpa elemen ke i dengan i+1,
	 elemen ke i+1 dengan ke i+2, dst. Lalu nilai Neff akan dikurangi satu}
	
implementation

	procedure deletearray (var arr : Ainventori; var Neff : Integer; var index : Integer);
	
		begin	
		if (Neff<>index) then			
			begin
			for i := index to Neff-1 do	
			begin
				arr[i] := arr[i+1];			{Menimpa elemen ke i dengan elemen ke i+1}
			end;
		end;
		Neff:=Neff-1; 						{ Mengeset panjang array menjadi panjang array-1 }
	end;
end.

//Contoh Immplementasi
	//Inventori bahan mentah
	//deletearray ( FEInventoribahanmentah[NomorSim],NInvBM[NomorSim], i):
