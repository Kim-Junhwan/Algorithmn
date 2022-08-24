#include <iostream>

using namespace std;

int n;
bool board[15][15];
bool check_col[40]; // | 열 검사 : col
bool check_dig1[40]; // / 대각선 검사 : row+col
bool check_dig2[40]; // \ 대각선 검사 : row+col+n-1

// row행 col열에 퀸을 놓을 수 있는지 판별
bool check(int row, int col){
    // | 열 검사
    if(check_col[col]) return false;
    
    // / 대각선 검사
    if(check_dig1[row+col]) return false;
    
    // \ 대각선 검사
    if(check_dig2[row-col+n-1]) return false;
    
    return true;
}


// row 행에 퀸을 어디에 놓을지 결정
int solve(int row){
    // n번째 행 도착 -> 모든 퀸 놓음 (cnt 증가)
    if(row>=n) return 1;
    
    int cnt = 0;
    for(int col=0; col<n; col++){
        if(check(row, col)){
            // 퀸 처리 (같은 열, 대각선 두 방향으로 못 놓게 처리)
            check_col[col] = true;
            check_dig1[row+col] = true;
            check_dig2[row-col+n-1] = true;
            
            // 퀸 놓음
            board[row][col] = true;
            cnt += solve(row+1);
            
            // 원래대로 되돌려놓음 (백트래킹)
            check_col[col] = false;
            check_dig1[row+col] = false;
            check_dig2[row-col+n-1] = false;
            board[row][col] = false;
        }
    }
    
    return cnt;
}

int main(void){
    
    ios::sync_with_stdio(false);
    cin.tie(0); cout.tie(0);
    
    cin >> n;
    cout << solve(0) << '\n';
    
    return 0;
}