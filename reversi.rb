#Reversi

def nombres(player)
	for i in 0..1
		puts "Ingrese el nombre del Jugador #{i + 1}"
		jugador = gets.chomp
		player << jugador
	end
	return player
end

def tablero(m)	
	for i in 0..7
		a = [] 
		for j in 0..7
			a << "| |"
		end
		m << a
	end
	m[3][3] = "|0|"
	m[3][4] = "|X|"
	m[4][4] = "|0|"
	m[4][3] = "|X|"

	return m
end

def imprimir(m)
	puts "======== REVERSI ========"
	puts ""
	puts "   0  1  2  3  4  5  6  7"
	for i in 0..m.length - 1
		print "#{i} "		
		for j in 0..m.length - 1
			print m[i][j]			
		end
		puts
	end	
	return m
end

def contador(m,puntos)
	sum_X = 0
	sum_0 = 0
	for i in 0..m.length - 1
		for j in 0..m.length - 1
			if m[i][j] == "|0|"
				sum_0 += 1
			elsif m[i][j] == "|X|"
				sum_X += 1
			end
		end			
	end
	puntos << sum_0
	puntos << sum_X
	
	return puntos
end


def main()
	matriz = []
	tablero(matriz)
	player = []
	puntos = []
	turnos = 1
	nombres(player)
	jugador_1 = "Jugador 1 (X): #{player[0].capitalize}"
	jugador_2 = "Jugador 2 (0): #{player[1].capitalize}"
	
	loop do
		system("clear")
		validas = []
		coordenadas = []
		imprimir(matriz)
		puts
		contador(matriz,puntos)
		puts "#{jugador_1} | Puntos --> #{puntos[0]}"
		puts "#{jugador_2} | Puntos --> #{puntos[1]}"
		validas = jugadas_validas
		coordenadas = mover_ficha
		if validas != []
			if coordenadas == jugadasvalidas
				cambiar fichas flanqueadas
			else
				ralizar una jugada valida
			end
		elsif jugas validas proximo == nil  
			fin del juego
		end


		puts "Numero de turnos = #{turnos}"
		puts turnos % 2 == 0 ? "Turno de #{player[1].capitalize}" : "Turno de #{player[0].capitalize}"
		turnos += 1
		  
		gets

	end
end

main()