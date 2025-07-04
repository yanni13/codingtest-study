# [Gold IV] 서울의 지하철 - 16166 

[문제 링크](https://www.acmicpc.net/problem/16166) 

### 성능 요약

메모리: 79524 KB, 시간: 8 ms

### 분류

너비 우선 탐색, 자료 구조, 그래프 이론, 그래프 탐색, 해시를 사용한 집합과 맵, 구현, 집합과 맵

### 제출 일자

2025년 6월 5일 18:25:58

### 문제 설명

<p>한국에 처음 도착한 미국인 Mr.Goofcode는 한국의 수도 서울을 여행할 생각에 들떠 있었다. 하지만, 공항 철도를 타고 서울역에 도착한 Mr.Goofcode는 복잡한 서울의 지하철 노선도를 보고 경악을 금치 못했다. 왜냐하면, 서울역을 포함한 서울의 모든 역은 이름이 아닌 숫자로 구분해야 했으며, 운영되는 지하철의 종류(호선)가 너무 많아 최적의 이동 경로를 계산하기 어려웠기 때문이다.</p>

<p>Mr.Goofcode는 패닉에 빠져 평소 메일로 편지를 주고 받던 당신에게 도움을 요청했다. 평소 Mr.Goofcode에게 도움을 받았던 당신은 그를 위해 지하철 노선도 어플리케이션을 만들어 주려고 한다. 그러나, 까다로운 Mr.Goofcode는 걷는 것을 매우 싫어한다. 따라서, 그를 위해 가능하면 어플리케이션이 제시하는 지하철 환승 횟수를 최소로 줄이고 싶어 한다.</p>

<p>Mr.Goofcode를 위해 주어진 지하철 노선도를 보고 Mr.Goofcode가 목적지에 도달하기 위해 최소 몇 번의 환승이 필요한지 구해주자. 단, Mr.Goofcode의 출발역인 서울역의 역 번호는 항상 0번이다.</p>

<p>지하철의 '호선'이란 한 종류의 지하철에서, 다른 지하철로 환승하지 않고 이동할 수 있는 역의 집합을 의미한다. 지하철의 '역'이란 지하철의 호선의 원소로 지하철이 방문할 수 있는 정점을 의미한다. 각 역은 간선으로 연결 관계를 나타낼 수 있으며, 이 간선을 통해서만 지하철이 이동할 수 있다. 지하철은 양 방향으로 이동할 수 있다.</p>

### 입력 

 <p>첫째 줄에 서울의 지하철 호선의 개수 N(1 ≤ N ≤ 10)이 주어진다.</p>

<p>둘째 줄부터, 순서대로 1호선부터 N호선까지, 각 호선의 역 개수 K(1 ≤ K ≤ 10)와 각 지하철 호선이 포함하는 역의 번호a<sub>N1</sub>, a<sub>N2</sub>, a<sub>N3</sub>, ... a<sub>NK</sub>가 한 줄에 주어진다. 각 역의 번호는 모두 다르며 0이상 2<sup>32</sup>-1 이하의 정수임이 보장되어 있다.</p>

<p>입력의 마지막 줄에는, 도착역의 번호가 주어진다.</p>

<p>각 지하철 호선 중, 순환선이 있을 수 있음에 주의하자, 순환선의 입력은 호선이 포함하는 역의 번호가 a<sub>1</sub>, a<sub>2</sub>, a<sub>3</sub>, ... a<sub>K-1</sub>, a<sub>1</sub> 의 꼴로 주어진다. (예제 2번)</p>

### 출력 

 <p>출발 역(서울 역)에서 도착 역까지 최소 환승 횟수를 한 줄에 출력한다. 단, 도달할 수 없는 경우 -1을 출력한다.</p>

