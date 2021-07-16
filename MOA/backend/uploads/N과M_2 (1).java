import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int N = sc.nextInt();
		int[] arr = new int[N];
		int M = sc.nextInt();

		for (int i = 0; i < N; i++) {
			arr[i] = i + 1;
		}

		comb(arr, 0, 0, new int[M]);
	}

	static void comb(int[] arr, int idx, int c, int[] sel) {
		if (c == sel.length) {
			for (int i = 0; i < sel.length; i++) {
				System.out.print(sel[i] + " ");
			}
			System.out.println();
			return;
		}

		if (arr.length == idx) {
			return;
		}

		sel[c] = arr[idx];
		comb(arr, idx + 1, c + 1, sel);
		comb(arr, idx + 1, c, sel);
	}

}
