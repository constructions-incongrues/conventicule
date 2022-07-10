bootstrap:
	npm i -g postcss postcss-cli autoprefixer

convert:
	for manifest in $$(ls content/empilement-imported/*.json); do cat $$manifest | jq '. | { date: .date, title: .title, curators: .authors, cover: "files/$${basename $$(dirname $$manifest))", tracks: .playlist | flatten | map(del(.track)) }' | jq '.' | tee ./content/empilement/$$(basename $$manifest); done