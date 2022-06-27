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

    


end

arr = [1,2,3,4,5]
p arr.my_any? {|ele| ele % 2 != 0}

