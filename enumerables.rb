module Enumerable

	def my_each
		c = 0
		while c < size
			yield self[c]
			c += 1
		end
		self
	end

	def my_each_with_index
		c = 0
		while c < size
			yield self[c], c
			c += 1
		end
		self		
	end

	def my_select
		acc = []
		self.my_each { |x| acc.push(x) if yield x }
		acc
	end

	def my_all?
		answer = true
		self.my_each { |x| answer = false unless yield(x) }
		answer
	end

	def my_any?
		any = false
		self.my_each { |x| any = true if yield(x) }
		any
	end

	def my_none?
		none = true
		self.my_each { |x| none = false if yield(x) }
		none
	end

	def my_count
		count = 1
		self.my_each do |x|
			count += 1
		end
		count
	end

	def my_map
		acc = []
		self.my_each do |x|
			key = yield x
			acc << key
		end
		acc
	end

	def my_inject(acc = self[0])
		self.my_each do |x|
			acc = yield acc, x
		end
		acc
	end

	def multiply_els
		self.my_inject(1) { |x, y| x * y }
	end

end