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
end
