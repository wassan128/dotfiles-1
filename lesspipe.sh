#! /bin/sh

for source in "$@"; do
    case $source in
    *ChangeLog|*changelog) 
        source-highlight -n --failsafe -f esc --lang-def=changelog.lang --style-file=esc.style -i "$source" ;;
    *Makefile|*makefile) 
        source-highlight -n --failsafe -f esc --lang-def=makefile.lang --style-file=esc.style -i "$source" ;;
    *)
        export BASENAME=`basename ${source}`
        export TEMPORARY_FILE="/tmp/${BASENAME}.$$.${BASENAME#*.}"
        lesspipe.sh ${source} 2>&1 > ${TEMPORARY_FILE}

        if test ! -s ${TEMPORARY_FILE}; then
            cp ${source} ${TEMPORARY_FILE}
        fi

        FILEEXT=`${HOME}/dotfiles/get_ext ${TEMPORARY_FILE} 2>/dev/null`
        if test $? -eq 0; then
            mv ${TEMPORARY_FILE} ${TEMPORARY_FILE}.${FILEEXT}
            source-highlight -n --failsafe --infer-lang -f esc --style-file=esc.style -i ${TEMPORARY_FILE}.${FILEEXT}
            mv ${TEMPORARY_FILE}.${FILEEXT} ${TEMPORARY_FILE} 
        else
            source-highlight -n --failsafe --infer-lang -f esc --style-file=esc.style -i ${TEMPORARY_FILE}
        fi
        rm -f ${TEMPORARY_FILE};;
    esac
done
