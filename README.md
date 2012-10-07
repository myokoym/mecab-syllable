# MeCab::Syllable

日本語の文章を音節で分割して扱うことができます。

使用例: 俳句や短歌の推敲として、音数を数える

## Installation

Add this line to your application's Gemfile:

    gem 'mecab-syllable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mecab-syllable

## Usage

### source code

    require 'MeCab'
    require 'mecab-syllable'

    p MeCab::Syllable.new("今日は雨").count  #=> 5

### command line

    $ mecab-syllable-count 今日は雨  #=> 5

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
