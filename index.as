import flash.events.MouseEvent;

/*
ilk sayfa bu  sayfa da oyuncuların adı , oyuncu  sayısı ve seviye belirlenecek
*/
var oyuncuAdi:Array = new Array(4);//oyuncu isimlerini tutacak dizi
//seviyelere göre işlemleri belirle
var s1islem:Array = ['+','+','-','+','*','-','/','+','-','-'];
var s2islem:Array = ['+','*','-','+','*','-','/','+','/','-'];
var s13slem:Array = ['*','+','-','+','*','*','/','+','/','-'];
var s4islem:Array = ['+','+','-','+','*','-','/','+','-','-'];
var seviye,etap,oyuncuSayisi:int;
//------------------------------
//seviye ve etap değişkenlerinin varsayılan değerleri
seviye=1;
etap=1;
oyuncuSayisi=1;
//------------------------------
//sayı bir ile sayı  iki  arasında rasgele sayı  üret	
function rasgele(ilk,son){
	var sonuc:Number = Math.random()*(son-ilk+1)+ilk;
	return Math.round(sonuc);
}
//------------------------------
baslaButon.addEventListener(MouseEvent.CLICK,basla);
function basla(e:MouseEvent){
	oyuncuSayisi=oyuncuSayisiBelirle.value;	//oyuncu  sayısını al
	seviye=seviyeBelirle.value; // seviyeyi al
	//işlemi oluştur
	var r1,r2,sonuc:Number;
	var islm:String;
	r1 = rasgele(0,50);
	r2 = rasgele(0,50);
	islm = s1islem[rasgele(0,9)];
	switch (islm){
		case '+': sonuc = r1 + r2;
		break;
		case '-': sonuc = r1 - r2;
		break;
		case '*': sonuc = r1 * r2;
		break;
		case '/': sonuc = r1 / r2;
		break;
	}
	sayi1.text = r1;
	sayi2.text = r2;
	islem.text = islm;
	sonucLabel.text = sonuc.toString();
	//------------------------
	//balon şişir ve patlat
	
	var z;
	z=setInterval(sisir,100);
	function sisir(){
		balon.height+=2;
		balon.width+=2;
		if(balon.width>=60){
			balon.gotoAndPlay(3);
			clearInterval(z);
		}
	}
	
}

