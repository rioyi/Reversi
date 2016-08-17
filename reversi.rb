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
	m[3][3] = "|O|"
	m[3][4] = "|X|"	
	m[4][3] = "|X|"
	m[4][4] = "|O|"
	m[4][5] = "|O|"
	m[5][5] = "|X|"
	
	m[1][0] = "|X|"
	m[2][0] = "|O|"
	m[3][0] = "|O|"
	
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
			if m[i][j] == "|O|"
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

def pantalla(matriz,puntos,jugador_1,jugador_2,player,turnos)
	imprimir(matriz)
	puts
	contador(matriz,puntos)
	puts "#{jugador_1} | Puntos --> #{puntos[0]}"
	puts "#{jugador_2} | Puntos --> #{puntos[1]}"
	puts "Numero de turnos = #{turnos}"
	puts turnos % 2 == 0 ? "Turno de #{player[1].capitalize}" : "Turno de #{player[0].capitalize}"
end

#READY
def validacion_abajo(m)
	coor = []
	for i in 0..m.length - 1			
		for j in 0..m.length - 1
			a = [] 
			if m[j][i] == "|X|"				
				while m[j + 1][i] == "|O|" 
					j += 1
					if m[j + 1][i] == "| |" 
						a << j + 1 
						a << i
						coor << a
					end
				end
			end
		end
	end
	return coor
end

#READY
def validacion_arriba(m)
	coor = []
	for i in 0..m.length - 1			
		for j in 0..m.length - 1
			a = []
			if m[j][i] == "|X|"				
				while m[j - 1][i] == "|O|" 
					j -= 1
					
					if m[j - 1][i] == "| |"
						a << j - 1 
						a << i
						coor << a
					end
				end
			end
		end
	end
	return coor
end

#READY
def validacion_derecha(m)
	coor = []
	for i in 0..m.length - 1			
		for j in 0..m.length - 1
			a = [] 
			if m[i][j] == "|X|"				
				while m[i][j + 1] == "|O|" 
					j += 1
					if m[i][j + 1] == "| |" 
						a << i 
						a << j + 1
						coor << a
					end
				end
			end
		end
	end
	return coor
end

#READY
def validacion_izquierda(m)
	coor = []
	for i in 0..m.length - 1			
		for j in 0..m.length - 1
			a = [] 
			if m[i][j] == "|X|"				
				while m[i][j - 1] == "|O|" 
					j -= 1
					if m[i][j - 1] == "| |" 
						a << i 
						a << j - 1
						coor << a
					end
				end
			end
		end
	end
	return coor
end

#READY
def validacion_derecha_abajo(m)
	coor = []
	for i in 0..m.length - 1			
		for j in 0..m.length - 1
			a = [] 
			if m[i][j] == "|X|"				
				while m[i + 1][j + 1] == "|O|" 
					j += 1
					i += 1
					if m[i + 1][j + 1] == "| |" 
						a << i + 1
						a << j + 1
						coor << a
					end
				end
			end
		end
	end
	return coor
end



def jugadas_validas(jugador)
	
end

def mover_ficha(validas)
	flag = false

	loop do

	puts "Ingrese la fila"
	fila = gets.chomp.to_i
	puts "Ingrese la columna"
	columna = gets.chomp.to_i
	if columna < fila
		flag = true
	else
		puts "JUGADA NO VALIDA"
		puts
	end
	break if flag == true
	end


end

def cambiar_fichas
	
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
		#validas = []
		#coordenadas = []
		pantalla(matriz,puntos,jugador_1,jugador_2,player,turnos)
		jugador_actual = turnos % 2 == 0 ? "|x|" : "|0|"
		#validas = jugadas_validas(jugador_actual)
		#if validas != []		
			abajo = validacion_abajo(matriz)
			puts "Bajo #{abajo}"
			#arriba = validacion_arriba(matriz)
			#puts "Arriba #{arriba}"
			arriba = validacion_arriba(matriz)
			puts "arriba #{arriba}"

			derecha = validacion_derecha(matriz)
			puts "Derecha #{derecha}"	
			#mover_ficha(validas)

			izquierda = validacion_izquierda(matriz)
			puts "izquieda #{izquierda}"

			dere_abajo = validacion_derecha_abajo(matriz)
			puts "dere_abajo #{dere_abajo}"
			#if coordenadas == jugadasvalidas
				#cambiar_fichas
			#else
				#ralizar una _jugada_valida
			#end
		#elsif jugas_validas_proximo == []  
			#puts "fin del juego"
		#end

		
		turnos += 1
		  
		gets

	end
end

main()