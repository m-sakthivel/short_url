class Numbergame
    def initialize
        @array = [[nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil]]
        2.times { fill }
    end

    def fill
        i, j = rand(4), rand(4)
        return fill if @array[i][j]
        @array[i][j] = [2, 2, 2, 2,4].shuffle.first
        @array[i][j]
    
    end

    def move(pos)
        @array = @array.transpose if %w[up down].include?(pos)
        @array.each(&:reverse!) if %w[right down].include?(pos)
        #p @arrray
        4.times do |i|
        a = @array[i].compact
        
        4.times { |x|  a[x], a[x + 1] = a[x] * 2, nil if a[x].to_i == a[x + 1] }
        @array[i] = a.compact.concat([ nil ] * 4)[0..3]
        end
        @array.each(&:reverse!) if %w[right down].include?(pos)
        @array = @array.transpose if %w[up down].include?(pos)
    end

    def play
        puts @array.map { |line| "[%5s]" * 4 % line }
        move({ a: 'left', s: 'down', d: 'right', w: 'up' }[gets.strip.to_sym])
        if @array.flatten.include?(2048)
          puts "you won"
        else
        if @array.flatten.include?(nil) 
        fill && play 
        else
            p "You loose! try again!!"
        end
    
        end
    end

end
 
@game = Numbergame.new.play 
