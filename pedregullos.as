package  {
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class pedregullos extends MovieClip{
		var posX:int;
		var posY:int;

		public function pedregullos() {
			// constructor code
			posX= 50;
			posY= 442;
			this.x=posX;
			this.y=posY;
			
			
		}
		
		public function eliminar(){
			parent.removeChild(this);
		}

	}
	
}
