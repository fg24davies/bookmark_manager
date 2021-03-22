require './lib/bookmark.rb'

describe Bookmark do 

it '#all' do 
    expect(subject.all).to eq(['https://pomofocus.io/', 'https://github.com/makersacademy/course/blob/master/week_outlines.md', 'https://httpstatusdogs.com/'])
  end 

end 
