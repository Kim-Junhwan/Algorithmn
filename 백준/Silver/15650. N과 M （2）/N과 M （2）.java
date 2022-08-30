import java.util.Scanner;

public class Main {
    static int[] arr;

    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        int n=scanner.nextInt();
        int m=scanner.nextInt();
        arr=new int[m];
        dfs(1,0,n);
    }
    public static void dfs(int start,int deep,int n){
        if(deep== arr.length){
            for(int item: arr)
                System.out.print(item+" ");
            System.out.println();
            return;
        }

        for(int i=start;i<=n;i++){
            arr[deep]=i;
            dfs(i+1,deep+1,n);
        }
    }
}