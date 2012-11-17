import flash.events.MouseEvent;
import flash.geom.ColorTransform;

baslaButon.addEventListener(MouseEvent.CLICK,basla);
var oyuncuSayisi:int = 0;
// global olması için fonksiyon dışında oyuncuları  tanımlıyorum
var oyuncu1:oyuncu = new oyuncu  ;
var oyuncu2:oyuncu = new oyuncu  ;
var oyuncu3:oyuncu = new oyuncu  ;
var oyuncu4:oyuncu = new oyuncu  ;

function basla(e:MouseEvent)
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
	
	/*
	 oyuncu  isimlerini  al  
	 ve sıranın kimde olduğunu  belirt balonun yanına pompa animasyonu  getirilerek gösterilebilir
	 balon renklerini  değiştir
	 
	*/

	//balon yerleştirme son 
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
				z = setInterval(aktifOyuncu(aktifOyuncuNumarasi).balonSisir,1000);
				islm.soruUret();
				soru.text = islm.soru;
				sonucTextBox.text="";
			}
			else
			{
				trace("Yanlış");
				/*
				balonu ekstra şişir
				puan düşür 5 puan
				*/
				
			}
		}

	}


	//-----------------

}