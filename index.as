import flash.events.MouseEvent;
import flash.geom.ColorTransform;
import flash.geom.Transform;
import fl.controls.ColorPicker;
import fl.events.ColorPickerEvent;
// global olması için fonksiyon dışında oyuncuları  tanımlıyorum
var oyuncuSayisi:int = 0;
var oyuncu1:oyuncu = new oyuncu  ;
var oyuncu2:oyuncu = new oyuncu  ;
var oyuncu3:oyuncu = new oyuncu  ;
var oyuncu4:oyuncu = new oyuncu  ;
var pencere:bilgiler = new bilgiler();//bilgiler penceresi 
var isaretci:pompa = new pompa();//pompa
baslaButon.visible = false;//ilk olarak başlat butonu gözükmüyor
tamamButon.addEventListener(MouseEvent.CLICK,tamam);
function tamam(e:MouseEvent)
{
	//balon yerleştirme
	switch (oyuncuSayisi)
	{
		case 1 :
			removeChild(oyuncu1.balon);
			break;
		case 2 :
			removeChild(oyuncu1.balon);
			removeChild(oyuncu2.balon);
			break;
		case 3 :
			removeChild(oyuncu1.balon);
			removeChild(oyuncu2.balon);
			removeChild(oyuncu3.balon);
			break;
		case 4 :
			removeChild(oyuncu1.balon);
			removeChild(oyuncu2.balon);
			removeChild(oyuncu3.balon);
			removeChild(oyuncu4.balon);
			break;
		default :
			break;
	}
	oyuncuSayisi = oyuncuSayisiBelirle.value;
	switch (oyuncuSayisi)
	{
		case 1 :
			addChild(oyuncu1.balon);
			oyuncu1.balonEkle(735,68.70);

			break;
		case 2 :
			addChild(oyuncu1.balon);
			oyuncu1.balonEkle(735,68.70);

			addChild(oyuncu2.balon);
			oyuncu2.balonEkle(735,220.35);
			break;
		case 3 :
			addChild(oyuncu1.balon);
			oyuncu1.balonEkle(735,68.70);

			addChild(oyuncu2.balon);
			oyuncu2.balonEkle(735,220.35);

			addChild(oyuncu3.balon);
			oyuncu3.balonEkle(735,372);
			break;
		case 4 :
			addChild(oyuncu1.balon);
			oyuncu1.balonEkle(735,68.70);

			addChild(oyuncu2.balon);
			oyuncu2.balonEkle(735,220.35);

			addChild(oyuncu3.balon);
			oyuncu3.balonEkle(735,372);

			addChild(oyuncu4.balon);
			oyuncu4.balonEkle(735,523.65);
			break;
	}
	//balon yerleştirme son 
	addChild(pencere);//bilgiler penceresini ekle
	pencere.x = 350;// bilgiler penceresini konumlandır
	pencere.y = 200;
	pencere.goster(oyuncuSayisi);
	// bilgiler penceresi elemanlarını göstermek için ;
	baslaButon.visible = true;
	tamamButon.visible = false;
}
baslaButon.addEventListener(MouseEvent.CLICK,basla);


function basla(e:MouseEvent)
{
	oyuncu1.adi = pencere.inputBox1.text;//bilgiler penceresinden bilgiler alınarak ilgili  yare atanıyor
	oyuncu2.adi = pencere.inputBox2.text;
	oyuncu3.adi = pencere.inputBox3.text;
	oyuncu4.adi = pencere.inputBox4.text;

	var colorInfo:ColorTransform= new ColorTransform();;
	colorInfo.color = uint('0x'+pencere.renkSec1.hexValue);
	oyuncu1.balon.transform.colorTransform = colorInfo;
	colorInfo.color = uint('0x'+pencere.renkSec2.hexValue);
	oyuncu2.balon.transform.colorTransform = colorInfo;
	colorInfo.color = uint('0x'+pencere.renkSec3.hexValue);
	oyuncu3.balon.transform.colorTransform = colorInfo;
	colorInfo.color = uint('0x'+pencere.renkSec4.hexValue);
	oyuncu4.balon.transform.colorTransform = colorInfo;

	removeChild(pencere);
	baslaButon.visible = false;
	sonucTextBox.restrict = "^a-zA-Z";//sonuç olarak sadece sayı  ve işaretler yazılması  için 
	var islm:sor = new sor(seviyeBelirle.value);
	islm.soruUret();
	soru.text = islm.soru;
	trace(islm.cevap);
	//------------------------
	var aktifOyuncuNumarasi:int = 1;
	/**
	 * aktif oyuncu  değişkenini dönen fonksiyon
	 * @param no :int aktif oyuncu  numarası 
	 * @return Object
	 */
	function aktifOyuncu(no:int)
	{
		switch (no)
		{
			case 1 :
				return oyuncu1;
				break;
			case 2 :
				return oyuncu2;
				break;
			case 3 :
				return oyuncu3;
				break;
			case 4 :
				return oyuncu4;
				break;
			default :
				return null;
		}
	}

	var z = setInterval(oyuncu1.balonSisir,1000);//oyuncu birin balonunu şişir
	addChild(isaretci);
	isaretci.x = 615;
	isaretci.y = 68.70;
	/**
	 * isaretciYerlestir fonksiyonu 
	 * aktif oyuncu numarasına göre işaretcinin konumunu belirleyen fonksiyon
	 * @param aktifOyuncuNumarasi:int
	 */
	function isaretciYerlestir(aktifOyuncuNumarasi:int)
	{
		switch (aktifOyuncuNumarasi)
		{
			case 1 :
				isaretci.y = 68.70;
				break;
			case 2 :
				isaretci.y = 220.35;
				break;
			case 3 :
				isaretci.y = 372;
				break;
			case 4 :
				isaretci.y = 523.65;
				break;
		}
	}
	/**
	 * balonPatladimi
	 * aktif oyuncunun balonunun patlayıp patlamadığına bakan fonksiyon 
	 * @param no:int
	 */
	function balonPatladimi(no:int)
	{
		var i:int = 0;
		trace("fonksiyon çalıştı aktif no="+no);
		while (aktifOyuncu(no).patladi)
		{
			aktifOyuncuNumarasi++;
			if ((aktifOyuncuNumarasi > oyuncuSayisi))
			{
				aktifOyuncuNumarasi = 1;
			}
			no = aktifOyuncuNumarasi;
			i++;
			if (i==(oyuncuSayisi-1))
			{
				trace("oyun bitti"+"\n oyuncu1 ="+oyuncu1.puan+"\n oyuncu2 ="+oyuncu2.puan);
				break;
			}
		}
	}
	// yarım saniyede bir aktif balonun patlayıp patlamadığını denetleyen bölüm baş
	var patlamaDenetleZ = setInterval(patlamaDenetleF,500);
	function patlamaDenetleF()
	{
		var aktif = aktifOyuncuNumarasi;
		// balonun patlayıp  patlamadığına bak
		balonPatladimi(aktifOyuncuNumarasi);
		if (aktif!=aktifOyuncuNumarasi)
		{
			//isaretçiyi  yerlestir
			isaretciYerlestir(aktifOyuncuNumarasi);
			z = setInterval(aktifOyuncu(aktifOyuncuNumarasi).balonSisir,1000);
			islm.soruUret();
			soru.text = islm.soru;
			sonucTextBox.text = "";
		}
	}
	// yarım saniyede bir aktif balonun patlayıp patlamadığını denetleyen bölüm son
	sonucTextBox.addEventListener(KeyboardEvent.KEY_DOWN,denetle);
	function denetle(e:KeyboardEvent)
	{// CEVABI  GİRİP  ENTER A BASTIĞINDA 
		if (e.keyCode == Keyboard.ENTER)
		{
			if (islm.cevap == int(sonucTextBox.text))
			{
				clearInterval(z);
				aktifOyuncu(aktifOyuncuNumarasi).puan +=  10;
				aktifOyuncuNumarasi++;
				if ((aktifOyuncuNumarasi > oyuncuSayisi))
				{
					aktifOyuncuNumarasi = 1;
				}
				// balonun patlayıp  patlamadığına bak
				balonPatladimi(aktifOyuncuNumarasi);
				//isaretçiyi  yerlestir
				isaretciYerlestir(aktifOyuncuNumarasi);
				z = setInterval(aktifOyuncu(aktifOyuncuNumarasi).balonSisir,1000);
				islm.soruUret();
				soru.text = islm.soru;
				sonucTextBox.text = "";
			}
			else
			{
				sonucTextBox.text = "";
				aktifOyuncu(aktifOyuncuNumarasi).puan -=  5;
				aktifOyuncu(aktifOyuncuNumarasi).balon.height +=  5;
				aktifOyuncu(aktifOyuncuNumarasi).balon.width +=  5;
			}
		}
	}
}