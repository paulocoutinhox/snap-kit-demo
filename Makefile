ROOT_DIR=${PWD}

.DEFAULT_GOAL := help
.PHONY: pods build

# tasks
help:
	@echo "Type: make [rule]. Available options are:"
	@echo ""
	@echo "- help"
	@echo "- clean-derived-data"
	@echo "- pods"
	@echo "- pods-update"
	@echo "- pods-remove"
	@echo "- format"
	@echo "- build"
	@echo ""

clean-derived-data:
	rm -rf ~/Library/Developer/Xcode/DerivedData

pods:
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf SnapKitDemo.xcworkspace
	pod install --no-repo-update

pods-update:
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf SnapKitDemo.xcworkspace
	pod update
	pod install --repo-update

pods-remove:
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf SnapKitDemo.xcworkspace

sdk-clear-cache:
	pod cache clean 'SnapKit' --all

format:
	# brew install swiftformat
	swiftformat --swiftversion 5.0 SnapKitDemo/

build:
	xcodebuild clean build -scheme SnapKitDemo -derivedDataPath tmp/derived-data -workspace SnapKitDemo.xcworkspace -configuration Debug -destination "platform=iOS Simulator,name=iPhone 13"
