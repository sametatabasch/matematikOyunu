import flash.events.MouseEvent;
import flash.geom.ColorTransform;

baslaButon.addEventListener(MouseEvent.CLICK,basla);
oyuncuSayisiBelirle.addEventListener(Event.CHANGE,balonYerlestir);
var oyuncuSayisi:int;
// global olması için fonksiyon dışında oyuncuları  tanımlıyorum
var oyuncu1:oyuncu = new oyuncu();
var oyuncu2:oyuncu = new oyuncu();
var oyuncu3:oyuncu = new oyuncu();
var oyuncu4:oyuncu = new oyuncu();
function balonYerlestir(e:Event)
{
	oyuncuSayisi = oyuncuSayisiBelirle.value;
	/*
	bu  kısımda önceden eklenmiş  balonlar varsa onları  silip  yeni  balonlar için yer ayarlamak  gerekiyor
	asıl  sorun  4 balondan 3 balona düşünce 4.  balonu  silmek 
	*/
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
}

function basla(e:MouseEvent)
{
	var islm:sor = new sor(seviyeBelirle.value);
	islm.soruUret();
	soru.text = islm.soru;
	trace(islm.cevap);
	//------------------------

	var z = setInterval(oyuncu1.balonSisir,1000);//oyuncu birin balonunu şişir
	

	var z2 = setInterval(oyuncu2.balonSisir,1000);


	var z3 = setInterval(oyuncu3.balonSisir,1000);


	var z4 = setInterval(oyuncu4.balonSisir,1000);
	//-----------------

}