# frozen_string_literal: true

module NaturalSortJp
  class Element
    include Comparable

    SORT_PRIORITY = { int: 1, str: 2 }.freeze

    def initialize(val)
      @val = zenkaku2hankaku(val)
    end

    def <=>(other)
      to_array <=> other.to_array
    end

    def to_array
      if @val =~ /^(\p{Digit}+$)/
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
