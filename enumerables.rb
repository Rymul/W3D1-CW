require "byebug"
class Array
    def my_each(&prc)
        i = 0
        arr =[]
        while i < self.length
            arr << prc.call(self[i])    
            i += 1
        end
        arr
    end

    def my_select(&blk)    
        i = 0
        arr =[]
        bools = self.my_each(&blk)
        while i < self.length                            #  [true, true, false false, true] [1,2,3,4,5]
            if bools[i] == true
                arr << self[i]
            end
            i += 1
        end
        arr
    end

    def my_reject(&prc)
        i = 0
        arr =[]
        bools = self.my_each(&prc)
        while i < self.length 
            if bools[i] == false                    
                arr << self[i]
            end
            i += 1
        end
        arr
    end

    def my_any?(&blk)
        i = 0
        arr =[]
        bools = self.my_each(&blk)
        while i < self.length                            #  [true, true, false false, true] [1,2,3,4,5]
            if bools[i] == true
                arr << self[i]
            end
            i += 1
        end
        arr.length > 0
    end

    def my_all?(&blk)
         i = 0
        arr =[]
        bools = self.my_each(&blk)
        while i < self.length                            #  [true, true, false false, true] [1,2,3,4,5]
            if bools[i] == true
                arr << self[i]
            end
            i += 1
        end
        arr.length == self.length
    end

    def my_flatten(arr)
        new_arr = []
        return [arr] if !arr.is_a?(Array)  
             arr.each do |subarr|
                 new_arr += my_flatten(subarr)
             end
        return new_arr
    end

    def my_zip(*args)
        hash = Hash.new { |hash, key| hash[key] = [] }
        self.each_with_index { |ele, i| hash[i] << ele }

        args.each do |subarr|
            (0...self.length).each { |i| hash[i] << subarr[i] }
        end

        hash.values
    end
end


# Examples

# arr = [1,2,3,4]


# arr = [1,3,[5,7],[4,[4,6]]]
# p arr.my_flatten

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)


