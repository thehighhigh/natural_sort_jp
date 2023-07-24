# frozen_string_literal: true

require 'natural_sort_jp/element'

module NaturalSortJp
  HANKAKU_BLANK = ' '
  ZENKKAU_BLANK = '　'
  
  def self.sort(array, by: nil, desc: false)
    array = by ? self.sort_by(array, by) : array.sort_by { |x| convert(x) }
    return array.reverse if desc
    array
  end

  def self.sort_by(array, attribute)
    array.sort_by { |obj| convert(referenced_by_attribute(obj, attribute)) }
  end

  def self.convert(title)
    pos, stack, converted = 0, [], []
    while pos <= title.size do
      target = title[pos]
      case target
      when HANKAKU_BLANK
        unless stack.size == 0
          converted << Element.new(stack.join)
          stack = []
        end
        converted << Element.new(:hankaku_blank)
      when ZENKKAU_BLANK
        unless stack.size == 0
          converted << Element.new(stack.join)
          stack = []
        end
        converted << Element.new(:zenkaku_blank)
      when /[0-9０-９]/
        stack << target
      when /[^0-9０-９]/
        unless stack.size == 0
          converted << Element.new(stack.join)
          stack = []
        end
        converted << Element.new(target)
      end
      pos += 1
    end
    converted << Element.new(stack.join) unless stack.size == 0
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
