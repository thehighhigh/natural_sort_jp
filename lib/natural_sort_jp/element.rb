# frozen_string_literal: true

module NaturalSortJp
  class Element
    include Comparable

    SORT_PRIORITY = { blank: 1, int: 2, str: 3 }.freeze
    BLANK_SORT_PRIORITY = { hankaku: 1, zenkaku: 2, mix: 3 }.freeze

    def initialize(val)
      @val = (val.is_a? Array) ? val : zenkaku2hankaku(val)
    end

    def <=>(other)
      to_array <=> other.to_array
    end

    def to_array
      case @val[0]
      when :zenkaku_blank
        [SORT_PRIORITY[:blank], @val[1] * -1, BLANK_SORT_PRIORITY[:zenkaku]]
      when :hankaku_blank
        [SORT_PRIORITY[:blank], @val[1] * -1, BLANK_SORT_PRIORITY[:hankaku]]
      when :blank_mix
        [SORT_PRIORITY[:blank], @val[1] * -1, BLANK_SORT_PRIORITY[:mix]]
      when /^(\p{Digit}+$)/
        [SORT_PRIORITY[:int], @val.to_i]
      else
        [SORT_PRIORITY[:str], @val]
      end
    end

    private

    def zenkaku2hankaku(val)
      val.tr!('０-９', '0-9') if val =~ /[０-９]/
      val.tr!('ａ-ｚ', 'a-z') if val =~ /[ａ-ｚ]/
      val.tr!('Ａ-Ｚ', 'A-Z') if val =~ /[Ａ-Ｚ]/
      val
    end
  end
end
