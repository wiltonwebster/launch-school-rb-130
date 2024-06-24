# Encrypted Pioneers

=begin 
The following list contains the names of individuals who are pioneers in the
field of computing or that have had a significant influence on the field. The 
names are in an encrypted form, though, using a simple (and incredibly weak) 
form of encryption called Rot13.
=end

def rot13(string)
  result = ''
  string.each_char do |char|
    result += encrypt(char)
  end
  result
end

def encrypt(char)
    if char =~ /[A-Ma-m]/
      (char.ord + 13).chr
    elsif char =~ /[N-Zn-z]/
      (char.ord - 13).chr
    else
      char
    end
end

p rot13('Nqn Ybirynpr')
p rot13('Tenpr Ubccre')
p rot13('Nqryr Tbyqfgvar')
p rot13('Nyna Ghevat')
p rot13('Puneyrf Onoontr')
p rot13('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p rot13('Wbua Ngnanfbss')
p rot13('Ybvf Unvog')
p rot13('Pynhqr Funaaba')
p rot13('Fgrir Wbof')
p rot13('Ovyy Tngrf')
p rot13('Gvz Orearef-Yrr')
p rot13('Fgrir Jbmavnx')
p rot13('Xbaenq Mhfr')
p rot13('Fve Nagbal Ubner')
p rot13('Zneiva Zvafxl')
p rot13('Lhxvuveb Zngfhzbgb')
p rot13('Unllvz Fybavzfxv')
p rot13('Tregehqr Oynapu')