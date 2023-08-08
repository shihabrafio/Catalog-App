require_relative '../Classes/author'

describe Author do
  before :each do
    @author = Author.new('Kater', 'Amos')
  end

  it 'Checks for Author first name' do
    expect(@author.first_name).to eq('Kater')
  end

  it 'checks for Author last name' do
    expect(@author.last_name).to eq('Amos')
  end

  it 'check for Author instance' do
    expect(@author).to be_an_instance_of(Author)
  end
end