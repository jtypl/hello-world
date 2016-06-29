$ a=($(sort --key=1n,2 --field-separator="_" sort_test.txt)); for ((i=0;i<${#a[@]};i++)); do if [ ! "${a[$i]:0:6}" = "${a[$i+1]:0:6}" ]; then echo; fi; echo ${a[$i]}; done;
150120_acc_1.3-r5_1.6-r1.html
150120_brw_1.8-r5_1.3.html
150120_fnd_1.2-r5_1.3.html
150120_inv_1.4-r5_1.8.0-r23.html

150120_qa_1.6-r5_1.3.html

150301_qa_3.4-r77_3.4.html

161131_inv_6.7-r1_4.5-r8.html

171020_fnd_9.0-r5_9.1-r1.html

180108_acc_10.2-r4_8.9-r2.html

181201_brw_10.2-r4_9.0.html

200503_qa_1.2-1.4-r1.html

