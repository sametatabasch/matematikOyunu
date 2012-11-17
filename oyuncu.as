package 
{
	/*
	 * oyuncu Sınıfı
	 * oyuncu  hakkındaki  bilgileri ve işlemleri  barındıran sınıf 
	 * 
	 */
	public class oyuncu
	{
		/*
		 * oyuncu isimlerini tutacak dizi max 4 oyuncu
		 *  var Array
		 */
		public var adi:String;
		public var puan:int = 0;
		public var balon:ballon = new ballon  ;
		public var patladi:Boolean;
		public function oyuncu()
		{
			// constructor code
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
			//addChild(this.balon);
			this.balon.x = balonX;
			this.balon.y = balonY;
			this.balon.height = 50;
			this.balon.width = 35;
			this.patladi=false;
			//------------------------------
		}
		/**
		 * balon şişirme fonksiyonu 
		 *
		 *
		 *
		 */
		public function balonSisir()
		{
			this.balon.height +=  2;
			this.balon.width +=  2;
			if (this.balon.width >= 100)
			{
				this.balonPatlat();
			}
		}
		/**
		 * balon patlatma fonksiyonu
		 *
		 *
		 */
		public function balonPatlat()
		{
			this.balon.gotoAndPlay(3);
			this.patladi=true;
			
		}
	}

}