require 'spec_helper'

# ユーザーが作成されているか
# ユーザー名にChefのattribute使いたい
describe command('mysqlshow -u dev_user --password=develop_password') do
  its(:stdout) { should match /Databases/ }
  its(:stdout) { should match /development/ }
end
