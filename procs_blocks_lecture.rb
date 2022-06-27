require "byebug"
class Array
    def my_each_block#(&prc) # truning a block into a prc
        i = 0
        while i < self.length
            # prc.call(self[i]) # calling a prc
            yield self[i] # similar to saying prc.call, yield takes the argument you pass into it and gives them to the block
            # yield(self[i], other_args) # above uses syntactic sugar, here we can add in additional arguments
            # in an inpass use prc.call and pass in a &prc, it will be harder for people to identify that you used yield to call the bloack

            i += 1
        end
        self
    end


    def my_each_proc(prc)
        # debugger
        i = 0
        while i < self.length
            prc.call(self[i])

            i += 1
        end
        self
    end

    def my_each_proc_2(prc) # taking in a prc
        self.my_each_block(&prc) # turing a prc into a block
    end


end


arr = [1,2,3]
# arr.my_each_block {|ele| puts ele}
prc = Proc.new {|ele| puts ele }
# arr.my_each_proc(prc)
arr.my_each_proc_2(prc)