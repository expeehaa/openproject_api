RSpec.describe OpenprojectApi::ObjectifiedHash do
	let(:simple_ohash) { OpenprojectApi::ObjectifiedHash.new({abc: 5}        ) }
	let(:nested_ohash) { OpenprojectApi::ObjectifiedHash.new({a: {b: 5}}     ) }
	let(:array_ohash ) { OpenprojectApi::ObjectifiedHash.new({a: [{b: 5}, 7]}) }
	
	describe '.new' do
		it 'takes a hash as an argument' do
			expect{OpenprojectApi::ObjectifiedHash.new(1            )}.    to raise_error ArgumentError, 'Expected Hash, got 1.'
			expect{OpenprojectApi::ObjectifiedHash.new([1, 2]       )}.    to raise_error ArgumentError, 'Expected Hash, got [1, 2].'
			expect{OpenprojectApi::ObjectifiedHash.new('test'       )}.    to raise_error ArgumentError, 'Expected Hash, got "test".'
			expect{OpenprojectApi::ObjectifiedHash.new({}           )}.not_to raise_error
			expect{OpenprojectApi::ObjectifiedHash.new({'test' => 5})}.not_to raise_error
			expect{OpenprojectApi::ObjectifiedHash.new({abc: 5}     )}.not_to raise_error
		end
	end
	
	describe '#to_hash' do
		it 'returns the hash used for initialization' do
			expect(simple_ohash.to_hash).to eq({abc: 5})
			expect(nested_ohash.to_hash).to eq({a: {b: 5}})
			expect(array_ohash .to_hash).to eq({a: [{b: 5}, 7]})
		end
	end
	
	describe '#to_h' do
		it 'returns the hash used for initialization' do
			expect(simple_ohash.to_h).to eq({abc: 5})
			expect(nested_ohash.to_h).to eq({a: {b: 5}})
			expect(array_ohash .to_h).to eq({a: [{b: 5}, 7]})
		end
	end
	
	describe '#inspect' do
		it 'returns a readable string with all necessary information' do
			expect(simple_ohash.inspect).to eq "#<OpenprojectApi::ObjectifiedHash:#{simple_ohash.object_id} {hash: {:abc=>5}}>"
			expect(nested_ohash.inspect).to eq "#<OpenprojectApi::ObjectifiedHash:#{nested_ohash.object_id} {hash: {:a=>{:b=>5}}}>"
			expect(array_ohash .inspect).to eq "#<OpenprojectApi::ObjectifiedHash:#{array_ohash .object_id} {hash: {:a=>[{:b=>5}, 7]}}>"
		end
	end
	
	describe '#[]' do
		it 'returns elements of the hash' do
			expect(simple_ohash['abc']     ).to eq 5
			expect(nested_ohash['a'  ]     ).to be_an OpenprojectApi::ObjectifiedHash
			expect(nested_ohash['a'  ].to_h).to eq({b: 5})
			expect(nested_ohash['a'  ]['b']).to eq 5
			expect(array_ohash['a']        ).to be_an Array
			expect(array_ohash['a'][0]     ).to be_an OpenprojectApi::ObjectifiedHash
			expect(array_ohash['a'][0].to_h).to eq({b: 5})
			expect(array_ohash['a'][0]['b']).to eq 5
			expect(array_ohash['a'][1]     ).to eq 7
		end
	end
	
	describe '#respond_to_missing?' do
		it 'responds to keys of the hash' do
			expect(simple_ohash       ).to respond_to :abc
			expect(nested_ohash       ).to respond_to :a
			expect(nested_ohash['a']  ).to respond_to :b
			expect(array_ohash        ).to respond_to :a
			expect(array_ohash['a'][0]).to respond_to :b
		end
		
		it 'responds to methods defined on the @data Hash' do
			expect(simple_ohash.methods).not_to include :each_with_object
			expect(simple_ohash        ).    to respond_to :each_with_object
		end
		
		it 'does not respond to random other names' do
			expect(simple_ohash).not_to respond_to :abcd
		end
	end
	
	describe '#method_missing' do
		it 'returns the @data entry for method names from the hash keys' do
			expect(simple_ohash.abc      ).to eq 5
			expect(nested_ohash.a        ).to be_a OpenprojectApi::ObjectifiedHash
			expect(nested_ohash.a.to_h   ).to eq({b: 5})
			expect(nested_ohash.a.b      ).to eq 5
			expect(array_ohash .a        ).to be_an Array
			expect(array_ohash .a[0]     ).to be_an OpenprojectApi::ObjectifiedHash
			expect(array_ohash .a[0].to_h).to eq({b: 5})
			expect(array_ohash .a[0].b   ).to eq 5
			expect(array_ohash .a[1]     ).to eq 7
		end
		
		it 'forwards other missing methods to the @data Hash if it responds to them' do
			expect(simple_ohash.instance_variable_get(:@data)).to receive(:each_with_object).and_return('flying donkeys')
			
			expect(simple_ohash.methods         ).not_to include :each_with_object
			expect(simple_ohash.each_with_object).    to eq 'flying donkeys'
		end
	end
end
