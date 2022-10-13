
generate-changelog:
	./scripts/generate-changelog.sh

generate-changelog-ci:
	touch CHANGELOG.md CHANGELOG.LATEST.md \
	&& \
	./scripts/generate-changelog.sh \
	-u --prepend=CHANGELOG.md \
	--include-path "*.go" \
	--include-path "*.mod" \
	--include-path "*Dockerfile" \
	&& \
	./scripts/generate-changelog.sh \
	-u --output=CHANGELOG.LATEST.md \
	--include-path "*.go" \
	--include-path "*.mod" \
	--include-path "*Dockerfile"
