namespace :dev do
  desc "Reset database"
  task reset: :environment do

    if Rails.env.development?
      show_spinner("Dropping DB...") {%x(rails db:drop)}
    
      show_spinner("Creating DB...") {%x(rails db:create)}

      show_spinner("Migrating DB...") {%x(rails db:migrate)}
      
      show_spinner("Seeding DB...") {%x(rails db:migrate)}

    else
      puts "Not on the development environment!"
    end
  end

  private

  def show_spinner(start_text)
    spinner = TTY::Spinner.new("[:spinner] #{start_text}")
    spinner.auto_spin
    yield
    spinner.success("(Successful!)")
  end

end