data = '6d1e72ad03ddeb5de891e572e2396f8da015d899ef0e79503152d6010a3fe6916d1e72ad03ddeb5de891e572e2396f8da015d899ef0e79503152d6010a3fe6916d1e72ad03ddeb5de891e572e2396f8da015d899ef0e79503152d6010a3fe691';
size = len(data);
rem = size%8;
if rem!=0:
	for i in range(0,8-rem):
		data = data + '0'

file = open("C:/Users/HP/Desktop/my_file.txt",'w');
for i in range(0,len(data)//8):
	file.write('0x'+data[i*8:i*8+8]+'\n');

file.close()
print(len(data)/8)
print(data)