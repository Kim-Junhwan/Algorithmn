#define _CRT_SECURE_NO_WARNINGS

#include<iostream>
#include<algorithm>
#include<vector>
#include<utility>
#include<cmath>

using namespace std;

vector <int> each_alpha(27, 0); // 아스키코드 순서대로 0부터 해당하는 알파벳의 개수를 저장한 벡터
vector <int> alpha; // 최적화를 위한 벡터, 존재하는 알파벳만 알파벳 순서대로 저장, 해당하는 요소에는 each_alpha의 요소에 해당하는 index 정수가 들어가 있음

int solution(int num, int prev_alpha) { // 처음부터 배열해보는 재귀함수, num은 더 넣어야 하는 문자의 개수, prev_alpha는 직전 재귀에 사용한 문자의 each_alpha index

	int sum = 0;

	if (num == 0) { // 완성되었으면 1 return 

		return 1;

	}

	else {

		for (int i = 0; i < alpha.size(); i++) {

			int temp;

			if (alpha[i] == -1) // 이미 사용되어서 없어진 문자를 -1을 저장함
				continue;

			if (each_alpha[alpha[i]] != 0 && prev_alpha != alpha[i]) { // 문자가 1개 이상 있고 전에 사용되지 않았을때

				each_alpha[alpha[i]]--;

				if (each_alpha[alpha[i]] == 0) { // 0개가 되면 alpha에서 문자를 지우고 temp를 활용함

					temp = alpha[i];
					alpha[i] = -1;

				}

				else { // 안써도 되는 코드지만 밑에 temp로 통일하기 위해 씀. (귀찮아서)

					temp = alpha[i];

				}

				sum += solution(num - 1, temp);

				if (each_alpha[temp] == 0) { // 원상 복구

					alpha[i] = temp;

				}

				each_alpha[alpha[i]]++;

			}

		}

		return sum;

	}

}

int main() {

	char temp;
	int num = 0;

	while (scanf("%c", &temp) != EOF) {

		if (temp == 10) { // enter가 들어오면 입력을 종료

			break;

		}

		if (each_alpha[temp - 'a'] == 0) { // 처음 들어온 문자는 alpha에 추가

			alpha.push_back(temp - 'a'); // 추가할 때 해당하는 index 값을 저장

		}

		each_alpha[temp - 'a']++;
		num++;

	}

	sort(alpha.begin(), alpha.end()); // alpha를 알파벳 순으로 정렬

	printf("%d", solution(num, -1));

	return 0;

}