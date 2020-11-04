# free.keep.sh Easy file sharing from the command line
# keep Plugin
# Usage Example :
# > keep file.txt
# > keep directory/



# Author:
#   Federico Torrielli <evilscript@protonmail.com>
#   Modified to use tar command instead of zip
#

curl --version 2>&1 > /dev/null
if [ $? -ne 0 ]; then
  echo "Could not find curl."
  return 1
fi

keep() { 
    # check arguments
    if [ $# -eq 0 ]; 
    then 
        echo "No arguments specified. Usage:\necho keep /tmp/test.md\ncat /tmp/test.md | keep test.md"
        return 1
    fi

    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t keepXXX )
    
    # upload stdin or file
    file=$1

    if tty -s; 
    then 
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g') 

        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi
        
        if [ -d $file ];
        then
            echo $file
            # tar directory and transfer
            tarfile=$( mktemp -t keepXXX.tar.gz )
            cd $(dirname $file) && tar -czf $tarfile $(basename $file)
            curl --progress-bar --upload-file "$tarfile" "https://free.keep.sh/$basefile.tar.gz" >> $tmpfile
            rm -f $tarfile
        else
            # transfer file
            curl --progress-bar --upload-file "$file" "https://free.keep.sh/$basefile" >> $tmpfile
        fi
    else 
        # transfer pipe
        curl --progress-bar --upload-file "-" "https://free.keep.sh/$file" >> $tmpfile
    fi
   
    # cat output link
    cat $tmpfile
    # add newline
    echo

    # cleanup
    rm -f $tmpfile
}
