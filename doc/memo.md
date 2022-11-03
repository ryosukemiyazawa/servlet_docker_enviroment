## Javaの開発を始める

```
$ docker compose exec tomcat /bin/bash
```

### hello.javaを作る

javac -classpath /usr/local/tomcat/lib/servlet-api.jar hello.java
=> hello.class

下記に配置
webapps/xxxx/WEB-INF/classes/hello.class

http://localhost:8888/xxxx/ の表示を確認

### ライブラリのダウンロード

pom.xmlの作成

mysql
https://mvnrepository.com/artifact/mysql/mysql-connector-java/8.0.31

Jackson
https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind/2.13.4

Servlet-API
https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api/6.0.0

###  maven経由でインストール

```
$ mvn dependency:copy-dependencies
=> target/dependencyにファイルが入る

$ ls ./target/dependency
mysql-connector-j-8.0.31.jar
jackson-core-2.13.4.jar
```

### DBの結合確認

```
javac -d bin dbtest.java
java -classpath "./bin:./target/dependency/mysql-connector-j-8.0.31.jar" dbtest
```

### JSONを利用して読み込みを行う

ライブラリが増えて来るのでワイルドカード指定

```
export CLASSPATH=.:./bin/./target/dependency/*
javac -d bin insert_db.java
java insert_db
```

### VSCodeにJavaの情報を追加する

- Extension Pack for Java
- 設定「java.project.referencedLibraries」

```
{
	"java.project.referencedLibraries": ["src/target/dependency/*.jar"]
}
```

### シンプルなJSONを返却するServlet

```
export CLASSPATH=.:./bin/./target/dependency/*:/usr/local/tomcat/lib/*
$ javac -d bin api/api_list.java
=> src/bin/api/api_list.classを確認

$ mkdir -p bin/api_test/WEB-INF/classes
$ cp -r bin/api bin/api_test/WEB-INF/classes
$ mv bin/api_test /app/webapps
```

http://127.0.0.1:8888/api_test/
を開いて確認する

### Jacksonを使ってJSONをアウトプット

- APIResponseBean01.txt => src/api/APIResponseBean.java
- api_list02.txt => src/api/api_list.java

```
$ rm -rf /app/webapps/api_test
=> 少し待機

$ export CLASSPATH=.:./bin/./target/dependency/*:/usr/local/tomcat/lib/*
$ javac -d bin api/*
$ mkdir -p bin/api_test/WEB-INF/classes
$ mkdir -p bin/api_test/WEB-INF/lib
$ cp -r bin/api bin/api_test/WEB-INF/classes
$ mv bin/api_test /app/webapps
```

http://127.0.0.1:8888/api_test/
=> エラーになる

理由はTomcatにJarを渡せていないから

```
$ rm -rf /app/webapps/api_test
少し待機

$ rm -rf bin/api_test
$ mkdir -p bin/api_test/WEB-INF/classes
$ mkdir -p bin/api_test/WEB-INF/lib
$ cp -rf bin/api bin/api_test/WEB-INF/classes
$ cp -rf target/dependency/*.jar bin/api_test/WEB-INF/lib
$ mv bin/api_test /app/webapps
```

http://127.0.0.1:8888/api_test/
を開いて確認する

### 作業が難しくなってきたので、シェルスクリプトにまとめる

- deploy_test_api.txt => src/deploy_test_api.sh

```
$ chmod +x deploy_test_api.sh
$ ./deploy_test_api.sh
```

### 顧客情報を渡すようにする

- APIResponseBean02.txt
- api_list03.txt
- CustomerInfoBean01.txt

```
$ ./deploy_test_api.sh
```

### DBから取得するようにする

- api_list04.txt

http://127.0.0.1:8888/api_test/
を開いて確認する

```
$ ./deploy_test_api.sh
```

### NextJSからアクセスする

```
//通信
const loadCustomers = () => {
	
	fetch('http://127.0.0.1:8888/api_test/')
		.then((response) => response.json())
		.then((data) => {
			console.log(data)
		});

};
```

=> エラーが発生する

### CORS対策を追加したServlet

```
//CORS対策
response.setHeader("Access-Control-Allow-Origin","*");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
```

=> 動作確認

### リファクタリング

- データーベースの接続方法
	- 現在の接続はメモリリークを伴う
	- META-INF/context.xml
