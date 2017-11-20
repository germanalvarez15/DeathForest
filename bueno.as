package  {
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class bueno extends MovieClip {
			var vely:int;
			var velx:int;
			var jack:Boolean;
		static var rotacionjugador:int;
		static var posx:int;
		static var posy:int;
			
			
		public function bueno() {
			this.x=400;
			this.y=300;
			posx=this.x;
			posy=this.y;
			
			// constructor code
			this.scaleX=0.7;
			this.scaleY=0.7;
			velx = 5;
			vely = 5;
			this.addEventListener(Event.ENTER_FRAME,a);
		}
		public function a(e:Event){
			rotacionjugador= this.rotation;
			posx=this.x;
			posy=this.y;
		}
		
		public function eliminar(){
			parent.removeChild(this);
		}

	}
	
}
