Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "IHelpySwift"
s.summary = "IHelpySwift is a Library for Interactive Help writed in Swift."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Reinier Isalgue" => "risalgue@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/risalgue/IHelpySwift"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/risalgue/IHelpySwift.git",
:tag => "#{s.version}" }

# 7
s.framework = "UIKit"

# 8
s.source_files = "IHelpySwift/**/*.{swift}"

# 9
s.resources = "IHelpySwift/**/*.{xib}"

# 10
s.swift_version = "4.2"

end
