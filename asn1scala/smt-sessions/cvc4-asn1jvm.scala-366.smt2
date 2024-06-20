; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8480 () Bool)

(assert start!8480)

(declare-fun b!42362 () Bool)

(declare-fun e!28250 () Bool)

(assert (=> b!42362 (= e!28250 true)))

(declare-datatypes ((array!2169 0))(
  ( (array!2170 (arr!1480 (Array (_ BitVec 32) (_ BitVec 8))) (size!981 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1706 0))(
  ( (BitStream!1707 (buf!1312 array!2169) (currentByte!2770 (_ BitVec 32)) (currentBit!2765 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1706)

(declare-datatypes ((List!500 0))(
  ( (Nil!497) (Cons!496 (h!615 Bool) (t!1250 List!500)) )
))
(declare-fun lt!63713 () List!500)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!4146 0))(
  ( (tuple2!4147 (_1!2166 BitStream!1706) (_2!2166 BitStream!1706)) )
))
(declare-fun lt!63715 () tuple2!4146)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1706 BitStream!1706 (_ BitVec 64)) List!500)

(assert (=> b!42362 (= lt!63713 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2166 lt!63715) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!3016 0))(
  ( (Unit!3017) )
))
(declare-fun lt!63712 () Unit!3016)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1706 array!2169 (_ BitVec 64)) Unit!3016)

(assert (=> b!42362 (= lt!63712 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1312 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2169)

(declare-datatypes ((tuple2!4148 0))(
  ( (tuple2!4149 (_1!2167 array!2169) (_2!2167 BitStream!1706)) )
))
(declare-fun lt!63714 () tuple2!4148)

(declare-fun checkByteArrayBitContent!0 (BitStream!1706 array!2169 array!2169 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42362 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2167 lt!63714) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42363 () Bool)

(declare-fun e!28254 () Bool)

(declare-fun e!28252 () Bool)

(assert (=> b!42363 (= e!28254 (not e!28252))))

(declare-fun res!36032 () Bool)

(assert (=> b!42363 (=> res!36032 e!28252)))

(declare-fun lt!63711 () (_ BitVec 64))

(assert (=> b!42363 (= res!36032 (or (bvslt i!635 to!314) (not (= lt!63711 (bvsub (bvadd lt!63711 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1706 BitStream!1706) Bool)

(assert (=> b!42363 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63710 () Unit!3016)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1706) Unit!3016)

(assert (=> b!42363 (= lt!63710 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42363 (= lt!63711 (bitIndex!0 (size!981 (buf!1312 thiss!1379)) (currentByte!2770 thiss!1379) (currentBit!2765 thiss!1379)))))

(declare-fun b!42364 () Bool)

(declare-fun res!36030 () Bool)

(assert (=> b!42364 (=> res!36030 e!28252)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42364 (= res!36030 (not (invariant!0 (currentBit!2765 thiss!1379) (currentByte!2770 thiss!1379) (size!981 (buf!1312 thiss!1379)))))))

(declare-fun res!36033 () Bool)

(assert (=> start!8480 (=> (not res!36033) (not e!28254))))

(assert (=> start!8480 (= res!36033 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!981 srcBuffer!2))))))))

(assert (=> start!8480 e!28254))

(assert (=> start!8480 true))

(declare-fun array_inv!906 (array!2169) Bool)

(assert (=> start!8480 (array_inv!906 srcBuffer!2)))

(declare-fun e!28251 () Bool)

(declare-fun inv!12 (BitStream!1706) Bool)

(assert (=> start!8480 (and (inv!12 thiss!1379) e!28251)))

(declare-fun b!42365 () Bool)

(assert (=> b!42365 (= e!28252 e!28250)))

(declare-fun res!36031 () Bool)

(assert (=> b!42365 (=> res!36031 e!28250)))

(assert (=> b!42365 (= res!36031 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1706 (_ BitVec 64)) tuple2!4148)

(assert (=> b!42365 (= lt!63714 (readBits!0 (_1!2166 lt!63715) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1706 BitStream!1706) tuple2!4146)

(assert (=> b!42365 (= lt!63715 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42366 () Bool)

(assert (=> b!42366 (= e!28251 (array_inv!906 (buf!1312 thiss!1379)))))

(declare-fun b!42367 () Bool)

(declare-fun res!36029 () Bool)

(assert (=> b!42367 (=> (not res!36029) (not e!28254))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42367 (= res!36029 (validate_offset_bits!1 ((_ sign_extend 32) (size!981 (buf!1312 thiss!1379))) ((_ sign_extend 32) (currentByte!2770 thiss!1379)) ((_ sign_extend 32) (currentBit!2765 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8480 res!36033) b!42367))

(assert (= (and b!42367 res!36029) b!42363))

(assert (= (and b!42363 (not res!36032)) b!42364))

(assert (= (and b!42364 (not res!36030)) b!42365))

(assert (= (and b!42365 (not res!36031)) b!42362))

(assert (= start!8480 b!42366))

(declare-fun m!64271 () Bool)

(assert (=> start!8480 m!64271))

(declare-fun m!64273 () Bool)

(assert (=> start!8480 m!64273))

(declare-fun m!64275 () Bool)

(assert (=> b!42367 m!64275))

(declare-fun m!64277 () Bool)

(assert (=> b!42363 m!64277))

(declare-fun m!64279 () Bool)

(assert (=> b!42363 m!64279))

(declare-fun m!64281 () Bool)

(assert (=> b!42363 m!64281))

(declare-fun m!64283 () Bool)

(assert (=> b!42362 m!64283))

(declare-fun m!64285 () Bool)

(assert (=> b!42362 m!64285))

(declare-fun m!64287 () Bool)

(assert (=> b!42362 m!64287))

(declare-fun m!64289 () Bool)

(assert (=> b!42366 m!64289))

(declare-fun m!64291 () Bool)

(assert (=> b!42365 m!64291))

(declare-fun m!64293 () Bool)

(assert (=> b!42365 m!64293))

(declare-fun m!64295 () Bool)

(assert (=> b!42364 m!64295))

(push 1)

(assert (not b!42363))

(assert (not start!8480))

(assert (not b!42367))

(assert (not b!42364))

