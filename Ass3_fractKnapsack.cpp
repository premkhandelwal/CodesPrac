#include <bits/stdc++.h>

using namespace std;

struct Item
{
    int value;
    int weight;
};

bool static comp(Item a, Item b)
{
    int r1 = (int)a.value / (int)a.weight;
    int r2 = (int)b.value / (int)b.weight;
    return r1 > r2;
}

int fractionalKnapsack(int W, Item arr[], int n)
{

    sort(arr, arr + n, comp);

    int curWeight = 0;
    int finalvalue = 0.0;

    for (int i = 0; i < n; i++)
    {

        if (curWeight + arr[i].weight <= W)
        {
            curWeight += arr[i].weight;
            finalvalue += arr[i].value;
        }
        else
        {
            int remain = W - curWeight;
            finalvalue += (arr[i].value / arr[i].weight) * remain;
            break;
        }
    }

    return finalvalue;
}
int main()
{
    int n = 3, weight = 50;
    Item arr[n] = {{100, 20}, {60, 10}, {120, 30}};
    int ans = fractionalKnapsack(weight, arr, n);
    cout << "The maximum value is "  << fixed << ans;
    return 0;
}