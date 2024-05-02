%% 고정좌표 매트랩 코드 
% UWB 매개변수 설정
numAnchors = 4;
numTags = 12000;  % 12000개의 데이터 생성

% 앵커 좌표 고정
anchorLoc = [0, 0, 60;
             0, 100, 60;
             100, 0, 60;
             100, 100, 60];

% 빛의 속도 설정 (미터/초)
lightSpeed = 299792458;

% 데이터 초기화
data_10k = zeros(numTags, numAnchors);  % 4개 앵커에서 나오는 TOA 값
loc_10k = zeros(numTags, 3);  % 태그의 위치를 저장하기 위한 배열

for i = 1:numTags
    % 랜덤한 태그 위치 생성 
    tagLoc = [rand()*40, rand()*70, rand()*30];
    
    % 앵커에서 태그까지의 실제 거리 계산
    actualDistances = sqrt(sum((anchorLoc - tagLoc).^2, 2));

    % 실제 TOF 계산
    Ideal_TOF = actualDistances / lightSpeed;

    % 데이터 저장
    data_10k(i, :) = Ideal_TOF';  
    loc_10k(i,:) = tagLoc';
    
end

% 데이터 출력 (첫 10개 행만 출력)
disp('첫 10개의 데이터:');
disp(data_10k(1:10, :));

% 데이터를 CSV 파일로 저장
writematrix(data_10k, 'data_10k.csv');
writematrix(loc_10k, 'loc_10k.csv');

