require 'byebug'


#time complexity = O(n^2)
def my_min(arr)


  arr.each do |el1|
    #assume el1 is the smallest
    smallest = true
    arr.each do |el2|
      #compare el1 and el2
      if el1 > el2
        smallest = false
      end
    end
    #return l1 if all el2s are bigger than el1
    return el1 if smallest == true
  end

end

#time complexity = 0(n)
def my_min_faster(arr)
  #keep track of smallest element
  min = arr.first
  arr.each do |el|
    #compare each element to min
    #if el < min
      #el becomes the new min
    #else if el > min, do nothing
    if el < min
      min = el
    end
  end
  min
end


def lcs(arr)
  subs = []
  (0...arr.length).each do |i1|
    subs << [arr[i1]]
    (i1 + 1...arr.length).each do |i2|
      subs << arr[i1..i2]
    end
  end
  subs
  #the above takes O(n^2) where n = arr.length

  sums = []
  subs.each do |subarray|
    sums << subarray.inject(&:+)
  end

  #the above takes O(n) where n = num subsets in arr
  #what is the correlation between array size and subset size?

  #sums is an array of sums of all subsets
  #size of sums depends on size of subsets, which dpeneds on array size
  max = sums.first
  sums.each do |el|
    if el > max
      max = el
    end
  end
  max
end


def num_subsets(arr)
  subs = []
  (0...arr.length).each do |i1|
    subs << [arr[i1]]
    (i1 + 1...arr.length).each do |i2|
      subs << arr[i1..i2]
    end
  end
  subs.length
end

def lcs_fast(arr)
  cur_sum = arr[0]
  max_sum = arr[0]
  (1...arr.length).each do |idx|
    cur_sum += arr[idx]
    if cur_sum > max_sum
      max_sum = cur_sum
    end
    if cur_sum < 0
      cur_sum = 0
    end
    if arr[idx] > max_sum
      max_sum = arr[idx]
    end
  end
  return max_sum
end
