 package  {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
   	import flash.utils.getTimer;

	
	
	public class inicio extends MovieClip {
			static var rana:enemigo1;
			var frog: Array = new Array();
			static var zombie: enemigo2;
			var zomb: Array = new Array();
			static var hombrelobo: enemigo3;
			var lobo:Array = new Array();
			var madera:Array = new Array();
			var pedregullo1:Array = new Array();
			var pedregullo2:Array = new Array();
			var pedregullo3:Array = new Array();
			var diamante1:Array = new Array();
			var diamanteabajo:Array = new Array();
			var agarromadera:Boolean;
			var otramadera:Boolean;
			var agarropedregullo:Boolean;
			var otropedregullo:Boolean;
			var agarrodiamante:Boolean;
			var otrodiamante:Boolean;
			var muerto:Boolean=false;
			var activadornivel:int=1;
			static var jack:bueno;
			var disparo:piedra;
			var i:int;
			var a: int;
			var m:int;
			var muestratexto:int;
			var cantidadmaderas:int;
			var segundoagua:uint=120;
			var cronometroagua:Timer=new Timer(1000,120);
			var cronometrocolagua:TextField= new TextField();
			var tiempoagua:int =0;
			var presionadoagua:int=12;
			var segundo:uint=120;
			var cronometro:Timer=new Timer(1000,550);
			static var tiro:piedra;
			var tiempo:int = 0; /*cTime*/
			var presionado:int = 12; /*cLimit*/
			var disparoDisponible:Boolean = true;
			var casainvisible:pozoaconstruir;
			var casaconstruida:casaterminada;
			var caverna:cueva;
			var canteroabajo:cantero;
			var cerca:reja;
			var lago:agua;
			var sand:arena;
			var muertes: int;
			var maderascasa:int;
			var pedregullocasa:int;
			var diamantecasa:int;
			var puntosmadera:TextField= new TextField();
			var puntospiedra:TextField= new TextField();
			var puntosdiamante:TextField= new TextField();
			var agarromaderatexto:TextField= new TextField();
			var agarropiedratexto:TextField= new TextField();
			var agarrodiamantetexto:TextField = new TextField();
			var puntaje:int;
			var cronometrocol:TextField= new TextField();
			var puntos:TextField= new TextField();
			var formatotexto:TextFormat=new TextFormat();
			var formatotextoagua:TextFormat=new TextFormat();
			var formatotextopiedra:TextFormat=new TextFormat();
			var formatotextodiamante:TextFormat=new TextFormat();
			static var nivel:int;
			var alNivel:int = 1;
			
			
			
		public function inicio2() {
			// constructor code
			

			creacionagarromadera();
			creacionagarropiedra();
			creacionagarrodiamante();
			creaciondemaderas();
			creacionpuntos();
			creacioncasa();
			creacioncasapiedra();
			creacioncasadiamante();
			creacioncronometro();
			zombie = new enemigo2();			
			jack = new bueno();
			disparo = new piedra();
			casainvisible = new pozoaconstruir();
			casaconstruida = new casaterminada();
			cerca = new reja();
			lago = new agua();
			sand = new arena();
			caverna = new cueva();
			canteroabajo = new cantero();
			casainvisible.x = 400;
			casainvisible.y = 300;
			casaconstruida.x = 396;
			casaconstruida.y = 308;
			caverna.x = 617;
			caverna.y = -49; 
			sand.x=294;
			sand.y=223;
			addChild (jack);
			addChildAt(casainvisible,1);
			addChildAt(casaconstruida,1);
			addChildAt(caverna,1);
			addChildAt(sand,2);
			casaconstruida.visible=false;
			caverna.visible = false;
			sand.visible = false;
			agua1.visible = false;
			agua2.visible = false;
			agua3.visible = false;
			agua4.visible = false;
			agua5.visible = false;
			agua6.visible = false;
			agua7.visible = false;
			agua8.visible = false;
			agua9.visible =  false;
			agua10.visible = false;
			agua11.visible = false;
			agua12.visible = false;
			/*addChild (disparo);*/
			stage.addEventListener(KeyboardEvent.KEY_DOWN, presionar);
			stage.addEventListener(Event.ENTER_FRAME, colision);
			cronometro.start();
			cronometro.addEventListener(TimerEvent.TIMER,cronos);
			cronometro.addEventListener(TimerEvent.TIMER_COMPLETE, cronos);
			cronometroagua.stop();
			cronometroagua.addEventListener(TimerEvent.TIMER,cronometroaguafuncion);
			cronometroagua.addEventListener(TimerEvent.TIMER_COMPLETE, cronometroaguafuncion);
			for (i=0; i<2; i++){
				frog[i] = new enemigo1();
				addChild(frog[i]);
			
			
			}
			
		}
		
		
		
		
		function creacioncronometroagua(){
			formatotextoagua.size=30;
			formatotextoagua.font="arial";
			formatotexto.color=0x2CB0FC;
			cronometrocolagua.defaultTextFormat=formatotextoagua;
			cronometrocolagua.x=555;
			cronometrocolagua.y=515;
			cronometrocolagua.height=60;
			cronometrocolagua.text=String(segundoagua);
			stage.addChild(cronometrocolagua);
			
		}
		
	
		function cronos(e:TimerEvent){
			segundo--;
			cronometrocol.text=String(segundo);
		}
		
		function cronometroaguafuncion (e:TimerEvent){
				segundoagua--;
				cronometrocolagua.text=String(segundoagua);
				 
		}
		
		function acabo(e:TimerEvent){
			trace("tiempo completo");
			
		}
		
		function creacioncronometro(){
			formatotexto.size=60;
			formatotexto.font="arial";
			formatotexto.color=0xFF0000;
			cronometrocol.defaultTextFormat=formatotexto;
			cronometrocol.x=355;
			cronometrocol.y=515;
			cronometrocol.height=60;
			cronometrocol.text=String(segundo);
			stage.addChild(cronometrocol);
		}
		
		
		
		function creaciondemaderas(){
			var i:int;
			var cantidadmaderas:int = 8;
			i=0;
			var largo:int;
			largo=8;
			
			for (i = 0; i < largo; i++) {
				madera[i] = new maderas();
				madera[i].y = 50;
				madera[i].x = (i * 50) + 50;
				addChild(madera[i]);
			}	
			
		}
		
			//SE CREAN LOS 3 PEDREGULLOS DE ARRIBA
			function creacionpedregulloarriba(){
				
					var e:int;
		//			var cantidadmaderas:int = 8;
					e=0;
					var largoarriba:int;
					largoarriba=4;
		
					for (e = 0; e < largoarriba; e++) {
						pedregullo1[e] = new pedregullos();
						pedregullo1[e].y = 450;
						pedregullo1[e].x =(e * 50) + 50;
						addChild(pedregullo1[e]);
					}
				
			}
			//SE CREAN LOS 3 PEDREGULLOS DEL MEDIO
			function creacionpedregullomedio(){
				
					var f:int;
		//			var cantidadmaderas:int = 8;
					f=0;
					var largomedio:int;
					largomedio=4;
		
					for (f = 0; f < largomedio; f++) {
						pedregullo2[f] = new pedregullos();
						pedregullo2[f].y = 500;
						pedregullo2[f].x =(f * 50) + 50;
						addChild(pedregullo2[f]);
					}
			}
			
			//SE CREAN LOS 3 PEDREGULLOS DE ABAJO
			function creacionpedregulloabajo(){
				
					var g:int;
		//			var cantidadmaderas:int = 8;
					g=0;
					var largoabajo:int;
					largoabajo=4;
		
					for (g = 0; g < largoabajo; g++) {
						pedregullo3[g] = new pedregullos();
						pedregullo3[g].y = 550;
						pedregullo3[g].x =(g * 50) + 50;
						addChild(pedregullo3[g]);
					}
			}
			
			function creaciondiamantes(){
				
					var o:int;
					o=0;
					var largodiamante:int;
					largodiamante=3;
		
					for (o = 0; o < largodiamante; o++) {
						diamante1[o] = new diamond();
						diamante1[o].y = 99;
						diamante1[o].x =(o * 50) + 636;
						addChild(diamante1[o]);
					}
					
			}
			
			
			function creaciondiamantesabajo(){
				
					var l:int;
					l=0;
					var largodiamanteabajo:int;
					largodiamanteabajo=3;
					
				for (l = 0; l < largodiamanteabajo; l++) {
						diamanteabajo[l] = new diamond();
						diamanteabajo[l].y = 150;
						diamanteabajo[l].x =(l * 50) + 636;
						addChild(diamanteabajo[l]);
				}
				
			}
		
		function creacionpuntos(){
			formatotexto.size=20;
			formatotexto.font="arial";
			formatotexto.color=0x000000;
			puntos.defaultTextFormat=formatotexto;
			puntos.x=425;
			puntos.y=15;
			puntos.height=26;
			puntos.text=String(puntaje);
			stage.addChild(puntos);
		}


		function creacioncasa(){
			formatotexto.size=20;
			formatotexto.font="arial";
			formatotexto.color=0x000000;
			puntosmadera.defaultTextFormat=formatotexto;
			puntosmadera.x=480;
			puntosmadera.y=15;
			puntosmadera.height=26;
			puntosmadera.text=String(maderascasa);
			stage.addChild(puntosmadera);
		}
		function creacioncasapiedra(){
			formatotexto.size=20;
			formatotexto.font="arial";
			formatotexto.color=0x000000;
			puntospiedra.defaultTextFormat=formatotexto;
			puntospiedra.x=550;
			puntospiedra.y=15;
			puntospiedra.height=26;
			puntospiedra.text=String(pedregullocasa);
			stage.addChild(puntospiedra);
		}
		
		function creacioncasadiamante(){
			formatotexto.size=20;
			formatotexto.font="arial";
			formatotexto.color=0x000000;
			puntosdiamante.defaultTextFormat=formatotexto;
			puntosdiamante.x=625;
			puntosdiamante.y=15;
			puntosdiamante.height=26;
			puntosdiamante.text=String(diamantecasa);
			stage.addChild(puntosdiamante);
		}
		
		
		function creacionagarromadera(){
			formatotexto.size=20;
			formatotexto.font="arial";
			formatotexto.color=0x61380B;
		
				agarromaderatexto.defaultTextFormat=formatotexto;
				agarromaderatexto.x=600;
				agarromaderatexto.y=40;
				agarromaderatexto.height=26;
				agarromaderatexto.width=500;
				agarromaderatexto.text=String("se agarro una madera");
				stage.addChild(agarromaderatexto);
				agarromaderatexto.visible = false;
			
		}
		
		function creacionagarropiedra(){
			formatotexto.size=20;
			formatotexto.font="arial";
			formatotexto.color=0xFFFFFF;

				agarropiedratexto.defaultTextFormat=formatotexto;
				agarropiedratexto.x=600;
				agarropiedratexto.y=40;
				agarropiedratexto.height=26;
				agarropiedratexto.width=500;
				agarropiedratexto.text=String("se agarro una piedra");
				stage.addChild(agarropiedratexto);
				agarropiedratexto.visible = false;
			
		}
		
		function creacionagarrodiamante(){
			formatotexto.size=20;
			formatotexto.font="arial";
			formatotexto.color=0x2EFEF7;

				agarrodiamantetexto.defaultTextFormat=formatotexto;
				agarrodiamantetexto.x=600;
				agarrodiamantetexto.y=40;
				agarrodiamantetexto.height=26;
				agarrodiamantetexto.width=500;
				agarrodiamantetexto.text=String("se agarro un diamante");
				stage.addChild(agarrodiamantetexto);
				agarrodiamantetexto.visible = false;
			
		}
		
		

		
		
		//CREACION DE TODAS LAS COLISIONES DEL JUEGO 
		function colision(e: Event) {
			var i:int;
			var len:int;
			var len1:int;//variable que acumula las maderas
			var pedregu:int;//variable que acumula las piedras del pedregullo
			var diaman:int;
			var rana:int;
			var deshabilitoAgarroMadera:Boolean = true;
			var eliminarcorazones:Boolean;
			len1=0;
			pedregu=0;
			diaman=0;
			rana=0;
			//trace(i);

		
			for (i=0; i<frog.length; i++){
			if (jack.hitTestObject(frog[i])) {
				jack.eliminar();
				jack.x=150;
				jack.y=250;
				stage.addChild(jack);
				muertes++;
				
				
				
			}
			
			//MUERTE DE RANA AL SER DISPARADO POR EL JUGADOR
			if (disparo.hitTestObject(frog[i])) {
				removeChild(frog[i]);
				frog.splice(i,1);
				puntaje+=10;	
				
			}
			}
			
			for (a=0; a<zomb.length; a++){
			if (jack.hitTestObject(zomb[a])) {
				jack.eliminar();
				jack.x=150;
				jack.y=250;
				stage.addChild(jack);
				muertes++;
				
			}
			
			//MUERTE DE ZOMBIE AL SER DISPARADO POR EL JUGADOR
			if (disparo.hitTestObject(zomb[a])) {
				removeChild(zomb[a]);
				zomb.splice(a,1);
				puntaje+=15;	
			
			}
			}
			
			for (m=0; m<lobo.length; m++){
			if (jack.hitTestObject(lobo[m])) {
				jack.eliminar();
				jack.x=150;
				jack.y=250;
				stage.addChild(jack);
				muertes++;
				
			}
			
			//MUERTE DE HOMBRE LOBO AL SER DISPARADO POR EL JUGADOR
			if (disparo.hitTestObject(lobo[m])) {
				removeChild(lobo[m]);
				lobo.splice(m,1);
				puntaje+=20;	
			
			}
			}
			
			
			
			
			if(muertes==1){
				corazon1.visible = false;
			}
			
			if(muertes==2){
				corazon2.visible = false;
			}
			
			if(muertes==3){
				corazon3.visible = false;
				jack.visible = false;
				muerto = true;
				cronometro.stop();
				cronometroagua.stop();
				stage.removeEventListener(Event.ENTER_FRAME, colision);
				alNivel= 1;
				puntaje = 0;
				gotoAndStop(4);
				
				
				if(alNivel==1){
					for (i=0; i<frog.length; i++){
						frog[i].eliminar();
					}
				}
				
				if(alNivel==2){
					for (i=0; i<frog.length; i++){
						frog[i].eliminar();
					}
				
					for(a=0; a<zomb.length; a++){
						zomb[a].eliminar();
					}
				}
				
				if(alNivel==3){
					for (i=0; i<frog.length; i++){
						frog[i].eliminar();
					}
				
					for(a=0; a<zomb.length; a++){
						zomb[a].eliminar();
					}
				}
				
				if(alNivel==4){
					for (i=0; i<frog.length; i++){
						frog[i].eliminar();
					}
				
					for(a=0; a<zomb.length; a++){
						zomb[a].eliminar();
					}
					
					for (m=0; m<lobo.length; m++){
						lobo[m].eliminar();
					}
				}

			}
			
			
			if(segundoagua==110){
				agua12.visible = false;
					
			}
								
			if(segundoagua==100){
				agua11.visible = false;
			}
			
			if(segundoagua==90){
				agua10.visible = false;
			}
			
			if(segundoagua==80){
				agua9.visible = false;
			}
			
			if(segundoagua==70){
				agua8.visible = false;
			}
			
			if(segundoagua==60){
				agua7.visible = false;
			}
			
			if(segundoagua==50){
				agua6.visible = false;
			}
			
			if(segundoagua==40){
				agua5.visible = false;
			}
			
			if(segundoagua==30){
				agua4.visible = false;
			}
			
			if(segundoagua==20){
				agua3.visible = false;
			}
			
			if(segundoagua==10){
				agua2.visible = false;
			}
			
			if(segundoagua==0){
				agua1.visible = false;
				muertes = 3;
			}
			
			
			if ((jack.hitTestObject(lago)) && (alNivel== 4)){
									agua1.visible = true;
									agua2.visible = true;
									agua3.visible = true;
									agua4.visible = true;
									agua5.visible = true;
									agua6.visible = true;
									agua7.visible = true;
									agua8.visible = true;
									agua9.visible =  true;
									agua10.visible = true;
									agua11.visible = true;
									agua12.visible = true;
									segundoagua = 120;
									
			}
			
						
			//ELIMINACION DE LAS MADERAS CUANDO SE COLISIONA CON EL JUGADOR
				for(len1=0; len1< madera.length;len1++){
					if(otramadera==false){
						
							if(jack.hitTestObject(madera[len1])){
								otramadera=true;
								agarromadera=true;
								madera[len1].eliminar();
								madera.splice(len1,1);
								trace("se agarro una madera");
								agarromaderatexto.visible = true;
								agarropiedratexto.visible = false;
								agarrodiamantetexto.visible = false;
							}
					}
				}
			
				//SUMA DE PUNTOS DE LAS MADERAS CUANDO EL JUGADOR COLISIONA CON LA CASA
				if (jack.hitTestObject(casainvisible)) {
					if (agarromadera==true){
					puntaje+=20;
					puntos.text=String(puntaje);
					maderascasa++;
					puntosmadera.text=String(maderascasa);
					agarromadera=false;
					otramadera=false;
					agarropiedratexto.visible = false;
					agarromaderatexto.visible = false;
					agarrodiamantetexto.visible = false;
					trace("dejaste una madera en la casa");
						if(maderascasa == 4){
							otramadera = true;
							trace("no podes dejar mas maderas");
						}
					}
					
				}	
				
				//ELIMINACION DE LAS PIDERAS DE ARRIBA CUANDO SE COLISIONA CON EL JUGADOR
				for(pedregu=0; pedregu< pedregullo1.length;pedregu++){
					if(otropedregullo==false){
						
							if(jack.hitTestObject(pedregullo1[pedregu])){
								otropedregullo=true;
								agarropedregullo=true;
								pedregullo1[pedregu].eliminar();
								pedregullo1.splice(pedregu,1);
								trace("se agarro una piedra");
								agarropiedratexto.visible = true;
								agarromaderatexto.visible = false;
								agarrodiamantetexto.visible = false;
							}
							
					}
				}
				//ELIMINACION DE LAS PIDERAS DEL MEDIO CUANDO SE COLISIONA CON EL JUGADOR
				for(pedregu=0; pedregu< pedregullo2.length;pedregu++){
					if(otropedregullo==false){
						if(jack.hitTestObject(pedregullo2[pedregu])){
								otropedregullo=true;
								agarropedregullo=true;
								pedregullo2[pedregu].eliminar();
								pedregullo2.splice(pedregu,1);
								trace("se agarro una piedra");
								agarropiedratexto.visible = true;
								agarromaderatexto.visible = false;
								agarrodiamantetexto.visible = false;
								/*stage.removeEventListener(Event.ENTER_FRAME, colision);*/
									
							}
					
					}
				}
				//ELIMINACION DE LAS PIDERAS DE ABAJO CUANDO SE COLISIONA CON EL JUGADOR
				for(pedregu=0; pedregu< pedregullo3.length;pedregu++){
					if(otropedregullo==false){
						if(jack.hitTestObject(pedregullo3[pedregu])){
								otropedregullo=true;
								agarropedregullo=true;
								pedregullo3[pedregu].eliminar();
								pedregullo3.splice(pedregu,1);
								trace("se agarro una piedra");
								agarropiedratexto.visible = true;
								agarromaderatexto.visible = false;
								agarrodiamantetexto.visible = false;
							}
					}
				}
				
				
				
				
				//SUMA DE PUNTOS DE LAS PIEDRAS CUANDO EL JUGADOR COLISIONA CON LA CASA
				if (jack.hitTestObject(casainvisible)) {
					if (agarropedregullo==true){
					puntaje+=10;
					puntos.text=String(puntaje);
					pedregullocasa++;
					puntospiedra.text=String(pedregullocasa);
					agarropedregullo=false;
					otropedregullo=false;
					agarropiedratexto.visible = false;
					agarromaderatexto.visible = false;
					agarrodiamantetexto.visible = false;
					trace("dejaste una piedra en la casa");
						if(pedregullocasa == 5){
							otropedregullo = true;
							trace("no podes dejar mas piedras");
						}
					}
					
				}	
				
				//ELIMINACION DE LOS DIAMANTES DE ARRIBA CUANDO SE COLISIONA CON EL JUGADOR
				for(diaman=0; diaman< diamante1.length;diaman++){
					if(otrodiamante==false){
						
							if(jack.hitTestObject(diamante1[diaman])){
								otrodiamante=true;
								agarrodiamante=true;
								diamante1[diaman].eliminar();
								diamante1.splice(diaman,1);
								trace("se agarro un diamante");
								agarrodiamantetexto.visible = true;
								agarromaderatexto.visible = false;
								agarropiedratexto.visible = false;
							}							
							
					}
				}
				//ELIMINACION DE LOS DIAMANTES DE ABAJO CUANDO SE COLISIONA CON EL JUGADOR
				for(diaman=0; diaman< diamanteabajo.length;diaman++){
					if(otrodiamante==false){
						if(jack.hitTestObject(diamanteabajo[diaman])){
								otrodiamante=true;
								agarrodiamante=true;
								diamanteabajo[diaman].eliminar();
								diamanteabajo.splice(diaman,1);
								trace("se agarro un diamante");
								agarrodiamantetexto.visible = true;
								agarromaderatexto.visible = false;
								agarropiedratexto.visible = false;
									
						}
					}
				}
				
				//SUMA DE PUNTOS DE LOS DIAMANTES CUANDO EL JUGADOR COLISIONA CON LA CASA
				if (jack.hitTestObject(casainvisible)) {
					if (agarrodiamante==true){
					puntaje+=10;
					puntos.text=String(puntaje);
					diamantecasa++;
					puntosdiamante.text=String(diamantecasa);
					agarrodiamante=false;
					otrodiamante=false;
					agarropiedratexto.visible = false;
					agarromaderatexto.visible = false;
					agarrodiamantetexto.visible = false;
					trace("dejaste un diamante en la casa");
						if(diamantecasa == 6){
							otrodiamante = true;
							trace("no podes dejar mas diamante");
						}
					}
					
				}	
				
				
				
				
				
				//SE GANO EL PRIMER NIVEL
				
				if ((puntaje==100) && (activadornivel == 1)){
					casainvisible.visible = false;
					casaconstruida.visible = true;
					alNivel++;
						if(alNivel == 2){  //PASO AL NIVEL 2 UNA VEZ QUE SE LLEGO A LOS 100 PUNTOS
							activadornivel= 2;
							maderascasa = 0;
							puntaje = 0;
							segundo = 240;
							this.creaciondemaderas();
							otramadera = false;
//							creacionpedregullo();
							creacionpedregulloarriba();
							creacionpedregullomedio();
							creacionpedregulloabajo();
							
							//SE VUELVEN A AGREGAR LOS ENEMIGOS1 - RANAS
							for (i=0; i<2; i++){
								frog[i] = new enemigo1();
								addChild(frog[i]);
							}
							//SE AGREGAN LOS ENEMIGOS2 - ZOMBIES
							for (a=0; a<2; a++){
								zomb[a] = new enemigo2();
								addChild(zomb[a]);
							}
							
							
						}
				}
				
				
				if((puntaje == 180) && (activadornivel == 2)){
					alNivel = 3;
						if(alNivel == 3){
								activadornivel=3;
								maderascasa = 0;
								pedregullocasa = 0;
								diamantecasa = 0;
								puntaje = 0;
								segundo = 360;
								this.creaciondemaderas();
								otramadera = false;
								otropedregullo = false;
								otrodiamante = false;
								caverna.visible = true;
								creacionpedregulloarriba();
								creacionpedregullomedio();
								creacionpedregulloabajo();
								creaciondiamantes();
								creaciondiamantesabajo();
								
								
								canteroabajo = new cantero();
								canteroabajo.x =300;
								canteroabajo.y = 380;
								addChildAt(canteroabajo,1);
								
								//SE AGREGAN LOS ENEMIGOS2 - RANAS
								for (i=0; i<3; i++){
									frog[i] = new enemigo1();
									addChild(frog[i]);
								}
								//SE AGREGAN LOS ENEMIGOS2 - ZOMBIES
								for (a=0; a<3; a++){
									zomb[a] = new enemigo2();
									addChild(zomb[a]);
								}
							
								
						}
				}
				if((puntaje == 265) && (activadornivel == 3)){
					alNivel=4;
						if(alNivel==4){
								activadornivel= 4;
								maderascasa = 0;
								pedregullocasa = 0;
								diamantecasa = 0;
								puntaje = 0;
								segundo = 420;
								cronometroagua.start();
								this.creaciondemaderas();
								otramadera = false;
								otropedregullo = false;
								otrodiamante = false;
								caverna.visible = true;
								sand.visible = true;
								agua1.visible = true;
								agua2.visible = true;
								agua3.visible = true;
								agua4.visible = true;
								agua5.visible = true;
								agua6.visible = true;
								agua7.visible = true;
								agua8.visible = true;
								agua9.visible =  true;
								agua10.visible = true;
								agua11.visible = true;
								agua12.visible = true;
								creacionpedregulloarriba();
								creacionpedregullomedio();
								creacionpedregulloabajo();
								creaciondiamantes();
								creaciondiamantesabajo();
								creacioncronometroagua();
								canteroabajo = new cantero();
								canteroabajo.x =300;
								canteroabajo.y = 380;
								addChildAt(canteroabajo,1);
								
								
								cerca = new reja();
								cerca.x=318;
								cerca.y=226;
								addChildAt(cerca,1);
								
								
								lago = new agua();
								lago.x=284;
								lago.y=229;
								addChildAt(lago,10);
								
								
								
								
								//SE AGREGAN LOS ENEMIGOS2 - RANAS
								for (i=0; i<3; i++){
									frog[i] = new enemigo1();
									addChild(frog[i]);
								}
								//SE AGREGAN LOS ENEMIGOS2 - ZOMBIES
								for (a=0; a<3; a++){
									zomb[a] = new enemigo2();
									addChild(zomb[a]);
								}
								//SE AGREGAN LOS ENEMIGOS3 - ZOMBIES
								for (m=0; m<3; m++){
									lobo[m] = new enemigo3();
									addChild(lobo[m]);
								}
								
							
							
						}
					
				}
				
				if(segundo == 0){
					gotoAndPlay(4); //Se agoto el tiempo
				}
				
				if((puntaje == 325) && (activadornivel = 4)){
					gotoAndPlay(3); //Ganaste
					
				}
							
		}
		
		
		function presionar(e: KeyboardEvent) {
			if (e.keyCode == 65) {
				jack.x -= jack.velx;
				jack.rotation=270;
				
	
			}
			if (e.keyCode == 68) {
				jack.x += jack.velx;
				jack.rotation=90;
				
			}
			
			if (e.keyCode == 87) {
				jack.y -= jack.vely;
				jack.rotation=0;
				
			}
			
			if (e.keyCode == 83) {
				jack.y += jack.vely;
				jack.rotation=180;
				
			}
			if(tiempo < presionado){
				tiempo++;
			} 
			else {
				disparoDisponible = true;
				tiempo = 0;
			}
			if (e.keyCode == 32) {
				disparo = new piedra();
				addChild(disparo);
			}

        }
}
}

		
