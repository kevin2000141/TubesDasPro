// Nama File: F9.pas
// Deskripsi File: Unit prosedur makan untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F9;

interface

	{ Deklarasi Fungsi/Prosedur }

	procedure makan(var energiawal:Longint; var countm:Integer ); 
	{procedure ini menerima input energi chef saat ini dan countm. countm merupakan counter yang menghitung berapa kali chef telah
	 makan dalam sehari}
	{I.S. energiawal = energi awal sebelum makan, diambil dari FESimulasi.tEnergi. Saat belum makan, countm=0}
	{F.S. energi awal bertambah 3 jika  masih bisa makan , countm akan bertambah satu setiap kali makan}

implementation

	{ Implementasi Fungsi/Prosedur }
	
	procedure makan(var energiawal:Longint; var countm:Integer );
	{procedure ini menerima input energi chef saat ini dan countm. countm merupakan counter yang menghitung berapa kali chef telah
	 makan dalam sehari}
	{I.S. energiawal = energi awal sebelum makan, diambil dari FESimulasi.tEnergi. Saat belum makan, countm=0}
	{F.S. energi awal bertambah 3 jika  masih bisa makan , countm akan bertambah satu setiap kali makan}

	{KAMUS}

	{ALGORITMA}
	begin
		if (countm < 3) then					{Kondisi saat chef belum makan 3 kali}
		begin
			if (energiawal<10) then				{Saat energi chef masih dibawah 10, maka energi chef akan bertambah 3}
			begin
				write('Energi chef sekarang: ');
				energiawal:=energiawal+3;		{Penambahan 3 energi pada energi chef}
				if (energiawal>10) then				
				begin
					energiawal:=10;				{Energi maksimum chef adalah 10 sehingga saat energi melebihi batas 10, akan dibuat menjadi 10}
				end;							
				writeln(energiawal);			{Menuliskan energi setelah makan ke layar}
			end else							{Kondisi saat energi chef sudah 10 namun belum makan 3 kali}
			begin
				writeln('Sudah makan, tapi energi tidak nambah');
			end;
			countm:=countm+1;					{Menghitung sudah berapa kali chef makan}
		end else								{Kondisi ketika chef sudah makan 3 kali}
		begin
			writeln('Makan tidak boleh >3 kali');
		end;	
	end;

end.
