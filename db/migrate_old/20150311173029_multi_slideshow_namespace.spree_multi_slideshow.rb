# This migration comes from spree_multi_slideshow (originally 20120323164044)
class MultiSlideshowNamespace < ActiveRecord::Migration
  def change
    rename_table :slideshows, :spree_slideshows
    rename_table :slides, :spree_slides
  end
end
