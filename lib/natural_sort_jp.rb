# frozen_string_literal: true

require 'natural_sort_jp/element'

module NaturalSortJp
  
  def self.sort(array)
    array.sort_by { |x| convert(x) }
  end

  def self.convert(title)
    elements = title.to_s.gsub(/[0-9０-９]+/, ',\&,').split(',')
    elements.map { |t| Element.new(t) }
  end
end
