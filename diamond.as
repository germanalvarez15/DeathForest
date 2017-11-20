package  {
	import flash.display.MovieClip;
	import flash.events.*;
	public class diamond extends MovieClip{
		var posX:int;
		var posY:int;
		
		public function diamond() {
			// constructor code
			posX= 636;
			posY= 99;
			this.x=posX;
			this.y=posY;
		}
		public function eliminar(){
			parent.removeChild(this);
		}
	}
	
}
