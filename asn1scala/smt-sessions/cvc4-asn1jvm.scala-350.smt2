; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8264 () Bool)

(assert start!8264)

(declare-fun b!41256 () Bool)

(declare-fun res!35104 () Bool)

(declare-fun e!27306 () Bool)

(assert (=> b!41256 (=> (not res!35104) (not e!27306))))

(declare-datatypes ((array!2067 0))(
  ( (array!2068 (arr!1432 (Array (_ BitVec 32) (_ BitVec 8))) (size!933 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1610 0))(
  ( (BitStream!1611 (buf!1261 array!2067) (currentByte!2704 (_ BitVec 32)) (currentBit!2699 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1610)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41256 (= res!35104 (validate_offset_bits!1 ((_ sign_extend 32) (size!933 (buf!1261 thiss!1379))) ((_ sign_extend 32) (currentByte!2704 thiss!1379)) ((_ sign_extend 32) (currentBit!2699 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41257 () Bool)

(declare-fun res!35106 () Bool)

(declare-fun e!27308 () Bool)

(assert (=> b!41257 (=> res!35106 e!27308)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41257 (= res!35106 (not (invariant!0 (currentBit!2699 thiss!1379) (currentByte!2704 thiss!1379) (size!933 (buf!1261 thiss!1379)))))))

(declare-fun b!41258 () Bool)

(assert (=> b!41258 (= e!27308 true)))

(declare-datatypes ((tuple2!3954 0))(
  ( (tuple2!3955 (_1!2064 array!2067) (_2!2064 BitStream!1610)) )
))
(declare-fun lt!62518 () tuple2!3954)

(declare-fun readBits!0 (BitStream!1610 (_ BitVec 64)) tuple2!3954)

(declare-datatypes ((tuple2!3956 0))(
  ( (tuple2!3957 (_1!2065 BitStream!1610) (_2!2065 BitStream!1610)) )
))
(declare-fun reader!0 (BitStream!1610 BitStream!1610) tuple2!3956)

(assert (=> b!41258 (= lt!62518 (readBits!0 (_1!2065 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35103 () Bool)

(assert (=> start!8264 (=> (not res!35103) (not e!27306))))

(declare-fun srcBuffer!2 () array!2067)

(assert (=> start!8264 (= res!35103 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!933 srcBuffer!2))))))))

(assert (=> start!8264 e!27306))

(assert (=> start!8264 true))

(declare-fun array_inv!858 (array!2067) Bool)

(assert (=> start!8264 (array_inv!858 srcBuffer!2)))

(declare-fun e!27310 () Bool)

(declare-fun inv!12 (BitStream!1610) Bool)

(assert (=> start!8264 (and (inv!12 thiss!1379) e!27310)))

(declare-fun b!41259 () Bool)

(assert (=> b!41259 (= e!27306 (not e!27308))))

(declare-fun res!35105 () Bool)

(assert (=> b!41259 (=> res!35105 e!27308)))

(declare-fun lt!62516 () (_ BitVec 64))

(assert (=> b!41259 (= res!35105 (or (bvslt i!635 to!314) (not (= lt!62516 (bvsub (bvadd lt!62516 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1610 BitStream!1610) Bool)

(assert (=> b!41259 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2914 0))(
  ( (Unit!2915) )
))
(declare-fun lt!62517 () Unit!2914)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1610) Unit!2914)

(assert (=> b!41259 (= lt!62517 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41259 (= lt!62516 (bitIndex!0 (size!933 (buf!1261 thiss!1379)) (currentByte!2704 thiss!1379) (currentBit!2699 thiss!1379)))))

(declare-fun b!41260 () Bool)

(assert (=> b!41260 (= e!27310 (array_inv!858 (buf!1261 thiss!1379)))))

(assert (= (and start!8264 res!35103) b!41256))

(assert (= (and b!41256 res!35104) b!41259))

(assert (= (and b!41259 (not res!35105)) b!41257))

(assert (= (and b!41257 (not res!35106)) b!41258))

(assert (= start!8264 b!41260))

(declare-fun m!62927 () Bool)

(assert (=> b!41257 m!62927))

(declare-fun m!62929 () Bool)

(assert (=> b!41259 m!62929))

(declare-fun m!62931 () Bool)

(assert (=> b!41259 m!62931))

(declare-fun m!62933 () Bool)

(assert (=> b!41259 m!62933))

(declare-fun m!62935 () Bool)

(assert (=> b!41260 m!62935))

(declare-fun m!62937 () Bool)

(assert (=> b!41258 m!62937))

(declare-fun m!62939 () Bool)

(assert (=> b!41258 m!62939))

(declare-fun m!62941 () Bool)

(assert (=> b!41256 m!62941))

(declare-fun m!62943 () Bool)

(assert (=> start!8264 m!62943))

(declare-fun m!62945 () Bool)

(assert (=> start!8264 m!62945))

(push 1)

(assert (not b!41257))

(assert (not b!41259))

