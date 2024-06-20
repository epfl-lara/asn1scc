; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4816 () Bool)

(assert start!4816)

(declare-fun res!16577 () Bool)

(declare-fun e!12362 () Bool)

(assert (=> start!4816 (=> (not res!16577) (not e!12362))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1340 0))(
  ( (array!1341 (arr!1006 (Array (_ BitVec 32) (_ BitVec 8))) (size!565 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1340)

(assert (=> start!4816 (= res!16577 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!565 srcBuffer!2))))))))

(assert (=> start!4816 e!12362))

(assert (=> start!4816 true))

(declare-fun array_inv!535 (array!1340) Bool)

(assert (=> start!4816 (array_inv!535 srcBuffer!2)))

(declare-datatypes ((BitStream!964 0))(
  ( (BitStream!965 (buf!865 array!1340) (currentByte!2145 (_ BitVec 32)) (currentBit!2140 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!964)

(declare-fun e!12359 () Bool)

(declare-fun inv!12 (BitStream!964) Bool)

(assert (=> start!4816 (and (inv!12 thiss!1379) e!12359)))

(declare-fun b!18943 () Bool)

(declare-fun res!16579 () Bool)

(assert (=> b!18943 (=> (not res!16579) (not e!12362))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18943 (= res!16579 (validate_offset_bits!1 ((_ sign_extend 32) (size!565 (buf!865 thiss!1379))) ((_ sign_extend 32) (currentByte!2145 thiss!1379)) ((_ sign_extend 32) (currentBit!2140 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18944 () Bool)

(declare-fun e!12361 () Bool)

(assert (=> b!18944 (= e!12361 true)))

(declare-fun lt!27031 () (_ BitVec 64))

(declare-datatypes ((Unit!1674 0))(
  ( (Unit!1675) )
))
(declare-datatypes ((tuple2!2138 0))(
  ( (tuple2!2139 (_1!1154 Unit!1674) (_2!1154 BitStream!964)) )
))
(declare-fun lt!27032 () tuple2!2138)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18944 (= lt!27031 (bitIndex!0 (size!565 (buf!865 (_2!1154 lt!27032))) (currentByte!2145 (_2!1154 lt!27032)) (currentBit!2140 (_2!1154 lt!27032))))))

(declare-fun b!18945 () Bool)

(assert (=> b!18945 (= e!12359 (array_inv!535 (buf!865 thiss!1379)))))

(declare-fun b!18946 () Bool)

(declare-fun e!12363 () Bool)

(assert (=> b!18946 (= e!12362 (not e!12363))))

(declare-fun res!16578 () Bool)

(assert (=> b!18946 (=> res!16578 e!12363)))

(assert (=> b!18946 (= res!16578 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!964 BitStream!964) Bool)

(assert (=> b!18946 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27033 () Unit!1674)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!964) Unit!1674)

(assert (=> b!18946 (= lt!27033 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27034 () (_ BitVec 64))

(assert (=> b!18946 (= lt!27034 (bitIndex!0 (size!565 (buf!865 thiss!1379)) (currentByte!2145 thiss!1379) (currentBit!2140 thiss!1379)))))

(declare-fun b!18947 () Bool)

(assert (=> b!18947 (= e!12363 e!12361)))

(declare-fun res!16580 () Bool)

(assert (=> b!18947 (=> res!16580 e!12361)))

(assert (=> b!18947 (= res!16580 (not (= (size!565 (buf!865 thiss!1379)) (size!565 (buf!865 (_2!1154 lt!27032))))))))

(declare-fun appendBitFromByte!0 (BitStream!964 (_ BitVec 8) (_ BitVec 32)) tuple2!2138)

(assert (=> b!18947 (= lt!27032 (appendBitFromByte!0 thiss!1379 (select (arr!1006 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!4816 res!16577) b!18943))

(assert (= (and b!18943 res!16579) b!18946))

(assert (= (and b!18946 (not res!16578)) b!18947))

(assert (= (and b!18947 (not res!16580)) b!18944))

(assert (= start!4816 b!18945))

(declare-fun m!25395 () Bool)

(assert (=> start!4816 m!25395))

(declare-fun m!25397 () Bool)

(assert (=> start!4816 m!25397))

(declare-fun m!25399 () Bool)

(assert (=> b!18945 m!25399))

(declare-fun m!25401 () Bool)

(assert (=> b!18944 m!25401))

(declare-fun m!25403 () Bool)

(assert (=> b!18946 m!25403))

(declare-fun m!25405 () Bool)

(assert (=> b!18946 m!25405))

(declare-fun m!25407 () Bool)

(assert (=> b!18946 m!25407))

(declare-fun m!25409 () Bool)

(assert (=> b!18947 m!25409))

(assert (=> b!18947 m!25409))

(declare-fun m!25411 () Bool)

(assert (=> b!18947 m!25411))

(declare-fun m!25413 () Bool)

(assert (=> b!18943 m!25413))

(push 1)

(assert (not b!18945))

(assert (not b!18946))

(assert (not b!18944))

(assert (not b!18947))

(assert (not start!4816))

(assert (not b!18943))

(check-sat)

(pop 1)

