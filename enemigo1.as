package  {
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemigo1 extends MovieClip {
			var velx:int;
			var vely:int;
		public function enemigo1() {
			// constructor code
			this.scaleX=0.5;
			this.scaleY=0.5;
			velx = 3;
			vely = 3;
			this.x = Math.floor(Math.random()*800);
			this.y = Math.floor(Math.random()*600);
			this.addEventListener(Event.ENTER_FRAME, retorno);
		}
		function retorno(e:Event){
			
			if ((this.x < 0)||(this.x > 799)){
				velx = -velx;
				
			}
			if ((this.y < 0)||(this.y > 559)){
				vely = -vely;
			}
			this.x += velx;
			this.y += vely;
		}
		
		public function eliminar(){
			parent.removeChild(this);
		}


	
	}
	
}
