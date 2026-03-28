FW_FILE_NAME="$(find padavan-ng-hadzhioglu/trunk/images -type f -regextype posix-extended -iregex ".*\.(trx|bin)$" \
                        -printf "%T@\t%f\n" | sort -V | tail -1 | cut -f2)"
cp "padavan-ng-hadzhioglu/trunk/images/$FW_FILE_NAME" .
echo "FW_FILE_NAME=$FW_FILE_NAME" >> $GITHUB_ENV
stat "padavan-ng-hadzhioglu/trunk/images/$FW_FILE_NAME"
