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

    def my_rotate(num = 1)
        arr = []
        self.each_with_index do |ele , i|
            new_i = (i-num) % self.length
            arr[new_i] = ele
        end
        arr
    end

    def my_join(str = "")
        new_str = ""
        self.each { |ele| new_str += ele + str }
        new_str[-1] == str ?   new_str[0...-1] : new_str
    end

    def my_reverse
        arr =[]
        self.each {|ele|   arr.unshift(ele) }
        arr
    end

end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]


