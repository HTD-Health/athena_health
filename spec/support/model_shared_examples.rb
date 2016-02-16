shared_examples_for 'a model' do
  it 'inherits from BaseModel' do
    expect(described_class).to be < AthenaHealth::BaseModel
  end
end
