# encoding: utf-8

require 'MeCab'

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
      node = mecab.parseToNode(text)
      syllables = []
      while node
        part = node.part
        unless part.empty?
          kana = node.kana
          if kana
            syllables << select_syllable(kana)
          else
            syllables << select_syllable(part)
          end
        end
        node = node.next
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
