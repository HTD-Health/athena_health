shared_examples_for 'a collection' do
  it 'inherits from BaseCollection' do
    expect(described_class).to be < AthenaHealth::BaseCollection
  end

  it 'has pagination details' do
    expect(subject).to have_attributes(
      next: 'next_page_url',
      previous: 'previous_page_url',
      totalcount: 1
    )
  end
end
