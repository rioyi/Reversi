
m = [[1,2],[3,2]]

print m
puts 

puts "Ingrese una fila"
fila = gets.chomp.to_i

puts "Ingrese una columna"
columna = gets.chomp.to_i

a = [fila, columna]
flag = false
for i in 0..m.length - 1
	if m[i] == a
		puts "cool"
		flag = true
	else
		puts "chimbo pues"
	end
	break if flag == true
end


=begin

m = []

for i in 0..5
	a = []
	for j in 0..5
		a << rand(9) + 1
	end
	m << a
end


def imprimir(m)
	for i in 0..m.length - 1
		print m[i]
		puts
	end
end

def recorrido(m)
	for i in 0..m.length - 1
		for j in 0..m.length - 1

			while condition
				
			end
			puts m[i][j - 1] 

			gets		
		end
	end
end


imprimir(m)

puts

recorrido(m)


m = [[0,0,0,0],[0,1,0,0],[0,0,0,0],[0,0,1,0]]
coor = [] 

def imprimir(m)
	for i in 0..m.length - 1
		print m[i]
		puts
	end	
end



def valida(m)
coor = []

	for i in 0..m.length - 1
				
		for j in 0..m.length - 1
			a = []			
			 if m[j][i] == 1
				a << i
				a << j
				coor << a
			 end

		end		
	end
	return coor
end

imprimir(m)

print valida(m)
puts

imprimir(m)

print valida(m)
puts

=end


