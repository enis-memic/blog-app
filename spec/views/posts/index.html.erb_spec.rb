require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  it 'Render index template' do 
    render template: 'posts/index'
    expect(rendered).to match(/List of all posts given by a user/)
  end
end
