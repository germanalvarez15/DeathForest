package  {
	import flash.display.MovieClip;
	import flash.events.*;


	public class piedra extends MovieClip {
	//	var desplazamiento:int;
		var direccion:int;
		var i:int;
		
		public function piedra(){			
			direccion=bueno.rotacionjugador;
			this.x=bueno.posx;
			this.y=bueno.posy;
			//addEventListener(Event.ADDED, comienzoClase);
//			addEventListener(Event.ENTER_FRAME, movimientodisparo);
			this.addEventListener(Event.ENTER_FRAME,moverbala);
			
		}
		
		public function moverbala(e:Event){
			if(direccion == 0){
				this.y -=10;
			}
			
			if(direccion == 90){
				this.x +=10;
			}
			
			if(direccion == 180){
				this.y +=10;
			}
			
			if(direccion == -90){
				this.x -=10;
			}
		}
	
		
		
		
		//
//		private function comienzoClase(event:Event):void{
//			_root = MovieClip(root);
//		}
//		
//		
//		
//		private function movimientodisparo(event:Event):void{
//			y -= velocidad;
//			if(this.y < -1 * this.height){
//				removeEventListener(Event.ENTER_FRAME, movimientodisparo);
//				_root.removeChild(this);
//			}
//			if(this.y < +600 * this.height){
//				removeEventListener(Event.ENTER_FRAME, movimientodisparo);
//				_root.removeChild(this);
//			}
//			if(this.x < +800 * this.width){
//				removeEventListener(Event.ENTER_FRAME, movimientodisparo);
//				_root.removeChild(this);
//			}
//			if(this.x < -1 * this.width){
//				removeEventListener(Event.ENTER_FRAME, movimientodisparo);
//				_root.removeChild(this);
//			}
//		
//		}
}
}















