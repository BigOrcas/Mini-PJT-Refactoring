<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���� ������</title>
</head>
<body>
    <a href="#0" id="kakaoLogin"><img src="/images/16.JPG" alt="īī������ �α���" style="height: 100px;"/></a>

    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        function saveToDos(token) { //item�� localStorage�� �����մϴ�. 
            typeof(Storage) !== 'undefined' && sessionStorage.setItem('AccessKEY', JSON.stringify(token)); 
        };

        window.Kakao.init('bdc66313a731d6cd370ddce26735db6a');
        
        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'account_email', //�����׸� �������� �ִ� �������� ��ȣ ���̺��� Ȱ��ȭ�� ID���� �ֽ��ϴ�.
                success: function(response) {
                    saveToDos(response.access_token)  // �α��� �����ϸ� ����� ������ ��ū sessionStorage�� ����
                    window.Kakao.API.request({ // ����� ���� �������� 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            alert('�α��� ����');
                            window.location.href='/main.jsp'
                        }
                    });
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        };

        const login = document.querySelector('#kakaoLogin');
        login.addEventListener('click', kakaoLogin);
    </script>
</body>
</html>