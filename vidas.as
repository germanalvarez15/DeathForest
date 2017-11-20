package  {
	import flash.display.MovieClip;
	import flash.events.*;
	public class vidas extends MovieClip {

		public function vidas() {
			// constructor code
		}
		
		public function eliminar(){
			parent.removeChild(this);
		}
		
	}
	
}
