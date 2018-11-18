## Install Dependencies

This instruction is only for Mac OSX users. If you are not a Mac user, please refer to this page https://www.ruby-lang.org/en/documentation/installation/#rubyinstaller and follow the instructions for your specific OS.

To be able to run Ruby code on your local machine, make sure you have the following dependencies installed. All steps are finished in terminal. You can always verify first, then do installation as needed. This instruction is based on Environment Setup in Ada’s Jump Start curriculum. If you run into any trouble or have any questions during installation, please refer to Ada’s github repo for troubleshooting: https://github.com/Ada-Developers-Academy/jump-start/tree/master/preparing-to-code/environment-setup and  https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/what-is-ruby-on-rails.md

### Xcode Command-Line tools

To install, run: `xcode-select --install`. Follow the instructions and wait for the installation to finish. 

To verify, run: `xcode-select -p`. It should respond with something very similar to /Library/Developer/CommandLineTools (the directory where they were installed).

### Homebrew Package Manager

To install, run: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

To verify, run: `brew doctor`

### RVM (Ruby Version Manager)

To install, run: `\curl -sSL https://get.rvm.io | bash -s stable`. When it's done, close your terminal and then reopen it. 

To verify, run: `rvm -v`

### Ruby

To install, run: `rvm install 2.5.3`

To verify, run: `ruby -v`

### Rails

To install, run: `gem install rails --no-rdoc --no-ri`

To verify, run: `rails -v`

## Project Setup
In terminal, follow this steps to setup the project

1. `git clone https://github.com/choricao/drop_token.git`
2. `cd drop_token`
3. `rails db:create`
4. `rails db:migrate`
5. `rails db:seed`
6. `rails s`

## Test Out

URL: localhost:3000
