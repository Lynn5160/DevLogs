#! /bin/bash

# ��ָ��Ŀ¼������ָ����׺���ı��ļ����ݺϲ���һ���ļ�
# Ŀ¼Ĭ��Ϊ��ǰĿ¼���ļ�����׺Ĭ��Ϊ txt������ļ�Ĭ��Ϊ all. �Ӻ�׺

while getopts "d:s:o:" opt
do
    case $opt in
        d ) dir=$OPTARG;;
        s ) suffix=$OPTARG;;
        o ) out=$OPTARG;;
        ? ) echo "Invalid option: -$OPTARG"
            exit 1;;
    esac
done

if test -z "$dir" #�ַ����ĳ���Ϊ����Ϊ��
then
	dir='.'
else
	cd $dir > /dev/null 2>&1
	if test $? != 0;then
		echo "The directory $dir does not exist."
		exit 1
	fi
fi

if test -z "$suffix"
then
	suffix='txt'
fi

target='*.'$suffix

if test -z "$out"
then
	out='all.'$suffix
else
	if [[ $out != *"."* ]];then
		out=$out'.'$suffix
	fi
fi

if test -e $out;then
	echo $out" already exists."
	exit 1
fi

echo -e "dir:$dir \nsuffix:$suffix \noutfile:$out"

#find $dir -name "$target"

#for file in `ls $dir`; do # ���ݹ���Ŀ¼
for file in `find $dir -name "$target"`; do
#	echo $file
	cat $file >> $out
done
