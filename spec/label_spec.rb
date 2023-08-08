require_relative '../Classes/label'

describe Label do
  title = 'Bangladesh'
  color = 'red'
  label = Label.new(title, color)

  it 'should validate the title' do
    expect(label.title).to eq 'Bangladesh'
  end

  it 'should validate the color' do
    expect(label.color).to eq 'red'
  end
end