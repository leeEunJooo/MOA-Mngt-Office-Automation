#include <bits/stdc++.h>

using namespace std;

string name[100000];
int rank_[100000];
int parent[10000];

int find(int x){
    if(x == parent[x]) return x;
    return parent[x] = find(parent[x]);
}

int merge(int x, int y){
    //부모 찾기
    int u = find(x);    
    int v = find(y);    

    if(rank_[u] > rank_[v]) swap(u, v);
    parent[u] = v;  //작은쪽을 붙이기
    if(rank_[u] == rank_[v]) ++rank_[v];
    // if(arr[u] == arr[v]) rank[];
}

int main(){
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    
    int F; cin >> F;


    
    for(int i=0; i<F; i++){
        
        int N; cin >> N;
        map<string, int> name;
        int cnt = 1;

        for(int j=0; j<N; j++){ 

            string a, b; cin >> a >> b;
            //없을때
            if (name.count(a) == 0)
                name[a] = cnt++;
            if (name.count(b) == 0)
                name[b] = cnt++;

            int u = find(name[a]);
            int v = find(name[b]);

            //같은 네트워크
            if(u == v) cout << rank_[u]<<"\n";
            //다른네트워크
            else{
                merge(u, v);
                cout << rank_[u] << "\n";
            }

            //둘을 합치고
            //집합을 만들고
            //개수를 세서 출력
        }
    }


    return 0;
}