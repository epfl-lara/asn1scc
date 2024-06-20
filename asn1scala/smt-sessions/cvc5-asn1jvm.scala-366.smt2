; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8476 () Bool)

(assert start!8476)

(declare-fun b!42326 () Bool)

(declare-fun e!28217 () Bool)

(assert (=> b!42326 (= e!28217 true)))

(declare-datatypes ((List!498 0))(
  ( (Nil!495) (Cons!494 (h!613 Bool) (t!1248 List!498)) )
))
(declare-fun lt!63676 () List!498)

(declare-datatypes ((array!2165 0))(
  ( (array!2166 (arr!1478 (Array (_ BitVec 32) (_ BitVec 8))) (size!979 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1702 0))(
  ( (BitStream!1703 (buf!1310 array!2165) (currentByte!2768 (_ BitVec 32)) (currentBit!2763 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1702)

(declare-datatypes ((tuple2!4138 0))(
  ( (tuple2!4139 (_1!2162 BitStream!1702) (_2!2162 BitStream!1702)) )
))
(declare-fun lt!63675 () tuple2!4138)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1702 BitStream!1702 (_ BitVec 64)) List!498)

(assert (=> b!42326 (= lt!63676 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2162 lt!63675) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!3012 0))(
  ( (Unit!3013) )
))
(declare-fun lt!63677 () Unit!3012)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1702 array!2165 (_ BitVec 64)) Unit!3012)

(assert (=> b!42326 (= lt!63677 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1310 thiss!1379) (bvsub to!314 i!635)))))

(declare-datatypes ((tuple2!4140 0))(
  ( (tuple2!4141 (_1!2163 array!2165) (_2!2163 BitStream!1702)) )
))
(declare-fun lt!63679 () tuple2!4140)

(declare-fun srcBuffer!2 () array!2165)

(declare-fun checkByteArrayBitContent!0 (BitStream!1702 array!2165 array!2165 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42326 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2163 lt!63679) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42327 () Bool)

(declare-fun e!28215 () Bool)

(declare-fun e!28216 () Bool)

(assert (=> b!42327 (= e!28215 (not e!28216))))

(declare-fun res!35999 () Bool)

(assert (=> b!42327 (=> res!35999 e!28216)))

(declare-fun lt!63678 () (_ BitVec 64))

(assert (=> b!42327 (= res!35999 (or (bvslt i!635 to!314) (not (= lt!63678 (bvsub (bvadd lt!63678 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1702 BitStream!1702) Bool)

(assert (=> b!42327 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63674 () Unit!3012)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1702) Unit!3012)

(assert (=> b!42327 (= lt!63674 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42327 (= lt!63678 (bitIndex!0 (size!979 (buf!1310 thiss!1379)) (currentByte!2768 thiss!1379) (currentBit!2763 thiss!1379)))))

(declare-fun b!42328 () Bool)

(assert (=> b!42328 (= e!28216 e!28217)))

(declare-fun res!36001 () Bool)

(assert (=> b!42328 (=> res!36001 e!28217)))

(assert (=> b!42328 (= res!36001 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1702 (_ BitVec 64)) tuple2!4140)

(assert (=> b!42328 (= lt!63679 (readBits!0 (_1!2162 lt!63675) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1702 BitStream!1702) tuple2!4138)

(assert (=> b!42328 (= lt!63675 (reader!0 thiss!1379 thiss!1379))))

(declare-fun res!36003 () Bool)

(assert (=> start!8476 (=> (not res!36003) (not e!28215))))

(assert (=> start!8476 (= res!36003 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!979 srcBuffer!2))))))))

(assert (=> start!8476 e!28215))

(assert (=> start!8476 true))

(declare-fun array_inv!904 (array!2165) Bool)

(assert (=> start!8476 (array_inv!904 srcBuffer!2)))

(declare-fun e!28214 () Bool)

(declare-fun inv!12 (BitStream!1702) Bool)

(assert (=> start!8476 (and (inv!12 thiss!1379) e!28214)))

(declare-fun b!42329 () Bool)

(assert (=> b!42329 (= e!28214 (array_inv!904 (buf!1310 thiss!1379)))))

(declare-fun b!42330 () Bool)

(declare-fun res!36002 () Bool)

(assert (=> b!42330 (=> res!36002 e!28216)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42330 (= res!36002 (not (invariant!0 (currentBit!2763 thiss!1379) (currentByte!2768 thiss!1379) (size!979 (buf!1310 thiss!1379)))))))

(declare-fun b!42331 () Bool)

(declare-fun res!36000 () Bool)

(assert (=> b!42331 (=> (not res!36000) (not e!28215))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42331 (= res!36000 (validate_offset_bits!1 ((_ sign_extend 32) (size!979 (buf!1310 thiss!1379))) ((_ sign_extend 32) (currentByte!2768 thiss!1379)) ((_ sign_extend 32) (currentBit!2763 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8476 res!36003) b!42331))

(assert (= (and b!42331 res!36000) b!42327))

(assert (= (and b!42327 (not res!35999)) b!42330))

(assert (= (and b!42330 (not res!36002)) b!42328))

(assert (= (and b!42328 (not res!36001)) b!42326))

(assert (= start!8476 b!42329))

(declare-fun m!64219 () Bool)

(assert (=> start!8476 m!64219))

(declare-fun m!64221 () Bool)

(assert (=> start!8476 m!64221))

(declare-fun m!64223 () Bool)

(assert (=> b!42329 m!64223))

(declare-fun m!64225 () Bool)

(assert (=> b!42326 m!64225))

(declare-fun m!64227 () Bool)

(assert (=> b!42326 m!64227))

(declare-fun m!64229 () Bool)

(assert (=> b!42326 m!64229))

(declare-fun m!64231 () Bool)

(assert (=> b!42330 m!64231))

(declare-fun m!64233 () Bool)

(assert (=> b!42331 m!64233))

(declare-fun m!64235 () Bool)

(assert (=> b!42327 m!64235))

(declare-fun m!64237 () Bool)

(assert (=> b!42327 m!64237))

(declare-fun m!64239 () Bool)

(assert (=> b!42327 m!64239))

(declare-fun m!64241 () Bool)

(assert (=> b!42328 m!64241))

(declare-fun m!64243 () Bool)

(assert (=> b!42328 m!64243))

(push 1)

(assert (not b!42327))

(assert (not b!42331))

(assert (not b!42330))

(assert (not b!42328))

(assert (not start!8476))

(assert (not b!42329))

(assert (not b!42326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

