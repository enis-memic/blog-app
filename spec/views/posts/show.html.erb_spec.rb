require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  it 'Render show template' do
    render template: 'posts/show'
    expect(rendered).to match(/List of post for specific user/)
  end
end
