require 'rails_helper'

describe ApplicationHelper do
  it 'renders Markdown from plain text' do
    plaintext = '# Header'
    expect(markdown(plaintext)).to eq("<h1>Header</h1>\n")
  end
end
