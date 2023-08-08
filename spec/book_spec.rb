require_relative '../Classes/book'

describe Book do
  author = 'Rafio'
  publish_date = '1954-07-29'
  publisher = 'Gakii'
  cover_state = 'bad'
  book = Book.new(author, publisher, cover_state, publish_date)

  it 'should validate the book.author value' do
    expect(book.author).to eq 'Rafio'
  end

  it 'should validate the book.publish_date value' do
    expect(book.publish_date).to eq '1954-07-29'
  end

  it 'should validate the book.publisher value' do
    expect(book.publisher).to eq 'Gakii'
  end

  it 'should validate the book.cover_state value' do
    expect(book.cover_state).to eq 'bad'
  end

  it 'should validate can_be_archived method to true for bad and or more than ten years' do
    expect(book.can_be_archived?).to eq true
  end

  #   it 'should validate can_be_archived method to false for good and  less than ten years' do
  #     book.cover_state = 'good'
  #     book.publish_date = '2022-02-30'
  #     expect(book.can_be_archived?).to eq false
  #   end
end
