int n = 700;
int[] array = new int[n];
int nCompares = 0;
void randomise(int[] array){
  int maxIterations = n*5;
  int i;
  for (i = 0;i < maxIterations;i++){
    int a = int(random(n));
    int b = int(random(n));
    if (a==b) maxIterations++;
    int temp = array[a];
    array[a] = array[b];
    array[b] = temp;
  }
}

void showList(int[] array){
  int i;
  for (i = 0; i < n; i++){
    print(array[i], " ");
  }
  println();
}

int bubblesort(int[] array){
  int i;
  int res = 0;
  for (i = 0; i < n-1; i++){
    if (array[i] > array[i+1]){
      int temp = array[i+1];
      array[i+1] = array[i];
      array[i] = temp;
      nCompares++;
      res = 1;
    }
  }
  return res;
}

void showColumns(int[] array){
  float size = width/n;
  int i;
  float oX = 0;
  float h = height/n;
  for (i = 0;i < n;i++){
    float col = map(array[i],0,n,0,255);
    fill(col,255,255);
    rect(oX,height-array[i]*h,size,array[i]*h);
    oX += size;
  }
  
  //println(nCompares);
  fill(255);
  textSize(20);
  text(str(nCompares),10,50);
}


void setup(){
  size(1400,800);
  colorMode(HSB);
  background(0);
  int i;
  for (i = 0; i < n; i++){
    array[i] = i+1;
  }
  randomise(array);
  //showList(array);
}
void draw(){
  int res = bubblesort(array);
  if (res != 0) background(0);
  showColumns(array);
}