m = [[0,0,0,0],[0,1,0,0],[0,0,0,0],[1,0,0,0]]
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
