require 'ffi'

module C
  extend FFI::Library
  ffi_lib 'build/fib'

  attach_function :fib, [:long], :long
  attach_function :greet, [:string], :string
end

RSpec.describe C do
  context 'fib' do
    it 'returns the Fibonacci sequence' do
      expect(C.fib(0)).to eq 0
      expect(C.fib(1)).to eq 1
      expect(C.fib(2)).to eq 1
      expect(C.fib(3)).to eq 2
      expect(C.fib(4)).to eq 3
      expect(C.fib(5)).to eq 5
      expect(C.fib(10)).to eq 55
    end
  end

  context 'greet' do
    it 'is polite' do
      expect(C.greet('Ruby')).to eq 'Hello, Ruby!'
    end
  end
end
