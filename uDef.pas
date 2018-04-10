unit uDef;

interface
uses sysutils;

	const
		bahanmax = 10;
		bahanresepmax = 20;
		Nmax = 100;

	type
		bahanmentah=record
			nama		: String;
			harga		: Longint;
			kadaluarsa 	: Longint;	
		end;
		bahanolahan=record
			nama		: String;
			harga		: Longint;
			n 			: Integer;
			bahan 		: array [1..bahanmax] of String;	
		end;
		inventoribahan=record
			nama		: String;
			tanggal		: TDateTime;
			jumlah		: Integer;	
		end;
		resep=record
			nama  		: String;
			harga  		: Longint;
			n 			: Integer;
			bahan 		: array [1..bahanresepmax] of String;
		end;
		simulasi=record
			nomor 			: Integer;
			tanggal 		: TDateTime;
			tHariHidup 		: Integer;
			tEnergi 		: Integer;
			maxInventori 	: Longint;
			tBMentahDibeli 	: Integer;
			tBOlahanDibuat 	: Integer;
			tBOlahanDijual 	: Integer;
			tResepDijual 	: Integer;
			tPemasukan 		: Longint;
			tPengeluaran 	: Longint;
			tUang 			: Longint;
		end;
		Abahanmentah = array [1..Nmax] of bahanmentah;
		Abahanolahan = array [1..Nmax] of bahanolahan;
		Ainventori = array [1..Nmax] of array [1..Nmax] of inventoribahan;
		Aresep = array [1..Nmax] of resep;
		Asimulasi = array [1..Nmax] of simulasi;

	var
		FEBahanMentah: Abahanmentah; 
		FEBahanOlahan: Abahanolahan;
		FEInventoriBahanMentah: Ainventori;
		FEInventoriBahanOlahan: Ainventori;
		FEResep: Aresep;
		FESimulasi: Asimulasi;
		NBahanM, NBahanO, NInvBM, NInvBO, NResep, NSim: Integer;


implementation



end.

