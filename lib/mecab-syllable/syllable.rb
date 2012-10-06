# encoding: utf-8

require 'MeCab'
require 'mecab-modern'

module MeCab
  class Node
    def part
      surface.force_encoding("UTF-8")
    end

    def kana
      feature.force_encoding("UTF-8").split(/,/)[8]
    end
  end

  class Syllable
    def initialize(text)
      @syllables = split(text)
    end

    def count
      @syllables.flatten.size
    end

    private
    def split(text)
      mecab = MeCab::Tagger.new
      nodes = mecab.parseToNode(text)
      syllables = []
      nodes.each do |node|
        part = node.part
        next if part.empty?
        kana = node.kana
        if kana
          syllables << select_syllable(kana)
        else
          syllables << select_syllable(part)
        end
      end
      syllables
    end

    def select_syllable(kana)
      hiragana_to_katakana(kana).gsub(/[^アイウエオカ-モヤユヨラ-ロワヲンヴー]/, "").split(//)
    end
  
    def hiragana_to_katakana(hiragana)
      hiragana.tr("ぁ-ゔ","ァ-ヴ")
    end
  end
end
