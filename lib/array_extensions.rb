class Array
  def in_groups_of(groups_length)
    grouped = []
    interations = (self.size / groups_length.to_f).ceil
    interations.times do |i|
      start = (i*groups_length)
      finish = start+groups_length
      grouped << self[start...finish]
    end

    return grouped
  end
end