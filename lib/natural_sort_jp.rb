# frozen_string_literal: true

require 'natural_sort_jp/element'

module NaturalSortJp
  
  def self.sort(array, by: nil, desc: false)
    array = by ? self.sort_by(array, by) : array.sort_by { |x| convert(x) }
    return array.reverse if desc
    array
  end

  def self.sort_by(array, attribute)
    array.sort_by { |obj| convert(referenced_by_attribute(obj, attribute)) }
  end

  def self.convert(title)
    elements = title.to_s.scan(/([^0-9０-９]*)([0-9０-９]*)/).flatten
    converted = []
    elements.each do |t|
      next if t.empty?
      converted << Element.new(t)
    end
    converted
  end

  def self.referenced_by_attribute(obj, attribute)
    if obj.class == Hash
      obj[attribute]
    else
      obj.send(attribute)
    end
  end
end
