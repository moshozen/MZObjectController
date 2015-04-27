version = '0.0.1'

Pod::Spec.new do |s|
  s.name         = "MZObjectController"
  s.version      = version
  s.summary      = "Controller to expose KVO on a content object via a delegate"

  s.description  = <<-DESC
                   MZObjectController manages KVO on a content object, providing
                   delegate notification on various changes to the attributes of
                   the content object. Very loosely inspired by NSObjectController 
                   and NSFetchedResultsController
                   DESC

  s.homepage     = "https://github.com/moshozen/MZObjectController"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "Mat Trudel" => "mat@geeky.net" }
  s.social_media_url   = "http://twitter.com/mattrudel"

  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/moshozen/MZObjectController.git", :tag => version }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
end
