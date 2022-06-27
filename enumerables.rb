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
        new_arr = Array.new(self.length) {Array.new(self.length)}
        self.each_with_index do |ele, j|
            new_arr[0][j] = ele
        end

        args.each_with_index do |subarr, i|
            subarr.each_with_index do |ele, j|
                new_arr[i] = ele
            end
        end
    end

    # return a new array of length self. where every subarray is composed of the elements at the same index
    #nil in where length is missing. Array new 

end



arr = [1,3,[5,7],[4,[4,6]]]
p arr.my_flatten



