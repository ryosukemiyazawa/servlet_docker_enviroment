Docker Java開発環境
========================

## 起動

```
$ docker-compose up
```

http://localhost:8888/helloworld/

を開いて表示を確認する


## ステップ1

### dockerコンテナに入る

```
$ docker compose exec tomcat /bin/bash
```

### mvnを利用してプロジェクトの作成

```
$ mvn archetype:generate -DarchetypeArtifactId=maven-archetype-webapp
Define value for property 'groupId': test
Define value for property 'artifactId': APISample
Define value for property 'version' 1.0-SNAPSHOT: : (何も入れずにENTER)
Define value for property 'package' test: :  (何も入れずにENTER)
Confirm properties configuration:
groupId: test
artifactId: APISample
version: 1.0-SNAPSHOT
package: test
 Y: : Y
```
