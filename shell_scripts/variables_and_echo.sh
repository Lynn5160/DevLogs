#! /bin/bash

my_name="robot527"
echo "Author is $my_name."
echo "I'm ${my_name}!"

# �û����Ű�Χ������Ϊ�˰���������ʶ������ı߽磬�Ƽ������б������ϻ����š�
echo -e "I'm good at \c" # -e ����ת��, \c ������
for method in Heap Insertion Merge Quick; do
	echo -e "${method}Sort, \c"
done
echo -e "and I like Shell !\n"

test='This is a test.'
echo '$test' #����������κ��ַ�����ԭ��������������ַ����еı�������Ч�ġ�
echo ${test}

unset test
echo ${test}
