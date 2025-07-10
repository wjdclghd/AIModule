Pod::Spec.new do |spec|

  spec.name          = "AIModule"
  spec.version       = "1.0.0"
  spec.summary       = "AIModule: AI 공통 모듈"
  spec.description   = "ChatGPT, Meta AI, Apple Intelligence 활용"
  spec.homepage      = "https://your-company-private-repo/AIModule"
  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "jch" => "ba2328@gmail.com" }
  spec.platform      = :ios, "16.0"
  spec.swift_version = "5.9"

  spec.source        = { :path => "." }
  
  spec.subspec 'ChatGPTAPI' do |ChatGPT|
    
    realm.source_files = 'Sources/AIModule/Feature/ChatGPTAPI/**/*'
    realm.resources = []
    #realm.dependency ''

  end

  spec.exclude_files = 'Tests/**/*'
  
end
