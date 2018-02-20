RSpec.describe Ruboty::Handlers::Echo do
  let(:robot) do
    Ruboty::Robot.new
  end

  describe '#echo' do
    shared_examples 'echoes given message' do
      it 'echoes given message' do
        expect(robot).to receive(:say).with(
          hash_including(
            body: given_message,
          ),
        )
        robot.receive(body: "#{robot.name} echo #{given_message}")
      end
    end

    context 'without line break' do
      let(:given_message) do
        'test'
      end

      include_examples 'echoes given message'
    end

    context 'with line break' do
      let(:given_message) do
        "test\ntest"
      end

      include_examples 'echoes given message'
    end
  end

  describe '#description' do
    subject do
      action.description
    end

    let(:action) do
      Ruboty.actions.reject(&:hidden?).find { |x| x.name == 'echo' }
    end

    it 'returns the help message' do
      expect(subject).to eq('repeat your command')
    end
  end
end
