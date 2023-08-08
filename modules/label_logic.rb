require 'json'
require_relative '../Classes/label'

module LabelModule
  def load_labels
    data = []
    file = './json_files/labels.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |label|
        data.push(Label.new(label['title'], label['color']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def create_label
    data = []
    @labels.each do |label|
      data.push({ title: label.title, color: label.color })
    end
    File.write('./json_files/labels.json', JSON.pretty_generate(data))
  end
end
