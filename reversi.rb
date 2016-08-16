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

def swap
	
end


def main()
	matriz = []
	tablero(matriz)
	player = []
	puntos = []
	nombres(player)
	jugador_1 = "Jugador 1 (X): #{player[0].capitalize}"
	jugador_2 = "Jugador 2 (0): #{player[1].capitalize}"
	
	loop do
		system("clear")

		imprimir(matriz)
		puts
		contador(matriz,puntos)
		puts "#{jugador_1} | Puntos --> #{puntos[0]}"
		puts "#{jugador_2} | Puntos --> #{puntos[1]}"
		gets
	end
end

main()