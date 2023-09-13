module Enumerable
  def my_each
    for element in self
      yield element
    end
  end

  def my_each_with_index
    index = 0
    for element in self
      yield element, index
      index += 1
    end
  end

  def my_select
    result = []
    for element in self
      result << element if yield element
    end
    result
  end

  def my_all?
    for element in self
      return false unless yield element
    end
    true
  end

  def my_any?
    for element in self
      return true if yield element
    end
    false
  end

  def my_none?
    for element in self
      return false if yield element
    end
    true
  end

  def my_count
    counter = 0
    if block_given?
      for element in self
        counter += 1 if yield element
      end
    else
      for element in self
        counter += 1
      end
    end
    counter
  end

  def my_map
    result = []
    for element in self
      result << yield(element)
    end
    result
  end

  def my_inject(result = nil)
    for element in self
      result = yield result, element
    end
    result
  end
end
