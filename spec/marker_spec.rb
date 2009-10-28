require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe GoogleStaticMapsHelper::Marker do
  before :each do
    @location_hash = {:lat => 10, :lng => 20}
    @location_object = mock(:location, @location_hash)
  end
  
  describe "initialize" do
    it "should raise ArgumentError if no arguments are given" do
      lambda {GoogleStaticMapsHelper::Marker.new}.should raise_error(ArgumentError)
    end

    describe "get location as object" do
      [:lat, :lng].each do |location_property|
        it "should extract #{location_property} from first argument if that is object" do
          marker = GoogleStaticMapsHelper::Marker.new(@location_object)
          marker.send(location_property).should == @location_object.send(location_property)
        end
      end

      it "should raise NoLngMethod if object doesn't respond to lng" do
        lambda {GoogleStaticMapsHelper::Marker.new(mock(:location, :lat => 10))}.should raise_error(GoogleStaticMapsHelper::Location::NoLngMethod)
      end

      it "should raise NoLatMethod if object doesn't respond to lat" do
        lambda {GoogleStaticMapsHelper::Marker.new(mock(:location, :lng => 20))}.should raise_error(GoogleStaticMapsHelper::Location::NoLatMethod)
      end
    end

    describe "get location from hash" do
      [:lat, :lng].each do |location_property|
        it "should extract #{location_property} from hash" do
          marker = GoogleStaticMapsHelper::Marker.new(@location_hash)
          marker.send(location_property).should == @location_object.send(location_property)
        end
      end
      
      it "should raise NoLngKey if hash doesn't have key lng" do
        lambda {GoogleStaticMapsHelper::Marker.new(:lat => 10)}.should raise_error(GoogleStaticMapsHelper::Location::NoLngKey)
      end

      it "should raise NoLatKey if hash doesn't have key lat" do
        lambda {GoogleStaticMapsHelper::Marker.new(:lng => 20)}.should raise_error(GoogleStaticMapsHelper::Location::NoLatKey)
      end
    end


    describe "options" do
      describe "defaults" do
        it "should have a predefined color which location should use" do
          marker = GoogleStaticMapsHelper::Marker.new(@location_object)
          marker.color.should == 'red'
        end

        it "should have a predefined size" do
          marker = GoogleStaticMapsHelper::Marker.new(@location_object)
          marker.size.should == 'mid'
        end

        it "should have a predefined label which should be nil" do
          marker = GoogleStaticMapsHelper::Marker.new(@location_object)
          marker.label.should be_nil
        end
      end

      describe "override options as second parameters, location given as object as first param" do
        {:color => 'blue', :size => 'small', :label => 'A'}.each_pair do |key, value|
          it "should be possible to override #{key} to #{value}" do
            marker = GoogleStaticMapsHelper::Marker.new(@location_object, {key => value})
            marker.send(key).should == value
          end
        end
      end

      describe "override options as first parameter, location mixed into the same hash" do
        {:color => 'blue', :size => 'small', :label => 'A'}.each_pair do |key, value|
          it "should be possible to override #{key} to #{value}" do
            marker = GoogleStaticMapsHelper::Marker.new(@location_hash.merge({key => value}))
            marker.send(key).should == value
          end
        end
      end
    end

    it "should raise OptionNotExist if incomming option doesn't exists" do
      lambda {GoogleStaticMapsHelper::Marker.new(:lng => 1, :lat => 2, :invalid_option => 'error?')}.should raise_error(GoogleStaticMapsHelper::OptionNotExist)
    end
  end
  


  it "should upcase the label" do
    GoogleStaticMapsHelper::Marker.new(@location_hash.merge(:label => 'a')).label.should == 'A'
  end

  it "should downcase the color" do
    GoogleStaticMapsHelper::Marker.new(@location_hash.merge(:color => 'Green')).color.should == 'green'
  end


  describe "generating url parameters" do
    before :each do
      @options = {:lat => 1, :lng => 2, :color => 'Green', :label => :a, :size => 'small'}
      @marker = GoogleStaticMapsHelper::Marker.new(@options)
    end

    it "should contain color param" do
      @marker.options_to_url_params.should include('color:green')
    end

    it "should contain label param" do
      @marker.options_to_url_params.should include('label:A')
    end

    it "should contain size param" do
      @marker.options_to_url_params.should include('size:small')
    end

    it "should not contain label param if it is nil" do
      marker = GoogleStaticMapsHelper::Marker.new(:lat => 1, :lng => 1)
      marker.options_to_url_params.should_not include('label')
    end

    it "should build location_to_url" do
      @marker.location_to_url.should == '1,2'
    end
  end
end
