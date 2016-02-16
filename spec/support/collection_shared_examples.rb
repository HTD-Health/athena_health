shared_examples_for 'a collection' do
  it 'inherits from BaseCollection' do
    expect(described_class).to be < AthenaHealth::BaseCollection
  end

  it 'has totalcount Integer attribute' do
    expect(subject.totalcount).to eq 1
  end

  it 'has next String attribute' do
    expect(subject.next).to eq 'next_page_url'
  end

  it 'has previous String attribute' do
    expect(subject.previous).to eq 'previous_page_url'
  end
end
