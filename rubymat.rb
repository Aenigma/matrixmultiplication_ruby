#! /usr/bin/env ruby
# Aenigma

def bubble_sort mat
  d1 = mat.length
  d2 = mat[0].length

  length = mat.length * mat[0].length
  
  for i in 0...length
      for j in 0...(length - 1)
          p1_1 = j / d1;  
          p1_2 = j % d1;

          p2_1 = (j + 1) / d1;  
          p2_2 = (j + 1) % d1;

          if (mat[p1_1][p1_2] > mat[p2_1][p2_2])
              mat[p1_1][p1_2], mat[p2_1][p2_2] =
                  mat[p2_1][p2_2], mat[p1_1][p1_2]
          end
      end
  end
  mat
end

def read_matrices inp_path
    m1 = nil
    m2 = nil

    File.open(inp_path) do |f|
      matlist = f.read.split  
      matlist.map! { |m| m.to_i }

      mls = matlist.each_slice(matlist.length/2).to_a
      
      m1 = mls[0].each_slice(mls[0].length/5).to_a
      m2 = mls[1].each_slice(5).to_a
    end

    return m1, m2
end

def mat_mult m1, m2
    m1.map do |m1r|
        m2.transpose.map do |m2c|
            m1r.zip(m2c).map { |a,b| a*b }.reduce :+
        end
    end
end

inp_path = "COSC450_P1_Data.txt"

m1, m2 = read_matrices inp_path
prod = mat_mult(m1, m2)

puts "Matrix 1"
p m1
puts "Matrix 2"
p m2
puts "Product Matrix"
p prod
puts "Sorted Matrix"
p bubble_sort prod
