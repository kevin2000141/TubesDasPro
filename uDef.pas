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
		Abahanmentah = array [1..Nmax] of bahanmentah; {Untuk menentukan bahan mentah ke-N}
		Abahanolahan = array [1..Nmax] of bahanolahan; {Untuk menentukan bahan olahan ke-N}
		Ainventori = array [1..Nmax] of inventoribahan; {Untuk menentukan inventori ke-N}
		Aresep = array [1..Nmax] of resep; {Untuk menentukan resep ke-N}
		Asimulasi = array [1..Nmax] of simulasi;  {Untuk menentukan simulasi ke-N}

	var
		FEBahanMentah: Abahanmentah; {Array dari file bahan mentah}
		FEBahanOlahan: Abahanolahan; {Array dari file bahan olahan}
		FEInventoriBahanMentah: Ainventori; {Array dari file inventori bahan mentah}
		FEInventoriBahanOlahan: Ainventori; {Array dari file inventori bahan olahan}
		FEResep: Aresep; {Array dari file resep}
		FESimulasi: Asimulasi; {Array dari file simulasi}
		NBahanM, NBahanO, NInvBM, NInvBO, NResep, NSim: Integer; {Nilai efektif}
		NomorSim: Integer; {Nomor Simulasi yang dijalankan}
		countis, countm: Integer;
		i:Integer;
		teks:String;

implementation


end.

