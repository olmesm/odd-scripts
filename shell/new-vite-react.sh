#!/usr/bin/env bash

# # To use 
# # curl -sL https://raw.githubusercontent.com/olmesm/odd-scripts/main/shell/new-vite-react.sh | bash -s -- <APP_NAME>

PROJECT_NAME=${1:-"."}
# FILE_LIST=(
#     "src/assets/*"
#     "public/*"
#     "src/*.css"
# )

# echo "[info] create the project"

# VITE_OUTPUT=$(yes | npm create vite@latest $PROJECT_NAME -- --template react-ts 1)

# for file in ${FILE_LIST[@]}; do
#     echo "[info] Removing $PROJECT_NAME/$file"
#     rm -rf "$PROJECT_NAME/$file"
# done

# echo "[info] loading up static files"
# wget -q -P $PROJECT_NAME/public https://ohmybuck.com/favicon.ico
# wget -q -P $PROJECT_NAME/public https://unpkg.com/@picocss/pico@latest/css/pico.min.css
# wget -q -P $PROJECT_NAME/public https://unpkg.com/@picocss/pico@latest/css/pico.min.css.map

echo "[info] cleaning remaining files"

sed -i "" -e "s/function App()/export const App = () =>/" $PROJECT_NAME/src/App.tsx
sed -i "" -e "s/ *return \((.|\s)*\)/return <>Let's go!</>/m" $PROJECT_NAME/src/App.tsx
# perl -i -pe "s|export default App||" $PROJECT_NAME/src/App.tsx
# perl -i -pe "s|import App|import { App }|" $PROJECT_NAME/src/main.tsx
# perl -i -pe "s|(\<title\>).*(<\/title\>)|\1$PROJECT_NAME\2|" $PROJECT_NAME/index.html
# perl -i -pe "s|\<link.*|<link rel=\"shortcut icon\" href=\"/favicon.ico\" type=\"image/x-icon\">|" $PROJECT_NAME/index.html
# perl -i -pe "s|(\s*)(<title>)|\1<link rel=\"stylesheet\" href=\"/pico.min.css\">\1\2|" $PROJECT_NAME/index.html

# echo "[info] adding env stuff"
# echo -n "\n.env*\n!.env.example\nenv.sample" >> $PROJECT_NAME/.gitignore

# echo "[info] creating index.css"
# touch "$PROJECT_NAME/src/index.css"

# echo "[info] done!"

# echo "$VITE_OUTPUT"
