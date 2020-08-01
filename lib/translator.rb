# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  emoticons.each do |english_word, emoticon_set|
    emoticon_hash[english_word] = {}
    emoticon_hash[english_word][:english] = emoticon_set.first
    emoticon_hash[english_word][:japanese] = emoticon_set.last
  end
  emoticon_hash
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  emoticon_hash.each do |feeling, expression|
    # binding.pry
    if "emoticon" == emoticon_hash[feeling][:japanese]
      return emoticon_hash[feeling][:english]
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  # binding.pry
  emoticon_hash.each do |feeling, expression|
    # binding.pry
    if emoticon == emoticon_hash[feeling][:english]
      # binding.pry
      return emoticon_hash[feeling][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end
