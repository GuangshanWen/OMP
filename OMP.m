function [ x , error] = OMP( d,y,err,ite )
%% �������
% d : �ֵ�  Ϊ n * m �ľ�������nΪÿ�����ֵ�ά����mΪ�ֵ������ֵĸ���
% y �� ��������
% err : ���в�С�ڴ�ֵʱֹͣ����
% ite : ���������������������ʱֹͣ����

%% ������� 
% x : ϵ������

%% 
[rowA,colA] = size(d);
x = zeros(colA,1);
Y = y;
% ��ÿ�����ֽ��й�һ�����õ���һ�����ֵ�
% for i = 1 : colA
%     d(:,i) = d(:,i)./(norm(d(:,i),2));
% end
n = 0;
r = Y;
error =  norm(r,2);
while n < ite && norm(r,2) > err
    n = n + 1;
    in_p = ((d' * r))./ norm(r,2);
    
    [~,max_pos] = max(in_p);

    x(max_pos) = x(max_pos) + r' * d(:,max_pos) / norm(r,2);
    
    r = Y - r' * d(:,max_pos) * d(:,max_pos) / norm(r,2) ;
    Y = r;
    error =  norm(r,2);
end

end
