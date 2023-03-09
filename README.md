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


# It can also be used in hashes, structures, and active record data structures.

NaturalSortJp.sort(
  [
    { id: 1, date: '2022/1/1'},
    { id: 2, date: '２０２２/０１/１０'},
    { id: 3, date: '2022/01/03'},
    { id: 4, date: '２０２２/１/2'},
    { id: 5, date: '2023/1/1'}
  ], by: :date)
# => [
  {:id=>1, :date=>"2022/1/1"},
  {:id=>4, :date=>"２０２２/１/2"},
  {:id=>3, :date=>"2022/01/03"},
  {:id=>2, :date=>"２０２２/０１/１０"},
  {:id=>5, :date=>"2023/1/1"}
  ]

# and can use asc or desc option. 

NaturalSortJp.sort(
  [
    { id: 1, date: '2022/1/1'},
    { id: 2, date: '２０２２/０１/１０'},
    { id: 3, date: '2022/01/03'},
    { id: 4, date: '２０２２/１/2'},
    { id: 5, date: '2023/1/1'}
  ], by: :date, desc: true)
 # => [
 {:id=>5, :date=>"2023/1/1"},                   
 {:id=>2, :date=>"２０２２/０１/１０"},         
 {:id=>3, :date=>"2022/01/03"},                 
 {:id=>4, :date=>"２０２２/１/2"},              
 {:id=>1, :date=>"2022/1/1"}
 ]

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thehighhigh/natural_sort_jp.

## License

The gem is available as open source under the terms of the MIT License.
