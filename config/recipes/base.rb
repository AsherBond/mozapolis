def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server, + nokogirl dependancies + imagemagick libraries. Compile Imagemagick after the packages install."
  task :install do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties"
    run "#{sudo} apt-get -y install libxslt-dev libxml2-dev libautotrace-dev libfreetype6-dev libgs-dev libjpeg62-dev liblqr-1-0-dev libpng12-dev libtiff4-dev libwmf-dev libx11-dev libxml++2.6-dev zlib1g-dev libperl-dev"
    run "#{sudo} wget http://www.imagemagick.org/download/ImageMagick.tar.gz"
    run "#{sudo} tar xvfz ImageMagick.tar.gz"
    run "cd ImageMagick-6.7.7-7 && #{sudo} ./configure && #{sudo} make"
    run "cd ImageMagick-6.7.7-7 && #{sudo} make install"
    run "#{sudo} ldconfig /usr/local/lib"

  end
end
