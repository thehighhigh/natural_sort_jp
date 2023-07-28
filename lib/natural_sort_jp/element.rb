# frozen_string_literal: true

module NaturalSortJp
  class Element
    include Comparable

    SPECIFIC_SYMBOLS_REGEXP = %r{(_|-|,|;|:|!|\?|\.|'|"|\(|\)|@|\*|/|\\|&|#|%|`|\^|<|>|\||~|\$)}.freeze
    SORT_PRIORITY = { blank: 1, specific_symbol: 2, int: 3, str: 4 }.freeze
    BLANK_SORT_PRIORITY = { hankaku: 1, zenkaku: 2, mix: 3 }.freeze
    SPECIFIC_SYMBOLS_PRIORITY = {
      '_' => 1,
      '-' => 2,
      ',' => 3,
      ';' => 4,
      ':' => 5,
      '!' => 6,
      '?' => 7,
      '.' => 8,
      "'" => 9,
      '"' => 10,
      '(' => 11,
      ')' => 12,
      '@' => 13,
      '*' => 14,
      '/' => 15,
      '\\' => 16,
      '&' => 17,
      '#' => 18,
      '%' => 19,
      '`' => 20,
      '^' => 21,
      '<' => 22,
      '>' => 23,
      '|' => 24,
      '~' => 25,
      '$' => 26
    }.freeze

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
      when SPECIFIC_SYMBOLS_REGEXP
        [SORT_PRIORITY[:specific_symbol], SPECIFIC_SYMBOLS_PRIORITY[@val]]
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
      val = tr_specific_symbols(val)
      val
    end

    def tr_specific_symbols(val)
      replace_table = {
        '＿' => '_',
        'ー' => '-',
        '、' => ',',
        '；' => ';',
        '：' => ':',
        '！' => '!',
        '？' => '?',
        '。' => '.',
        '’' => "'",
        '”' => '"',
        '（' => '(',
        '）' => ')',
        '＠' => '@',
        '＊' => '*',
        '・' => '/',
        '￥' => '\\',
        '＆' => '&',
        '＃' => '#',
        '％' => '%',
        '｀' => '`',
        '＾' => '^',
        '＜' => '<',
        '＞' => '>',
        '｜' => '|',
        '〜' => '~',
        '＄' => '$'
      }
      replace_table[val] || val
    end
  end
end
