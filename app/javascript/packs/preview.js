
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){  ///ページが読み込まれたら〜
    const ImageList = document.getElementById('image-list');   //ビューに追記した表示場所を取得

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
     const imageElement = document.createElement('div');

     // 表示する画像を生成
     const blobImage = document.createElement('img');
     blobImage.setAttribute('src', blob);
     blobImage.height = 100;        //img要素の高さを100に指定
     // 生成したHTMLの要素をブラウザに表示させる
     imageElement.appendChild(blobImage);    // 親子関係をブラウザに作る               <div><img>  </div>
     ImageList.appendChild(imageElement);    // 親子関係をブラウザに作る   <image-list><div><img>  </div></image-list>
    };

    document.getElementById('item-image').addEventListener('change', function(e){  //画像ファイルを選択して変化したら発火

      const imageContent = document.querySelector('img');    // 画像が表示されている場合のみ、すでに存在している画像を削除する
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);


   });
  });
}