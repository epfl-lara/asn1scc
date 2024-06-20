; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8474 () Bool)

(assert start!8474)

(declare-fun b!42308 () Bool)

(declare-fun e!28196 () Bool)

(assert (=> b!42308 (= e!28196 true)))

(declare-datatypes ((array!2163 0))(
  ( (array!2164 (arr!1477 (Array (_ BitVec 32) (_ BitVec 8))) (size!978 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1700 0))(
  ( (BitStream!1701 (buf!1309 array!2163) (currentByte!2767 (_ BitVec 32)) (currentBit!2762 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1700)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!4134 0))(
  ( (tuple2!4135 (_1!2160 BitStream!1700) (_2!2160 BitStream!1700)) )
))
(declare-fun lt!63658 () tuple2!4134)

(declare-datatypes ((List!497 0))(
  ( (Nil!494) (Cons!493 (h!612 Bool) (t!1247 List!497)) )
))
(declare-fun lt!63660 () List!497)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1700 BitStream!1700 (_ BitVec 64)) List!497)

(assert (=> b!42308 (= lt!63660 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2160 lt!63658) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!3010 0))(
  ( (Unit!3011) )
))
(declare-fun lt!63659 () Unit!3010)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1700 array!2163 (_ BitVec 64)) Unit!3010)

(assert (=> b!42308 (= lt!63659 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1309 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2163)

(declare-datatypes ((tuple2!4136 0))(
  ( (tuple2!4137 (_1!2161 array!2163) (_2!2161 BitStream!1700)) )
))
(declare-fun lt!63661 () tuple2!4136)

(declare-fun checkByteArrayBitContent!0 (BitStream!1700 array!2163 array!2163 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42308 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2161 lt!63661) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42309 () Bool)

(declare-fun e!28199 () Bool)

(declare-fun e!28200 () Bool)

(assert (=> b!42309 (= e!28199 (not e!28200))))

(declare-fun res!35984 () Bool)

(assert (=> b!42309 (=> res!35984 e!28200)))

(declare-fun lt!63656 () (_ BitVec 64))

(assert (=> b!42309 (= res!35984 (or (bvslt i!635 to!314) (not (= lt!63656 (bvsub (bvadd lt!63656 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1700 BitStream!1700) Bool)

(assert (=> b!42309 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63657 () Unit!3010)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1700) Unit!3010)

(assert (=> b!42309 (= lt!63657 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42309 (= lt!63656 (bitIndex!0 (size!978 (buf!1309 thiss!1379)) (currentByte!2767 thiss!1379) (currentBit!2762 thiss!1379)))))

(declare-fun res!35988 () Bool)

(assert (=> start!8474 (=> (not res!35988) (not e!28199))))

(assert (=> start!8474 (= res!35988 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!978 srcBuffer!2))))))))

(assert (=> start!8474 e!28199))

(assert (=> start!8474 true))

(declare-fun array_inv!903 (array!2163) Bool)

(assert (=> start!8474 (array_inv!903 srcBuffer!2)))

(declare-fun e!28198 () Bool)

(declare-fun inv!12 (BitStream!1700) Bool)

(assert (=> start!8474 (and (inv!12 thiss!1379) e!28198)))

(declare-fun b!42310 () Bool)

(declare-fun res!35985 () Bool)

(assert (=> b!42310 (=> res!35985 e!28200)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42310 (= res!35985 (not (invariant!0 (currentBit!2762 thiss!1379) (currentByte!2767 thiss!1379) (size!978 (buf!1309 thiss!1379)))))))

(declare-fun b!42311 () Bool)

(assert (=> b!42311 (= e!28198 (array_inv!903 (buf!1309 thiss!1379)))))

(declare-fun b!42312 () Bool)

(declare-fun res!35987 () Bool)

(assert (=> b!42312 (=> (not res!35987) (not e!28199))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42312 (= res!35987 (validate_offset_bits!1 ((_ sign_extend 32) (size!978 (buf!1309 thiss!1379))) ((_ sign_extend 32) (currentByte!2767 thiss!1379)) ((_ sign_extend 32) (currentBit!2762 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42313 () Bool)

(assert (=> b!42313 (= e!28200 e!28196)))

(declare-fun res!35986 () Bool)

(assert (=> b!42313 (=> res!35986 e!28196)))

(assert (=> b!42313 (= res!35986 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1700 (_ BitVec 64)) tuple2!4136)

(assert (=> b!42313 (= lt!63661 (readBits!0 (_1!2160 lt!63658) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1700 BitStream!1700) tuple2!4134)

(assert (=> b!42313 (= lt!63658 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!8474 res!35988) b!42312))

(assert (= (and b!42312 res!35987) b!42309))

(assert (= (and b!42309 (not res!35984)) b!42310))

(assert (= (and b!42310 (not res!35985)) b!42313))

(assert (= (and b!42313 (not res!35986)) b!42308))

(assert (= start!8474 b!42311))

(declare-fun m!64193 () Bool)

(assert (=> b!42309 m!64193))

(declare-fun m!64195 () Bool)

(assert (=> b!42309 m!64195))

(declare-fun m!64197 () Bool)

(assert (=> b!42309 m!64197))

(declare-fun m!64199 () Bool)

(assert (=> b!42310 m!64199))

(declare-fun m!64201 () Bool)

(assert (=> start!8474 m!64201))

(declare-fun m!64203 () Bool)

(assert (=> start!8474 m!64203))

(declare-fun m!64205 () Bool)

(assert (=> b!42308 m!64205))

(declare-fun m!64207 () Bool)

(assert (=> b!42308 m!64207))

(declare-fun m!64209 () Bool)

(assert (=> b!42308 m!64209))

(declare-fun m!64211 () Bool)

(assert (=> b!42311 m!64211))

(declare-fun m!64213 () Bool)

(assert (=> b!42313 m!64213))

(declare-fun m!64215 () Bool)

(assert (=> b!42313 m!64215))

(declare-fun m!64217 () Bool)

(assert (=> b!42312 m!64217))

(push 1)

