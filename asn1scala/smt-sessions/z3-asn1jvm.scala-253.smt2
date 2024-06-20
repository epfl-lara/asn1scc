; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4938 () Bool)

(assert start!4938)

(declare-fun b!19582 () Bool)

(declare-fun e!13006 () Bool)

(declare-fun e!13007 () Bool)

(assert (=> b!19582 (= e!13006 e!13007)))

(declare-fun res!17102 () Bool)

(assert (=> b!19582 (=> res!17102 e!13007)))

(declare-datatypes ((array!1405 0))(
  ( (array!1406 (arr!1037 (Array (_ BitVec 32) (_ BitVec 8))) (size!596 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1026 0))(
  ( (BitStream!1027 (buf!899 array!1405) (currentByte!2182 (_ BitVec 32)) (currentBit!2177 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1026)

(declare-datatypes ((Unit!1739 0))(
  ( (Unit!1740) )
))
(declare-datatypes ((tuple2!2244 0))(
  ( (tuple2!2245 (_1!1207 Unit!1739) (_2!1207 BitStream!1026)) )
))
(declare-fun lt!27865 () tuple2!2244)

(declare-fun isPrefixOf!0 (BitStream!1026 BitStream!1026) Bool)

(assert (=> b!19582 (= res!17102 (not (isPrefixOf!0 thiss!1379 (_2!1207 lt!27865))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19582 (validate_offset_bits!1 ((_ sign_extend 32) (size!596 (buf!899 (_2!1207 lt!27865)))) ((_ sign_extend 32) (currentByte!2182 (_2!1207 lt!27865))) ((_ sign_extend 32) (currentBit!2177 (_2!1207 lt!27865))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27861 () Unit!1739)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1026 BitStream!1026 (_ BitVec 64) (_ BitVec 64)) Unit!1739)

(assert (=> b!19582 (= lt!27861 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1207 lt!27865) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1405)

(declare-fun appendBitFromByte!0 (BitStream!1026 (_ BitVec 8) (_ BitVec 32)) tuple2!2244)

(assert (=> b!19582 (= lt!27865 (appendBitFromByte!0 thiss!1379 (select (arr!1037 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!17105 () Bool)

(declare-fun e!13008 () Bool)

(assert (=> start!4938 (=> (not res!17105) (not e!13008))))

(assert (=> start!4938 (= res!17105 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!596 srcBuffer!2))))))))

(assert (=> start!4938 e!13008))

(assert (=> start!4938 true))

(declare-fun array_inv!566 (array!1405) Bool)

(assert (=> start!4938 (array_inv!566 srcBuffer!2)))

(declare-fun e!13005 () Bool)

(declare-fun inv!12 (BitStream!1026) Bool)

(assert (=> start!4938 (and (inv!12 thiss!1379) e!13005)))

(declare-fun b!19583 () Bool)

(declare-fun res!17104 () Bool)

(assert (=> b!19583 (=> (not res!17104) (not e!13008))))

(assert (=> b!19583 (= res!17104 (validate_offset_bits!1 ((_ sign_extend 32) (size!596 (buf!899 thiss!1379))) ((_ sign_extend 32) (currentByte!2182 thiss!1379)) ((_ sign_extend 32) (currentBit!2177 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19584 () Bool)

(assert (=> b!19584 (= e!13008 (not e!13006))))

(declare-fun res!17103 () Bool)

(assert (=> b!19584 (=> res!17103 e!13006)))

(assert (=> b!19584 (= res!17103 (bvsge i!635 to!314))))

(assert (=> b!19584 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27863 () Unit!1739)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1026) Unit!1739)

(assert (=> b!19584 (= lt!27863 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27859 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19584 (= lt!27859 (bitIndex!0 (size!596 (buf!899 thiss!1379)) (currentByte!2182 thiss!1379) (currentBit!2177 thiss!1379)))))

(declare-fun b!19585 () Bool)

(assert (=> b!19585 (= e!13007 true)))

(declare-datatypes ((List!214 0))(
  ( (Nil!211) (Cons!210 (h!329 Bool) (t!964 List!214)) )
))
(declare-fun lt!27860 () List!214)

(declare-datatypes ((tuple2!2246 0))(
  ( (tuple2!2247 (_1!1208 BitStream!1026) (_2!1208 BitStream!1026)) )
))
(declare-fun lt!27862 () tuple2!2246)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1026 BitStream!1026 (_ BitVec 64)) List!214)

(assert (=> b!19585 (= lt!27860 (bitStreamReadBitsIntoList!0 (_2!1207 lt!27865) (_1!1208 lt!27862) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19585 (validate_offset_bits!1 ((_ sign_extend 32) (size!596 (buf!899 (_2!1207 lt!27865)))) ((_ sign_extend 32) (currentByte!2182 thiss!1379)) ((_ sign_extend 32) (currentBit!2177 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27864 () Unit!1739)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1026 array!1405 (_ BitVec 64)) Unit!1739)

(assert (=> b!19585 (= lt!27864 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!899 (_2!1207 lt!27865)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1026 BitStream!1026) tuple2!2246)

(assert (=> b!19585 (= lt!27862 (reader!0 thiss!1379 (_2!1207 lt!27865)))))

(declare-fun b!19586 () Bool)

(assert (=> b!19586 (= e!13005 (array_inv!566 (buf!899 thiss!1379)))))

(assert (= (and start!4938 res!17105) b!19583))

(assert (= (and b!19583 res!17104) b!19584))

(assert (= (and b!19584 (not res!17103)) b!19582))

(assert (= (and b!19582 (not res!17102)) b!19585))

(assert (= start!4938 b!19586))

(declare-fun m!26387 () Bool)

(assert (=> b!19584 m!26387))

(declare-fun m!26389 () Bool)

(assert (=> b!19584 m!26389))

(declare-fun m!26391 () Bool)

(assert (=> b!19584 m!26391))

(declare-fun m!26393 () Bool)

(assert (=> b!19586 m!26393))

(declare-fun m!26395 () Bool)

(assert (=> b!19583 m!26395))

(declare-fun m!26397 () Bool)

(assert (=> b!19582 m!26397))

(declare-fun m!26399 () Bool)

(assert (=> b!19582 m!26399))

(declare-fun m!26401 () Bool)

(assert (=> b!19582 m!26401))

(declare-fun m!26403 () Bool)

(assert (=> b!19582 m!26403))

(assert (=> b!19582 m!26401))

(declare-fun m!26405 () Bool)

(assert (=> b!19582 m!26405))

(declare-fun m!26407 () Bool)

(assert (=> b!19585 m!26407))

(declare-fun m!26409 () Bool)

(assert (=> b!19585 m!26409))

(declare-fun m!26411 () Bool)

(assert (=> b!19585 m!26411))

(declare-fun m!26413 () Bool)

(assert (=> b!19585 m!26413))

(declare-fun m!26415 () Bool)

(assert (=> start!4938 m!26415))

(declare-fun m!26417 () Bool)

(assert (=> start!4938 m!26417))

(check-sat (not b!19583) (not b!19586) (not b!19584) (not start!4938) (not b!19582) (not b!19585))
