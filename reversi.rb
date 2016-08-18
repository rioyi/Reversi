#usamos la gema
require 'colorize'

#+Reversi
def nombres(player, opcion)
  if opcion == "1"
    for i in 0..1
      puts "Ingrese el nombre del Jugador #{i + 1}"
      jugador = gets.chomp
      player << jugador
    end
    elsif opcion == "2"     
      puts "Ingrese el nombre del Jugador #{i}"
      jugador = gets.chomp.capitalize
      player << jugador
    end

  return player
end
#+Construye el tablero
def tablero(m)
  for i in 0..7
    a = []
    for j in 0..7
      a << "| |".green
    end
    m << a
  end
  m[3][3] = "|O|".red
  m[3][4] = "|X|".blue
  m[4][3] = "|X|".blue
  m[4][4] = "|O|".red
end

#+Imprime la matriz
def imprimir(m)
  puts "===============================".red
  puts "=========== REVERSI ===========".red
  puts ""
  puts "   0  1  2  3  4  5  6  7".yellow
  for i in 0..m.length - 1
    print "#{i} "
    for j in 0..m.length - 1
      print m[i][j]
    end
    puts
  end
  return m
end

#+Lleva el conteo de las fichas
def contador(m)
  puntos = []
  sum_X = 0
  sum_0 = 0
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      if m[i][j] == "|O|".red
        sum_0 += 1
      elsif m[i][j] == "|X|".blue
        sum_X += 1
      end
    end
  end
  puntos << sum_0
  puntos << sum_X

  return puntos
end

#+Miscelaneo de impresion de pantalla
def pantalla(matriz,jugador_1,jugador_2,player,turnos,opcion)
  imprimir(matriz)
  puts
  puts "===============================".blue
  puts "===============================".blue
  puntos = contador(matriz)
  puts "#{jugador_1} | Puntos --> #{puntos[1]}".blue
  puts "#{jugador_2} | Puntos --> #{puntos[0]}".red
  puts "Numero de turnos = #{turnos}"
  if opcion == "1"
  puts turnos % 2 == 0 ? "Turno de #{player[1]}".red : "Turno de #{player[0]}".blue
  else
  puts turnos % 2 == 0 ? "Turno de PC".red : "Turno de #{player[0]}".blue
  end
end

#+Revisión de hacia abajo --
def validacion_abajo(m,jugador_actual)
  coor = []  
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      a = []
      if m[j][i] == jugador_actual
        # j + 2 < 8 condicion unica
        while j + 2 < 8 && m[j + 1][i] == oponente  
          #break if j > 7 
          j += 1
          if m[j + 1][i] == "| |".green  
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

#+Revisión de hacia arriba --
def validacion_arriba(m,jugador_actual)
  coor = []
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      a = []
      if m[j][i] == jugador_actual
        while j - 2 >= 0 && m[j - 1][i] == oponente
          j -= 1          
          if m[j - 1][i] == "| |".green #&& j >= 0 #condicion unica
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

#+Revisión de hacia derecha
def validacion_derecha(m,jugador_actual)
  coor = []
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      a = []
      if m[i][j] == jugador_actual
        while j + 2 < 8 && m[i][j + 1] == oponente
          j += 1
          if m[i][j + 1] == "| |".green
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

#+Revisión de hacia izquierda
def validacion_izquierda(m,jugador_actual)
  coor = []
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      a = []
      if m[i][j] == jugador_actual
        while j - 2 >= 0 && m[i][j - 1] == oponente
          j -= 1
          if m[i][j - 1] == "| |".green #&& j > 0
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

#+Revisión de derecha abajo (Diagonal)
def validacion_derecha_abajo(m,jugador_actual)
  coor = []
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      a = []
      if m[i][j] == jugador_actual
        while i + 2 < 8 && j + 2 < 8 && m[i + 1][j + 1] == oponente
          j += 1
          i += 1
          if m[i + 1][j + 1] == "| |".green #&& m[i + 1][j + 1] != nil 
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

#+Revisión de derecha arriba (Diagonal)
def validacion_derecha_arriba(m,jugador_actual)
  coor = []
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      a = []
      if m[i][j] == jugador_actual
        while i - 2 >= 0 && j + 2 < 8 && m[i - 1][j + 1] == oponente
          j += 1
          i -= 1
          if m[i - 1][j + 1] == "| |".green #&& m[i-1][j+1] != nil && i > 0
            a << i - 1
            a << j + 1
            coor << a
          end
        end
      end
    end
  end
  return coor
end

#+Revisión de izquierda abajo (Diagonal)
def validacion_izquierda_abajo(m,jugador_actual)
  coor = []
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      a = []
      if m[i][j] == jugador_actual 
        while i + 2 < 8 && j - 2 >= 0 && m[i + 1][j - 1] == oponente
          j -= 1
          i += 1          
          if m[i + 1][j - 1] == "| |".green
            a << i + 1
            a << j - 1
            coor << a
          end
        end
      end
    end
  end
  return coor
end

#+Revisión de izquierda arriba (Diagonal)
def validacion_izquierda_arriba(m,jugador_actual)
  coor = []
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  for i in 0..m.length - 1
    for j in 0..m.length - 1
      a = []
      if m[i][j] == jugador_actual
        while i - 2 >= 0 && j - 2 >= 0 && m[i - 1][j - 1] == oponente
          j -= 1
          i -= 1
          if m[i - 1][j - 1] == "| |".green #&& j > 0
            a << i - 1
            a << j - 1
            coor << a
          end
        end
      end
    end
  end
  return coor
end

#*Sumatoria de jugadas Validas
def sumar_validas(matriz,jugador_actual)
  validas = []

  abajo = validacion_abajo(matriz,jugador_actual)
  arriba = validacion_arriba(matriz,jugador_actual)
  derecha = validacion_derecha(matriz,jugador_actual)
  izquierda = validacion_izquierda(matriz,jugador_actual)
  dere_abajo = validacion_derecha_abajo(matriz,jugador_actual)
  dere_arriba = validacion_derecha_arriba(matriz,jugador_actual)
  izq_abajo = validacion_izquierda_abajo(matriz,jugador_actual)
  izq_arriba = validacion_izquierda_arriba(matriz,jugador_actual)

  validas = (abajo + arriba + derecha + izquierda + dere_abajo + dere_arriba + izq_abajo + izq_arriba)

  return validas
end


def mover_ficha(m,validas,jugador_actual,opcion,turnos)
  flag = false
  fila = ""
  columna = ""
  if opcion == "1"
    loop do
      puts "Ingrese la fila"
      fila = gets.chomp.to_i
      puts "Ingrese la columna"
      columna = gets.chomp.to_i
      a = [fila,columna]
      for i in 0..validas.length - 1
          if validas[i] == a
            m[fila][columna] = jugador_actual
            flag = true
          end
        break if  flag == true
      end
      if flag == false
        puts "¡¡¡ Jugada no permitida, Intentelo de Nuevo !!!".red
        puts
      end
      break if flag == true
    end
  end

  if opcion == "2"
    loop do
      if turnos % 2 != 0       
        puts "Ingrese la filaxxxx"
        fila = gets.chomp.to_i
        puts "Ingrese la columna"
        columna = gets.chomp.to_i
      elsif turnos % 2 == 0  
        fila = rand(7)
        columna = rand(7)
      end
      a = [fila,columna]
      for i in 0..validas.length - 1
          if validas[i] == a
            m[fila][columna] = jugador_actual
            flag = true
          end
        break if  flag == true
      end
      if flag == false
        puts "¡¡¡ Jugada no permitida, Intentelo de Nuevo !!!".red
        puts
      end
      break if flag == true
    end
  end  
    
 
  jugadas = [fila,columna]
  return jugadas
end

def cambiar_ficha(m,jugada,jugador_actual)
  oponente = jugador_actual == "|X|".blue ? "|O|".red : "|X|".blue
  
  i = jugada[0]
  j = jugada[1]
  
  #abajo
  flag = false
  while i + 2 < 8 && m[i + 1][j] == oponente
      i += 1
    if m[i + 1][j] == jugador_actual
      flag = true
    end
    break if flag == true
  end
  i = jugada[0]
  j = jugada[1]
  while flag == true
      i += 1              
      m[i][j] = jugador_actual          
      break if m[i + 1][j] == jugador_actual             
  end 

  #arriba
  i = jugada[0]
  j = jugada[1]

   flag = false
  while i - 2 >= 0 && m[i - 1][j] == oponente
      i -= 1
    if m[i - 1][j] == jugador_actual
      flag = true
    end
    break if flag == true
  end
  i = jugada[0]
  j = jugada[1]
  while flag == true
      i -= 1              
      m[i][j] = jugador_actual          
      break if m[i - 1][j] == jugador_actual             
  end

  #derecha
  i = jugada[0]
  j = jugada[1]

  flag = false
  while j + 2 < 8 && m[i][j + 1] == oponente
    j += 1
    if m[i][j + 1] == jugador_actual
      flag = true
    end
    break if flag == true
  end
  i = jugada[0]
  j = jugada[1]
  while flag == true
      j += 1              
      m[i][j] = jugador_actual          
      break if m[i][j + 1] == jugador_actual             
  end 


  #izquierda
  i = jugada[0]
  j = jugada[1]

  flag = false
  while j - 2 < 8 && m[i][j - 1] == oponente
      j -= 1
    if m[i][j - 1] == jugador_actual
      flag = true
    end
    break if flag == true
  end
  i = jugada[0]
  j = jugada[1]
  while flag == true
      j -= 1              
      m[i][j] = jugador_actual          
      break if m[i][j - 1] == jugador_actual             
  end

  #derecha abajo
  i = jugada[0]
  j = jugada[1]

   flag = false
  while i + 2 < 8 && j + 2 < 8 && m[i + 1][j + 1] == oponente
      i += 1
      j += 1
    if m[i + 1][j + 1] == jugador_actual
      flag = true
    end
    break if flag == true
  end
  i = jugada[0]
  j = jugada[1]
  while flag == true
      i += 1
      j += 1              
      m[i][j] = jugador_actual          
      break if m[i + 1][j + 1] == jugador_actual             
  end

  #derecha arriba ******
  i = jugada[0]
  j = jugada[1]

   flag = false
  while i - 2 >= 0 && j + 2 < 8 && m[i - 1][j + 1] == oponente
      i -= 1
      j += 1
    if m[i - 1][j + 1] == jugador_actual
      flag = true
    end
    break if flag == true
  end
  i = jugada[0]
  j = jugada[1]
  while flag == true
      i -= 1
      j += 1              
      m[i][j] = jugador_actual          
      break if m[i - 1][j + 1] == jugador_actual             
  end

  #izq abajo 
  i = jugada[0]
  j = jugada[1]

   flag = false
  while i + 2 < 8 && j - 2 >= 0 && m[i + 1][j - 1] == oponente
      i += 1
      j -= 1
    if m[i + 1][j - 1] == jugador_actual
      flag = true
    end
    break if flag == true
  end
  i = jugada[0]
  j = jugada[1]
  while flag == true
      i += 1
      j -= 1              
      m[i][j] = jugador_actual          
      break if m[i + 1][j - 1] == jugador_actual             
  end

  #izq arriba 
  i = jugada[0]
  j = jugada[1]

   flag = false
  while i - 2 >= 0 && j - 2 >= 0 && m[i - 1][j - 1] == oponente
      i -= 1
      j -= 1
    if m[i - 1][j - 1] == jugador_actual
      flag = true
    end
    break if flag == true
  end
  i = jugada[0]
  j = jugada[1]
  while flag == true
      i -= 1
      j -= 1              
      m[i][j] = jugador_actual          
      break if m[i - 1][j - 1] == jugador_actual             
  end
end

def mostrar_menu
  system("clear")
  puts "===============================".red
  puts "=========== REVERSI ===========".red
  puts ""
  puts "Opciones: --------------------".blue
  puts
  puts "1.- jugar con otro Humano".green
  puts "2.- jugar con la computadora".green
  puts "s.- Salir".red
  puts
  print "Opciones: -------------------".blue
  puts
  puts

end


def main()
  matriz = []
  tablero(matriz)
  opcion = nil
  flag = false
    loop do
      mostrar_menu()
      opcion = gets.chomp.downcase
      #puts opcion
      break if opcion == "1" || opcion == "2" ||  opcion == "s"
    end
  return if opcion == "s"
  player = []
  #puntos = []
  turnos = 1
  nombres(player, opcion)
  if opcion == "1"
    jugador_1 = "Jugador 1 (X): #{player[0]}"
    jugador_2 = "Jugador 2 (O): #{player[1]}"
  else
    jugador_1 = "Jugador 1 (X): #{player[0]}"
    jugador_2 = "Jugador 2 (O): PC  "
    
  end
  loop do
    system("clear")

    pantalla(matriz,jugador_1,jugador_2,player,turnos,opcion)
    jugador_actual = turnos % 2 == 0 ? "|O|".red : "|X|".blue    
    jugador_proximo = turnos % 2 == 0 ? "|X|".blue : "|O|".red
    
    validas = sumar_validas(matriz,jugador_actual)
    validas_proximo = sumar_validas(matriz,jugador_proximo)    
    if validas != []
      a = mover_ficha(matriz, validas, jugador_actual,opcion,turnos)
      cambiar_ficha(matriz, a, jugador_actual)      
    elsif validas_proximo == []
      puts "fin del juego"
      break
    end
    turnos += 1
  end
end

main()