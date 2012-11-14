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
		public var balon:ballon = new ballon();
		public function oyuncu()
		{
			// constructor code
		}
		/**
		 * Balon ekleme fonksiyonu 
		 *
		 *
		 *
		 */
		public function balonEkle(balonX,balonY)
		{

			//addChild(this.balon);
			this.balon.x = balonX;
			this.balon.y = balonY;
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

		}
		/**
		 * balon patlatma fonksiyonu
		 *
		 *
		 */
		 public function balonPatlat(){
			 this.balon.gotoAndPlay(3);
		 }
	}

}