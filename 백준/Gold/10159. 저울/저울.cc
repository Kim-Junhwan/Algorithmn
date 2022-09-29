#include <algorithm>
#include <iostream>

using namespace std;

int map[101][101];
//floyd-warshall 알고리즘 
int main()
{
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	int N, M, a, b, ans; 

	cin >> N;
	cin >> M;

	for (int i = 0; i < M; i++)
	{
		cin >> a >> b;
		map[a][b] = 1;
		map[b][a] = -1;
	}

	for (int k = 1; k <= N; k++)
	{
		for (int i = 1; i <= N; i++)
		{
			for (int j = 1; j <= N; j++)
			{
				if (map[i][k] == map[k][j] && map[i][k] != 0)
					map[i][j] = map[i][k];
 			}
		}
	}

	for (int i = 1; i <= N; i++)
	{
		ans = N - 1;
		for (int j = 1; j <= N; j++)
		{
			if (map[i][j] != 0)
				ans--;
		}
		cout << ans << "\n";
	}
	return 0;
}