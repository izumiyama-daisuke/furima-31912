
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){  ///ページが読み込まれたら〜
    const ImageList = document.getElementById('image-list');   //ビューに追記した表示場所を取得

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
     const imageElement = document.createElement('div');
     imageElement.setAttribute('class', "image-element")
     let imageElementNum = document.querySelectorAll('.image-element').length

     // 表示する画像を生成
     const blobImage = document.createElement('img');
     blobImage.setAttribute('src', blob);
     blobImage.height = 100;        //img要素の高さを100に指定
     // ファイル選択ボタンを生成
     const inputHTML = document.createElement('input')
     inputHTML.setAttribute('id', `item_image_${imageElementNum}`)
     inputHTML.setAttribute('name', 'item[images][]')
     inputHTML.setAttribute('type', 'file')



     // 生成したHTMLの要素をブラウザに表示させる
     imageElement.appendChild(blobImage);    // 親子関係をブラウザに作る               <div><img>  </div>
     imageElement.appendChild(inputHTML)     // ファイル選択ボタンを表示
     ImageList.appendChild(imageElement);    // 親子関係をブラウザに作る   <image-list><div><img>  </div></image-list>

     inputHTML.addEventListener('change', (e) => {    // 2枚目以降も発火するように
     file = e.target.files[0];
     blob = window.URL.createObjectURL(file);

     createImageHTML(blob)
     })
    };

    document.getElementById('item-image').addEventListener('change', function(e){  //画像ファイルを選択して変化したら発火
//   ここから削除
//      const imageContent = document.querySelector('img');    // 画像が表示されている場合のみ、すでに存在している画像を削除する
//     if (imageContent){
//        imageContent.remove();
//      }
//   ここまで削除
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);


   });
  });
}