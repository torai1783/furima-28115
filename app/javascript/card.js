const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //pay.jpのテスト公開キー
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");//ブラウザ上に表示されているフォームの情報を取得する
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_item[number]"),//カード情報をPAY.JP側に送りトークン化する
      cvc: formData.get("order_item[cvc]"),
      exp_month: formData.get("order_item[exp_month]"),
      exp_year: `20${formData.get("order_item[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form"); //HTMLのinput要素にトークンの値を埋め込み、フォームに追加
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name"); //クレジットカード情報は削除する
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();//サーバーサイドへフォームの情報を送信
    });
  });
};

window.addEventListener("load", pay);