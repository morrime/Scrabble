require_relative 'spec_helper'
require_relative '../tilebag'

describe Scrabble::TileBag do
  describe "#initialize" do
    tbag = Scrabble::TileBag.new
    it "should set up an instance with a collection of default tiles" do
      tbag.must_be_instance_of(Scrabble::TileBag)
    end

    it "should return an array of default tiles" do
      tbag.bag_of_tiles.must_be_kind_of(Array)
    end

    it "should have the correct number of tiles of each letter" do
      tbag.bag_of_tiles.count("R").must_equal(6)
    end
  end

  describe "#draw_tiles(num)" do
    num = 3
    tbag = Scrabble::TileBag.new

    it "should return (num) number of random tiles" do
      tbag.draw_tiles(num).length.must_equal(num)
    end

    it "should remove (num) number of tiles from the default set" do
      tbag2 = Scrabble::TileBag.new
      original_num_tiles = tbag2.bag_of_tiles.length

      tbag2.draw_tiles(num)
      tbag2.bag_of_tiles.length.must_equal(original_num_tiles - num)
    end

    it "should remove the same letter tiles from the default set that were drawn" do 
      tbag3 = Scrabble::TileBag.new
      tbag5 = Scrabble::TileBag.new
      letters_drawn = tbag3.draw_tiles(1)
      letter_to_string = letters_drawn[0]
      tbag3.bag_of_tiles.count(letter_to_string).must_equal(tbag5.bag_of_tiles.count(letter_to_string) - 1)

      #### THIS WORKS TOO, BUT IS CONFUSING??
      # tbag3 = Scrabble::TileBag.new
      # letters_drawn = tbag3.draw_tiles(1)
      # letter_to_string = letters_drawn[0]
      #
      # compare_letter_value = Scrabble::TileBag::LETTER_DISTRIBUTION[letter_to_string.to_sym] - 1
      # tbag3.bag_of_tiles.count(letter_to_string).must_equal(compare_letter_value)
    end
  end

  describe "#tiles_remaining" do
    it "should return the number of tiles remaining" do
      tbag4 = Scrabble::TileBag.new
      tbag4.draw_tiles(4)
      tbag4.draw_tiles(2)
      tbag4.draw_tiles(5)
      tbag4.tiles_remaining.must_equal(98-4-2-5)
    end
  end
  #tiles_remaining returns the number of tiles remaining in the bag


end
