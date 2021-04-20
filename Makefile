test:
	deno test

build:
	mkdir -p dist
	deno bundle mod.ts > dist/bundle.js
	npx tsc --target es2015 --allowJs dist/bundle.js --outDir tmp
	cp tmp/bundle.js dist/esm.js
	rm -rf tmp
	npx tsc --module umd --allowJs dist/bundle.js --outDir tmp
	cp tmp/bundle.js dist/color-hash.js
	rm -rf tmp