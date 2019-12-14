function image=OMTIread(filename)

fid=fopen(filename, 'rb');
fseek(fid,8,'bof');% seek ahead to remove the header
% use uint16, seems like it works
curdata=fread(fid,[256,256],'uint16=>uint16');
im = bitshift(curdata,-2);
image=fliplr(im2double(im));