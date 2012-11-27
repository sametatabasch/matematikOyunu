package 
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.display.Stage;

	/*
	 * oyuncu Sınıfı
	 * oyuncu  hakkındaki  bilgileri ve işlemleri  barındıran sınıf 
	 * 
	 */
	public class oyuncu extends MovieClip
	{
		/*
		 * oyuncu isimlerini tutacak dizi max 4 oyuncu
		 *  var Array
		 */
		public var adi:String;
		public var puan:int = 0;
		public var balon:ballon = new ballon  ;
		public var patladi:Boolean;
		public var timer:Timer=new Timer(1000);
		private var sahne:Stage;
		public function oyuncu(s:Stage)
		{
			// constructor code
			this.sahne=s;
			this.timer.addEventListener(TimerEvent.TIMER,this.sisir);
		}
		/**
		 * Balon ekleme fonksiyonu 
		 * balonun konumunu ve ilk boyutlarını belirler
		 * @param balonX :int
		 * @param balonY :int
		 *
		 */
		public function balonEkle(balonX:int,balonY:int)
		{
			this.sahne.addChild(this.balon);
			this.balon.x = balonX;
			this.balon.y = balonY;
			this.balon.height = 50;
			this.balon.width = 35;
			this.patladi = false;
			//------------------------------
		}
		/**
		 * balonSisir fonksiyonu 
		 * balon şişirme işlemini başlatır
		 */
		public function balonSisir()
		{
			this.timer.start();
		}
		/**
		 * balonDurdur fonksiyonu 
		 * balon şişirme işlemini durdurur
		 */
		public function balonDurdur(){
			this.timer.stop();
		}
		/**
		 * sisir fonksiyonu 
		 * balon şişirme işlemini tanımlar
		 */
		public function sisir(t:TimerEvent){
			this.balon.height +=  2;
			this.balon.width +=  2;
			if (this.balon.width >= 100)
			{
				this.balonPatlat();
				this.balonDurdur();
			}
		}
		/**
		 * balonPatlat fonksiyonu
		 * balonu Patlatır
		 *
		 */
		public function balonPatlat()
		{
			this.balon.gotoAndPlay(3);
			this.patladi = true;
		}
		/**
		 * balonKaldir
		 *
		 *
		 */
		 public function balonKaldir()
		 {
			 this.sahne.removeChild(this.balon);
		 }
	}

}