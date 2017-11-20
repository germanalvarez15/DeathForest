package  {
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class maderas extends MovieClip {
			var posX:int;
			var posY:int;
	
		public function maderas() {
			posX= 200;
			posY= 100;
			this.x=posX;
			this.y=posY;
	
		}
		public function eliminar(){
			parent.removeChild(this);
		}
		/*public function agregar(){
			
		}*/

	}
	
}
