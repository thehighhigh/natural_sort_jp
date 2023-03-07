# NaturalSortJp

**natural_sort_jp** can discriminate between full-width and half-width characters (zenkaku and hankaku), which are unique to the Japanese language, and perform natural sorting.

By using this gem, you can realize the special sorting (natural sort) used in file explorers such as google drive.

## Installation

```
$ gem install natural_sort_jp
```

## Usage

```ruby
require 'natural_sort_jp'

# Can use natural sort even if mix of zenkaku and hankaku number.

NaturalSortJp.sort(
  ["第1回", "第２回", "第３回", "第10回", "第２０回", "第２１回"]
  )
# => ["第1回", "第２回", "第３回", "第10回", "第２０回", "第２１回"]


# even if mix of zenkaku and hankaku alphabet.

NaturalSortJp.sort(["a11", "a2", "ａ1０", "ａ１"])
# => ["ａ１", "a2", "ａ1０", "a11"]


# It is not affected by the presence or absence of 0-filling.

NaturalSortJp.sort(
  ["2022/1/1", "２０２２/０１/０２", "2022/01/03", "２０２２/１/１０", "2023/1/1"]
  )
# => ["2022/1/1", "２０２２/０１/０２", "2022/01/03", "２０２２/１/１０", "2023/1/1"]

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thehighhigh/natural_sort_jp.
