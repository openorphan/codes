require 'chefspec'

describe 'test::default' do
let(:chef_run) {
   ChefSpec::ServerRunner.new.converge(described_recipe)
}  

it 'creates a file' do    
   expect(chef_run).to create_cookbook_file('/tmp/filetest')  
end

before do
 stub_command("grep test /etc/salt/minion").and_return(false)
end

end
