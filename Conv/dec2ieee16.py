import struct
def float_to_bin_16(num):
    bits, = struct.unpack('!H', struct.pack('!e', num))
    return "{:016b}".format(bits)

# Main
path = "E:/yanjiusheng/study/研一上/机器学习基础/captcha_fpga/conv/"
filename = "image_tensor"
filereadpath = path + filename + ".txt"
filewritepath = path + filename + "_IEEE16.txt"
file = open(filereadpath, "r")
filewrite = open(filewritepath, "w")
count = 0

if (file.mode == "r"):
    content = file.readlines()
    for idx, num in enumerate(content):
        num = num.replace('\n', '')  # 修正此处应该赋值给num
        dec = float(num)
        IEEE = float_to_bin_16(dec)
        string = str(IEEE)
        if (string[15:16] == '0'):  # 修正此处应该是15:16
            count += 1
        IEEE = IEEE[0:16]  
        IEEE = int(IEEE, 2)
        IEEE = hex(IEEE)
        string = IEEE.split('0x')
        filewrite.write(string[1])
        filewrite.write('\n')

print((count / len(content) * 100), "%")
file.close()
filewrite.close()