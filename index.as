import flash.events.MouseEvent;
import flash.geom.ColorTransform;

baslaButon.addEventListener(MouseEvent.CLICK,basla);
function basla(e:MouseEvent)
{
	var islm:sor = new sor(seviyeBelirle.value);
	islm.soruUret();
	soru.text = islm.soru;
	trace(islm.cevap);
	//------------------------
	var oyuncu1:oyuncu = new oyuncu();
	addChild(oyuncu1.balon);
	oyuncu1.balonEkle(470,155);
	var z;
	z = setInterval(sisir,1000);
	function sisir(){oyuncu1.balonSisir();}
	var oyuncu2:oyuncu = new oyuncu();
	addChild(oyuncu2.balon);
	oyuncu2.balonEkle(70,155);
	var renk:ColorTransform;
	renk.color=0xff0000;
	balon.transform.colorTransform = renk;
	var z2;
	z2 = setInterval(sisir2,1000);
	function sisir2(){oyuncu2.balonSisir();if(oyuncu1.balon.height==60){oyuncu1.balonPatlat();trace("balonpatladı");}}
	
	/*balon şişir ve patlat
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
		}
	}*/


}