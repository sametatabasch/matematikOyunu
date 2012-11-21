import flash.events.MouseEvent;
import flash.geom.ColorTransform;
import flash.geom.Transform;
import fl.controls.ColorPicker;
import fl.events.ColorPickerEvent;

import flash.text.TextField;
// global olması için fonksiyon dışında oyuncuları  tanımlıyorum
var oyuncuSayisi:int = 0;
var seviye:int = 0;
var oyuncu1:oyuncu = new oyuncu  ;
var oyuncu2:oyuncu = new oyuncu  ;
var oyuncu3:oyuncu = new oyuncu  ;
var oyuncu4:oyuncu = new oyuncu  ;
var isaretci:pompa = new pompa();//pompa
var patlayanlar:Array=new Array();;
ileriButon.addEventListener(MouseEvent.CLICK,ileri);
function ileri(e:MouseEvent)
{
	seviye = seviyeBelirle.value;
	oyuncuSayisi = oyuncuSayisiBelirle.value;
	gotoAndStop(2);
	switch (oyuncuSayisi)
	{
		case 2 :
			label3.visible = false;
			renkLabel3.visible = false;
			renkSec3.visible = false;
			isimLabel3.visible = false;
			inputBox3.visible = false;
			label4.visible = false;
			renkLabel4.visible = false;
			renkSec4.visible = false;
			isimLabel4.visible = false;
			inputBox4.visible = false;
			break;
		case 3 :
			label4.visible = false;
			renkLabel4.visible = false;
			renkSec4.visible = false;
			isimLabel4.visible = false;
			inputBox4.visible = false;
			break;
		default :
			break;
	}
	baslaButon.addEventListener(MouseEvent.CLICK,basla);
}

function basla(e:MouseEvent)
{
	oyuncu1.adi = inputBox1.text;//bilgiler alınarak ilgili  yare atanıyor
	oyuncu2.adi = inputBox2.text;
	oyuncu3.adi = inputBox3.text;
	oyuncu4.adi = inputBox4.text;

	var colorInfo:ColorTransform= new ColorTransform();;
	colorInfo.color = uint('0x'+renkSec1.hexValue);
	oyuncu1.balon.transform.colorTransform = colorInfo;
	colorInfo.color = uint('0x'+renkSec2.hexValue);
	oyuncu2.balon.transform.colorTransform = colorInfo;
	colorInfo.color = uint('0x'+renkSec3.hexValue);
	oyuncu3.balon.transform.colorTransform = colorInfo;
	colorInfo.color = uint('0x'+renkSec4.hexValue);
	oyuncu4.balon.transform.colorTransform = colorInfo;
	gotoAndStop(3);
	sonucTextBox.restrict = "^a-zA-Z";//sonuç olarak sadece sayı  ve işaretler yazılması  için 
	//balon yerleştirme
	switch (oyuncuSayisi)
	{
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
	var islm:sor = new sor(seviye);
	islm.soruUret();
	soru.text = islm.soru;
	stage.focus = sonucTextBox;
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
		while (aktifOyuncu(no).patladi)
		{
			if (!(patlayanlar.lastIndexOf(no)>-1))
			{
				patlayanlar.push(no);
			}
			aktifOyuncuNumarasi++;
			if ((aktifOyuncuNumarasi > oyuncuSayisi))
			{
				aktifOyuncuNumarasi = 1;
			}
			no = aktifOyuncuNumarasi;
			if (patlayanlar.length == (oyuncuSayisi - 1))
			{
				//oyun biti
				clearInterval(z);
				clearInterval(patlamaDenetleZ);
				removeChild(isaretci);
				switch (oyuncuSayisi)
				{
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
				gotoAndStop(4);
				//yüksek puana göre sırala
				var sonuclar:Array =new Array();
				var ksonuclar:Array= new Array();
				var i:int;
				for (i=1;i<=oyuncuSayisi;i++){
					sonuclar.push(aktifOyuncu(i).puan);
				}
				for (i=1;i<=oyuncuSayisi;i++){
					ksonuclar.push(aktifOyuncu(i).puan);
				}
				ksonuclar.sort(Array.NUMERIC);
				ksonuclar.reverse();
				aktifOyuncu(sonuclar.indexOf(ksonuclar[0])+1).puan+=30;//birinciye 30  puan ekle
				switch (oyuncuSayisi)
				{
					case 2 :
						skor1a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[0])+1).adi;
						skor2a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[1])+1).adi;
						puan1.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[0])+1).puan.toString();
						puan2.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[1])+1).puan.toString();
						puan3.visible = false;
						skor3a.visible = false;
						skor4a.visible = false;
						puan4.visible = false;
						break;
					case 3 :
						skor1a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[0])+1).adi;
						skor2a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[1])+1).adi;
						skor3a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[2])+1).adi;
						puan1.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[0])+1).puan.toString();
						puan2.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[1])+1).puan.toString();
						puan3.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[2])+1).puan.toString();
						skor4a.visible = false;
						puan4.visible = false;
						break;
					case 4 :
						skor1a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[0])+1).adi;
						skor2a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[1])+1).adi;
						skor3a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[2])+1).adi;
						skor4a.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[3])+1).adi;
						puan1.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[0])+1).puan.toString();
						puan2.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[1])+1).puan.toString();
						puan3.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[2])+1).puan.toString();
						puan4.text = aktifOyuncu(sonuclar.indexOf(ksonuclar[3])+1).puan.toString();
						break;
				}
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
			stage.focus = sonucTextBox;
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
				aktifOyuncu(aktifOyuncuNumarasi).puan +=  15;
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
				stage.focus = sonucTextBox;
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