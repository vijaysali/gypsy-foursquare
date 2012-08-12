class GypsySquareController < ApplicationController
  before_filter :require_user
  def index
  require 'json'
     hs=Hash.new
     current_user.checkins.each do |checkin|
                checkin.venue.categories.each do |cat|
                  cat['id']
                  if hs.has_key?(cat['id'])
                    val=hs[cat['id']]
                    hs[cat['id']]= val+1
                  else
                    hs[cat['id']]=1
                  end
                end
       end
     hs1=hs.sort_by {|k,v| v}.reverse
     cat_id=compare(hs1)
  @v = foursquare.venues.search(:ll => "12.97,77.59" , :categoryId => cat_id.to_s)      
      puts @v.class
      @v.each do |k,v|
           puts "#{k}...."
            v.each do |obj1|

                  @result ="#{obj1.location.lat},#{obj1.location.lng}"
                  puts "#{obj1.location.lat},#{obj1.location.lng}"
            end
      end
      end



      def compare(arr)
        x=[]
        arr.each do |i|
          x << i[0]
        end
        return x.first(5).join(",")
      end
      
end
