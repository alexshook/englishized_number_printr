require_relative 'englishizer'

options = {
  tailcall_optimization: true,
  trace_instruction: false
}

enable_tail_call = 
  RubyVM::InstructionSequence.compile_file('englishizer.rb', options = options)

enable_tail_call.eval

Englishizer.new.englishize
