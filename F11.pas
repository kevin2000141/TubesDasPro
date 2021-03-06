// Nama File: F11.pas
// Deskripsi File: Unit prosedur tidur untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F11;

interface

	uses  sysutils,F1,delete_array,Dateutils,uDef,restock;	
		  {delete_array adalah unit untuk menghapus elemen dari sebuah array, restock adalah unit untuk merestock barang}
	
	{ Deklarasi Fungsi/Prosedur }

	procedure tidur (	var energiawal	:Longint; 			{energiawal		: energi chef sekarang}
						var countm		:Integer; 			{countm			: counter sudah berapa kali chef makan} 
						var countis		:Integer; 			{countis		: counter sudah berapa kali chef istirahat} 
						var countd		:Longint;			{countd			: menghitung jumlah hari yang berlangsung}
						var datenow		:TDateTime;			{datenow		: tanggal hari ini (tanggal di simulasi)}
						var NInvBM: Integer;				{NInvBM			: nilai efektif inventori bahan mentah}
						var NInvBO: Integer;				{NInvBO			: nilai efektif inventori bahan olahan}
						var aksi: Integer;					{aksi			: counter untuk menghitung jumlah aksi yang dilakukan chef (aksi adalah fitur yang mengurangi energi, seperti belibahan dll)}
						FESimulasi: ASimulasi; 				{FilSimulasi	: var untuk mengakses array dari file external simulasi}
						NomorSim: Integer; 					{NomorSim		: nomor simulasi yang sedang berlangsung}
						var FEBahanMentah: Abahanmentah; 	{FEBBahanMentah	: array dari file bahan mentah}
						NBahanM: Integer);					{NBahanM		: nilai efektif bahan mentah}
						
	{procedure tidur menerima masukan-masukan diatas, dan melakukan hal-hal dibawah ini:
		1. Membuat energi chef menjadi 10
		2. Membuat hari berganti(Hari berganti jika chef melakukan aksi yang mengurangi atau menambahkan energi, jika energi tidak berubah makan chef tidak bisa tidur)
		3. Menghapus bahan-bahan mentah dan olahan yang sudah kadaluarsa pada inventori, dan menyebabkan berkurangnya inventori
		4. Melakukan restock bahan mentah} 				
	{I.S. energi awal, countm, countis,aksi diambil dari hasil penambahan atau pengurangan energi di procedure-procedure sebelumnya, countd diambil 
	 dari FESimulasi.tHariHidup, datenow diambil dari FESimulasi.tanggal, NInvBM, NInvBO, NBahanM, NomorSim diambil dari uDef,
	 FESimulasi menggunakan array FESimulasi, FEBahanMentah menggunakan array FEBahanMentah}
	{F.S. energi awal akan bertambah menjadi 10, countm,countis,dan aksi akan menjadi 0, countd (untuk menghitung berapa hari yang berlangsung) akan bertambah satu,
	 bahan mentah dan olahan yang telah kadaluarsa akan dihapus dari inventori, dan penghapusan menyebabkan kapasitas inventori berkurang.}

implementation

	{ Implementasi Fungsi/Prosedur }
	
	procedure tidur (	var energiawal	:Longint; 		
						var countm		:Integer; 		
						var countis		:Integer; 		
						var countd		:Longint;		
						var datenow		:TDateTime;
						var NInvBM: Integer;
						var NInvBO: Integer;
						var aksi: Integer;
						FESimulasi: ASimulasi; 
						NomorSim: Integer; 
						var FEBahanMentah: Abahanmentah; 
						NBahanM: Integer);	
	{procedure tidur menerima masukan-masukan diatas, dan melakukan hal-hal dibawah ini:
		1. Membuat energi chef menjadi 10
		2. Membuat hari berganti(Hari berganti jika chef melakukan aksi yang mengurangi atau menambahkan energi, jika energi tidak berubah makan chef tidak bisa tidur)
		3. Menghapus bahan-bahan mentah dan olahan yang sudah kadaluarsa pada inventori, dan menyebabkan berkurangnya inventori
		4. Melakukan restock bahan mentah} 				
	{I.S. energi awal, countm, countis,aksi diambil dari hasil penambahan atau pengurangan energi di procedure-procedure sebelumnya, countd diambil 
	 dari FESimulasi.tHariHidup, datenow diambil dari FESimulasi.tanggal, NInvBM, NInvBO, NBahanM, NomorSim diambil dari uDef,
	 FESimulasi menggunakan array FESimulasi, FEBahanMentah menggunakan array FEBahanMentah}
	{F.S. energi awal akan bertambah menjadi 10, countm,countis,dan aksi akan menjadi 0, countd (untuk menghitung berapa hari yang berlangsung) akan bertambah satu,
	 bahan mentah dan olahan yang telah kadaluarsa akan dihapus dari inventori, dan penghapusan menyebabkan kapasitas inventori berkurang.}

	{KAMUS}
	var
		k: Integer;												{variabel k digunakan sebagai penanda elemen suatu array}
	
	{ALGORITMA}	
	begin
		if (countm=0) and (countis=0) and (aksi=0) then			{kondisi saat belum melakukan aksi apapun}
		begin 
			writeln('Tidak boleh tidur sebelum melakukan aksi')
		end else 
		begin	
			if (countm<>0) or (countis<>0) or (aksi<>0) then	{kondisi saat sudah melakukan setidaknya 1 aksi}
			begin	
				energiawal:=10;									{Energi awal dijadikan 10}
				countm	  :=0;									{counter makan di set menjadi 0}
				countis	  :=0;									{counter istirahat di set menjadi 0}
				aksi	  :=0;									{counter aksi di set menjadi 0}
				countd	  :=countd+1;							{jumlah hari bertambah satu}
				writeln('Energi chef sekarang: 10');
			end;
			datenow:=datenow+1;									{tanggal berubah menjadi tanggal hari ini ditambah 1 hari}
			writeln('Tanggal sekarang: ',DateToStr(datenow));	{menuliskan tanggal hari ini ke layar}
			writeln('Jumlah Hari : ',countd);					{menuliskan jumlah hari berlangsungnya simulasi ke layar}
			for i:=1 to NInvBM do								
			begin
				j:=i;
				for k:=1 to NBahanM do
				begin
					if (FEInventoriBahanMentah[i].nama = FEBahanMentah[k].nama) then	
					{Mengecek apakah nama di array file inventori sama di file bahan mentah, jika nama sama akan dilakukan pengecekan kadaluarsa}
					begin
						if (DaysBetween(datenow,FEInventoriBahanMentah[i].tanggal)>FEBahanMentah[k].kadaluarsa) or (FEInventoriBahanMentah[i].jumlah=0) then
						   {DaysBetween digunakan utnuk mengecek selisih hari, dan menentukan apakan bahan mentah sudah kadaluarsa atau belum.
						    Lalu apabila di jumlah bahan mentah inventori bahan mentah sudah 0, maka akan dihapuskan elemennya dari array}
						begin
							deletearray(FEInventoriBahanMentah,NInvBM,j)	{mendelete array elemen ke j}
						end;
					end;
				end;
			end;
			for i:=1 to NInvBO do
			begin
				j:=i;
					if (DaysBetween(datenow,FEInventoriBahanOlahan[i].tanggal)>3) or (FEInventoriBahanOlahan[i].jumlah=0) then
					{Mengecek apakah bahan olahan sudah kadaluarsa atau belum}
					begin
						deletearray(FEInventoriBahanOlahan,NInvBO,j)		{menghapus array elemen ke j}
					end;
			end;
		end;
	restockbahan(FESimulasi,NomorSim,FEBahanMentah,NBahanM);				{restock bahan}
	end;
end.
