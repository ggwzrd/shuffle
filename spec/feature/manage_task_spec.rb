require 'rails_helper'

describe "User experice" do

  context 'Visit artist page' do
    let(:artist) {create :artist}

    it 'should show artist songs' do
      # Point your browser towards the artists path
      visit root_path
      click_link('show-profile')
      # Expect the new task to be displayed in the list of tasks
      expect(page).to have_content(artist.name)
    end
  end
end

# If `:from` option is present, `select` finds a select box on the page
# and selects a particular option from it.
# Otherwise it finds an option inside current scope and selects it.
# If the select box is a multiple select, +select+ can be called multiple times to select more than
# one option.
# The select box can be found via its name, id or label text. The option can be found by its text.
#
#     page.select 'March', :from => 'Month'


def select(value, options={})
    if options.has_key?(:from)
      from = options.delete(:from)
      find(:select, from, options).find(:option, value, options).select_option
    else
      find(:option, value, options).select_option
    end
end
