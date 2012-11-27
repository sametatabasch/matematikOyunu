package 
{

	/* Soru oluşturma ve denetleme işlemleri bu  sınıf ile yapılacak
	 * 
	 *
	 */
	public class sor
	{

		public var seviye:int;
		public var islem:String;
		public var soru:String;
		public var cevap:int;

		/**
		 * constructor metod u 
		 * @param seviye:int
		 *
		 */
		public function sor(seviye)
		{
			// constructor code
			this.seviye = seviye;
		}
		/**
		 * belirtilen iki sayı arasında rastgele sayı üreten fonksiyon 
		 * @param ilk:int
		 * @param son:int
		 * @return int
		 */
		function rasgele(ilk:int,son:int)
		{
			var sonuc:Number = Math.random() * son + ilk;
			return Math.round(sonuc);
		}
		/**
		 * islemBelirle fonksiyonu 
		 * seviyeye uygun işlemi dizisini belirleyen fonksiyon
		 *
		 * @return Array
		 */
		public function islemBelirle()
		{
			var arr:Array;
			switch (this.seviye)
			{
				case 1 :
					arr = ['+','+','-','+','+','-','+','+','-','-'];
					this.islem = arr[this.rasgele(0,9)];
					return this.islem;
					break;
				case 2 :
					arr = ['+','+','-','+','+','-','+','+','-','-'];
					this.islem = arr[this.rasgele(0,9)];
					return this.islem;
					break;
				case 3 :
					arr = ['+','/','-','*','+','-','*','+','/','-'];
					this.islem = arr[this.rasgele(0,9)];
					return this.islem;
					break;
				case 4 :
					arr = ['+','/','-','*','+','-','*','+','/','-'];
					this.islem = arr[this.rasgele(0,9)];
					return this.islem;
					break;
				default :
					arr = ['+','+','-','+','+','-','-','+','-','-'];
					this.islem = arr[this.rasgele(0,9)];
					return this.islem;
					break;
			}
		}
		/**
		 * sayiUret fonksiyonu
		 * 
		 * @return int
		 */
		private function sayiUret():int
		{
			switch (this.seviye)
			{
				case 1 :
					return this.rasgele(0,10);
					break;
				case 2 :
					return this.rasgele(0,20);
					break;
				case 3 :
					return this.rasgele(0,10);
					break;
				case 4 :
					return this.rasgele(0,20);
					break;
				default :
					return this.rasgele(0,10);
					break;
			}
		}
		/**
		 * soruUret fonksiyonu 
		 * seviyeve uygun işlem üreten fonksiyon
		 *
		 *
		 */
		public function soruUret()
		{
			var r1,r2,sonuc:Number;
			r1 = this.sayiUret();
			r2 = this.sayiUret();
			this.islemBelirle();
			switch (this.islem)
			{
				case '+' :
					this.cevap = r1 + r2;
					break;
				case '-' :
					while (r2>r1 && this.seviye==1)
					{
						r1 = this.rasgele(0,10);
						r2 = this.rasgele(0,10);
					}
					this.cevap = r1 - r2;
					break;
				case '*' :
					this.cevap = r1 * r2;
					break;
				case '/' :
					while (r1%r2!=0 || r2==0)
					{
						r1 = this.rasgele(0,10);
						r2 = this.rasgele(0,10);
					}
					this.cevap = r1 / r2;
					break;
			}
			this.soru = r1 + ' ' + this.islem + ' ' + r2 + ' = ';
		}


	}

}