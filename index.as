import flash.events.MouseEvent;
var oyuncu1:oyuncu= new oyuncu();



baslaButon.addEventListener(MouseEvent.CLICK,basla);
function basla(e:MouseEvent)
{
	//oyuncuSayisi = oyuncuSayisiBelirle.value;//oyuncu  sayısını al
	
	var islm:sor = new sor(seviyeBelirle.value);
	oyuncu1.adi = "samet";
	islm.soruUret();
	trace(oyuncu1.adi);
	soru.text = islm.soru;
	trace(islm.cevap);
	//------------------------
	//balon şişir ve patlat
	var z;
	z = setInterval(sisir,1000);
	function sisir()
	{
		balon.height +=  2;
		balon.width +=  2;
		var girilenSonuc:int;
		girilenSonuc = int(sonucTextBox.text);
		if (balon.width >= 100)
		{
			balon.gotoAndPlay(3);
			clearInterval(z);
		}
		/*if (sonuc==girilenSonuc)
		{
			clearInterval(z);
		}
		else if (sonuc!=girilenSonuc && girilenSonuc.toString!= null)
		{//bu kısım hatalı 
			balon.height +=  5;
			balon.width +=  5;
		}*/
	}


}