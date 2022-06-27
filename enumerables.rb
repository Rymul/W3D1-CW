require "byebug"
class Array
    def my_each(&prc)
        i = 0
        # debugger
        while i < self.length
            self[i] = prc.call(self[i])
            i += 1
        end
        self
    end



end



arr = [1,2,3]
p arr.my_each {|ele| ele * 2}

