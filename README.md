Docker Java開発環境
========================

## 起動

```
$ docker-compose up
```

http://localhost:8080/helloworld/

を開いて表示を確認する


## Maven 新規プロジェクト

### 1. dockerコンテナに入る

```
$ docker compose exec java /bin/bash
```

### 2. mvnを利用してプロジェクトの作成

```
$ mvn archetype:generate -DarchetypeArtifactId=maven-archetype-webapp
Define value for property 'groupId': brain
Define value for property 'artifactId': APISample
Define value for property 'version' 1.0-SNAPSHOT: : (何も入れずにENTER)
Define value for property 'package' brain: :  (何も入れずにENTER)
Confirm properties configuration:
groupId: brain
artifactId: APISample
version: 1.0-SNAPSHOT
package: brain
 Y: : Y
```
