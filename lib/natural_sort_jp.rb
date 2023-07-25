# frozen_string_literal: true

require 'natural_sort_jp/element'

module NaturalSortJp
  HANKAKU_BLANK = ' '
  ZENKKAU_BLANK = '　'

  def self.sort(array, by: nil, desc: false)
    array = by ? sort_by(array, by) : array.sort_by { |x| convert(x) }
    return array.reverse if desc

    array
  end

  def self.sort_by(array, attribute)
    array.sort_by { |obj| convert(referenced_by_attribute(obj, attribute)) }
  end

  def self.convert(title)
    pos = 0
    blank_hash = {}
    int_stack = []
    converted = []
    while pos <= title.size
      target = title[pos]
      case target
      when HANKAKU_BLANK
        unless int_stack.empty?
          converted << Element.new(int_stack.join)
          int_stack = []
        end
        blank_hash[:hankaku_blank] ||= 0
        blank_hash[:hankaku_blank] += 1
      when ZENKKAU_BLANK
        unless int_stack.empty?
          converted << Element.new(int_stack.join)
          int_stack = []
        end
        blank_hash[:zenkaku_blank] ||= 0
        blank_hash[:zenkaku_blank] += 1
      when /[0-9０-９]/
        unless blank_hash.empty?
          if blank_hash[:zenkaku_blank] && blank_hash[:hankaku_blank]
            converted << Element.new([:blank_mix, blank_hash[:zenkaku_blank] + blank_hash[:hankaku_blank]])
          elsif blank_hash[:zenkaku_blank]
            converted << Element.new([:zenkaku_blank, blank_hash[:zenkaku_blank]])
          elsif blank_hash[:hankaku_blank]
            converted << Element.new([:hankaku_blank, blank_hash[:hankaku_blank]])
          end
          blank_hash = {}
        end
        int_stack << target
      when /[^0-9０-９]/
        unless blank_hash.empty?
          if blank_hash[:zenkaku_blank] && blank_hash[:hankaku_blank]
            converted << Element.new([:blank_mix, blank_hash[:zenkaku_blank] + blank_hash[:hankaku_blank]])
          elsif blank_hash[:zenkaku_blank]
            converted << Element.new([:zenkaku_blank, blank_hash[:zenkaku_blank]])
          elsif blank_hash[:hankaku_blank]
            converted << Element.new([:hankaku_blank, blank_hash[:hankaku_blank]])
          end
          blank_hash = {}
        end
        unless int_stack.empty?
          converted << Element.new(int_stack.join)
          int_stack = []
        end
        converted << Element.new(target)
      end
      pos += 1
    end
    converted << Element.new(int_stack.join) unless int_stack.empty?
    converted
  end

  def self.referenced_by_attribute(obj, attribute)
    if obj.instance_of?(Hash)
      obj[attribute]
    else
      obj.send(attribute)
    end
  end
end
