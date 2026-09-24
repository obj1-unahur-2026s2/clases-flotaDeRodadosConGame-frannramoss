class Corsa{
	const capacidad = 4
	var color
	const velocidadmax = 150
	const peso = 1300

  method capacidad() = capacidad
  method color() = color
  method velocidadMaxima() = velocidadmax
  method peso() = peso
}

class Kwid{
  method color() = "azul"
  var tanqueadd = false
  const combustible = "gas"

  method capacidad() = if (tanqueadd) 3 else 4
  
  method velocidadMaxima() = if (tanqueadd) 110 else 120

  method peso() = 1200 + if (tanqueadd) 150 else 0
  
  method agregarTanque(){
    tanqueadd = true
  }
  method sacarTanque() {
    tanqueadd = false
  }
}  

object tranffic{
  method color() = "Blanco"
  var interior = popular
  var motor = bataton

  method cambiarMotorA(mot) {
    motor = mot
  }

  method cambiarInteriorA(int) {
    interior = int
  }
 
  method velocidadMaxima() = motor.veloMax()
  method peso() = 4000 + interior.peso() + motor.peso()
  method capacidad() = interior.capacidad()
}

object popular {
  method capacidad() = 12
  method peso() = 1000
}
object comodo {
  method capacidad() = 5
  method peso() = 700
}
object bataton {
  method peso() = 500
  method veloMax() = 80
}
object pulenta {
  method peso() = 800
  method veloMax() = 130
}

class Dependencia{
  var empleados
  const flota = []

  method agregarAFlota(rodado) {
    flota.add(rodado)
  }
  method quitarAFlota(rodado) {
    flota.remove(rodado)
  }

  method pesoTotalFlota() = flota.sum({r=>r.peso()})

  method estaBienEquipada() = flota.size() >= 3 and flota.all({r=>r.velocidadMaxima() >= 100})

  method capacidadTotalEnColor(unColor) = flota.filter({r=>r.color() == unColor}).sum({r=>r.capacidad()})

  method colorDelRodadoMasRapido() = flota.max({r=>r.velocidadMaxima()}).color()

  method capacidadFaltante() = ( empleados - flota.sum({r=>r.capacidad()}) ).max(0)

  method esGrande() = empleados >= 40 and flota.size() >= 5
}