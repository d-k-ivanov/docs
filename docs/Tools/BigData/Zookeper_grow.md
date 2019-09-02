## Adding 2 nodes to an existing 3-node ZooKeeper ensemble without losing the Quorum

Since many deployments may start out with 3 nodes and so little is known about how to grow a cluster from 3 memebrs to 5 members without losing the existing Quorum, here is an example of how this might be achieved.

### Step 1: Have a healthy 3-node ensemble

Ensure all 3 nodes are up, one is the leader, and all are in sync
Initial setup:
```bash
    sudo apt-get update
    sudo apt-get install -y openjdk-6-jre-headless vim

    mkdir ~/zook
    cd ~/zook
    wget http://apache.claz.org/zookeeper/zookeeper-3.4.5/zookeeper-3.4.5.tar.gz # You may wish to choose a closer mirror
    tar xzf zookeeper-3.4.5.tar.gz
    for i in `seq 5` ; do mkdir conf$i ; echo $i > conf$i/myid ; done

    tickTime=2000
    dataDir=/home/user/zook/conf1
    clientPort=2181
    initLimit=50
    syncLimit=200
    server.1=localhost:2881:3881
    server.2=localhost:2882:3882
    server.3=localhost:2883:3883

    zookeeper-3.4.5/bin/zkServer.sh start-foreground conf1/zoo.cfg


    tickTime=2000
    dataDir=/home/user/zook/conf2
    clientPort=2182
    initLimit=50
    syncLimit=200
    server.1=localhost:2881:3881
    server.2=localhost:2882:3882
    server.3=localhost:2883:3883

    zookeeper-3.4.5/bin/zkServer.sh start-foreground conf2/zoo.cfg


    tickTime=2000
    dataDir=/home/user/zook/conf3
    clientPort=2183
    initLimit=50
    syncLimit=200
    server.1=localhost:2881:3881
    server.2=localhost:2882:3882
    server.3=localhost:2883:3883

    zookeeper-3.4.5/bin/zkServer.sh start-foreground conf3/zoo.cfg
```

### Step 2: Set up 2 new nodes to join the cluster

Start the service, see the nodes join the cluster, snapshot the data and become active.
```bash
    tickTime=2000
    dataDir=/home/user/zook/conf4
    clientPort=2184
    initLimit=50
    syncLimit=200
    server.1=localhost:2881:3881
    server.2=localhost:2882:3882
    server.3=localhost:2883:3883
    server.4=localhost:2884:3884
    server.5=localhost:2885:3885

    zookeeper-3.4.5/bin/zkServer.sh start-foreground conf4/zoo.cfg


    tickTime=2000
    dataDir=/home/user/zook/conf5
    clientPort=2185
    initLimit=50
    syncLimit=200
    server.1=localhost:2881:3881
    server.2=localhost:2882:3882
    server.3=localhost:2883:3883
    server.4=localhost:2884:3884
    server.5=localhost:2885:3885

    zookeeper-3.4.5/bin/zkServer.sh start-foreground conf5/zoo.cfg
```

### Step 3: Add the 2 new nodes config to existing cluster
```bash
    for i in `seq 3` ;do vim conf$i/zoo.cfg ; done

    server.4=localhost:2884:3884
    server.5=localhost:2885:3885
```
Save files.

### Step 4: Restart Followers with new config

```bash
    # Stop this instance with Ctrl+C, then run
    zookeeper-3.4.5/bin/zkServer.sh start-foreground conf2/zoo.cfg
```

Ensure that is joins the ensemble, repeat with other Follower.

```bash
    # Ctrl+C
    zookeeper-3.4.5/bin/zkServer.sh start-foreground conf3/zoo.cfg
```

### Step 5: Restart the Leader

Ensure that all 4 nodes have network conenctivity to each other on the designated ports, and then bounce the Leader.

```
    # Ctrl+C
    zookeeper-3.4.5/bin/zkServer.sh start-foreground conf1/zoo.cfg
```