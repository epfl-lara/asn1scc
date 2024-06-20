; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14764 () Bool)

(assert start!14764)

(declare-fun b!76096 () Bool)

(declare-fun res!62923 () Bool)

(declare-fun e!49875 () Bool)

(assert (=> b!76096 (=> (not res!62923) (not e!49875))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!3131 0))(
  ( (array!3132 (arr!2057 (Array (_ BitVec 32) (_ BitVec 8))) (size!1459 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2492 0))(
  ( (BitStream!2493 (buf!1840 array!3131) (currentByte!3631 (_ BitVec 32)) (currentBit!3626 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2492)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76096 (= res!62923 (validate_offset_bits!1 ((_ sign_extend 32) (size!1459 (buf!1840 thiss!1379))) ((_ sign_extend 32) (currentByte!3631 thiss!1379)) ((_ sign_extend 32) (currentBit!3626 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62920 () Bool)

(assert (=> start!14764 (=> (not res!62920) (not e!49875))))

(declare-fun srcBuffer!2 () array!3131)

(assert (=> start!14764 (= res!62920 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1459 srcBuffer!2))))))))

(assert (=> start!14764 e!49875))

(assert (=> start!14764 true))

(declare-fun array_inv!1305 (array!3131) Bool)

(assert (=> start!14764 (array_inv!1305 srcBuffer!2)))

(declare-fun e!49878 () Bool)

(declare-fun inv!12 (BitStream!2492) Bool)

(assert (=> start!14764 (and (inv!12 thiss!1379) e!49878)))

(declare-fun b!76097 () Bool)

(declare-fun e!49876 () Bool)

(assert (=> b!76097 (= e!49876 true)))

(declare-datatypes ((tuple2!6594 0))(
  ( (tuple2!6595 (_1!3428 array!3131) (_2!3428 BitStream!2492)) )
))
(declare-fun lt!122103 () tuple2!6594)

(declare-fun checkByteArrayBitContent!0 (BitStream!2492 array!3131 array!3131 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76097 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3428 lt!122103) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!76098 () Bool)

(declare-fun e!49877 () Bool)

(assert (=> b!76098 (= e!49875 (not e!49877))))

(declare-fun res!62922 () Bool)

(assert (=> b!76098 (=> res!62922 e!49877)))

(declare-fun lt!122101 () (_ BitVec 64))

(assert (=> b!76098 (= res!62922 (or (bvslt i!635 to!314) (not (= lt!122101 (bvsub (bvadd lt!122101 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2492 BitStream!2492) Bool)

(assert (=> b!76098 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5018 0))(
  ( (Unit!5019) )
))
(declare-fun lt!122102 () Unit!5018)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2492) Unit!5018)

(assert (=> b!76098 (= lt!122102 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76098 (= lt!122101 (bitIndex!0 (size!1459 (buf!1840 thiss!1379)) (currentByte!3631 thiss!1379) (currentBit!3626 thiss!1379)))))

(declare-fun b!76099 () Bool)

(assert (=> b!76099 (= e!49877 e!49876)))

(declare-fun res!62919 () Bool)

(assert (=> b!76099 (=> res!62919 e!49876)))

(assert (=> b!76099 (= res!62919 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2492 (_ BitVec 64)) tuple2!6594)

(declare-datatypes ((tuple2!6596 0))(
  ( (tuple2!6597 (_1!3429 BitStream!2492) (_2!3429 BitStream!2492)) )
))
(declare-fun reader!0 (BitStream!2492 BitStream!2492) tuple2!6596)

(assert (=> b!76099 (= lt!122103 (readBits!0 (_1!3429 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76100 () Bool)

(declare-fun res!62921 () Bool)

(assert (=> b!76100 (=> res!62921 e!49877)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76100 (= res!62921 (not (invariant!0 (currentBit!3626 thiss!1379) (currentByte!3631 thiss!1379) (size!1459 (buf!1840 thiss!1379)))))))

(declare-fun b!76101 () Bool)

(assert (=> b!76101 (= e!49878 (array_inv!1305 (buf!1840 thiss!1379)))))

(assert (= (and start!14764 res!62920) b!76096))

(assert (= (and b!76096 res!62923) b!76098))

(assert (= (and b!76098 (not res!62922)) b!76100))

(assert (= (and b!76100 (not res!62921)) b!76099))

(assert (= (and b!76099 (not res!62919)) b!76097))

(assert (= start!14764 b!76101))

(declare-fun m!121279 () Bool)

(assert (=> b!76100 m!121279))

(declare-fun m!121281 () Bool)

(assert (=> b!76096 m!121281))

(declare-fun m!121283 () Bool)

(assert (=> b!76098 m!121283))

(declare-fun m!121285 () Bool)

(assert (=> b!76098 m!121285))

(declare-fun m!121287 () Bool)

(assert (=> b!76098 m!121287))

(declare-fun m!121289 () Bool)

(assert (=> b!76101 m!121289))

(declare-fun m!121291 () Bool)

(assert (=> b!76099 m!121291))

(declare-fun m!121293 () Bool)

(assert (=> b!76099 m!121293))

(declare-fun m!121295 () Bool)

(assert (=> start!14764 m!121295))

(declare-fun m!121297 () Bool)

(assert (=> start!14764 m!121297))

(declare-fun m!121299 () Bool)

(assert (=> b!76097 m!121299))

(push 1)

