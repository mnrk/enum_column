# EnumColumn

this module allows creating enumeration of symbols impemented as integers at the db side

assumes column_name "attribute_id"
creates two constants: Attribute_name_values and Attribute_name_ids containing id-to-value and value-to-id hashes
defines getter and setter method def attribute; and def attribute= value;


## Installation

Add this line to your application's Gemfile:

    gem 'enum_column'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enum_column

## Usage

  include EnumColumn
  enum_column("attribute", { 1 => "value1", 2 => :value2, ...})

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
