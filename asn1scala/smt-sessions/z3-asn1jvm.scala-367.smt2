; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8484 () Bool)

(assert start!8484)

(declare-fun b!42398 () Bool)

(declare-fun res!36061 () Bool)

(declare-fun e!28286 () Bool)

(assert (=> b!42398 (=> res!36061 e!28286)))

(declare-datatypes ((array!2173 0))(
  ( (array!2174 (arr!1482 (Array (_ BitVec 32) (_ BitVec 8))) (size!983 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1710 0))(
  ( (BitStream!1711 (buf!1314 array!2173) (currentByte!2772 (_ BitVec 32)) (currentBit!2767 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1710)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42398 (= res!36061 (not (invariant!0 (currentBit!2767 thiss!1379) (currentByte!2772 thiss!1379) (size!983 (buf!1314 thiss!1379)))))))

(declare-fun b!42399 () Bool)

(declare-fun e!28288 () Bool)

(assert (=> b!42399 (= e!28288 (not e!28286))))

(declare-fun res!36060 () Bool)

(assert (=> b!42399 (=> res!36060 e!28286)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!63747 () (_ BitVec 64))

(assert (=> b!42399 (= res!36060 (or (bvslt i!635 to!314) (not (= lt!63747 (bvsub (bvadd lt!63747 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1710 BitStream!1710) Bool)

(assert (=> b!42399 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3020 0))(
  ( (Unit!3021) )
))
(declare-fun lt!63751 () Unit!3020)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1710) Unit!3020)

(assert (=> b!42399 (= lt!63751 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42399 (= lt!63747 (bitIndex!0 (size!983 (buf!1314 thiss!1379)) (currentByte!2772 thiss!1379) (currentBit!2767 thiss!1379)))))

(declare-fun res!36059 () Bool)

(assert (=> start!8484 (=> (not res!36059) (not e!28288))))

(declare-fun srcBuffer!2 () array!2173)

(assert (=> start!8484 (= res!36059 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!983 srcBuffer!2))))))))

(assert (=> start!8484 e!28288))

(assert (=> start!8484 true))

(declare-fun array_inv!908 (array!2173) Bool)

(assert (=> start!8484 (array_inv!908 srcBuffer!2)))

(declare-fun e!28291 () Bool)

(declare-fun inv!12 (BitStream!1710) Bool)

(assert (=> start!8484 (and (inv!12 thiss!1379) e!28291)))

(declare-fun b!42400 () Bool)

(assert (=> b!42400 (= e!28291 (array_inv!908 (buf!1314 thiss!1379)))))

(declare-fun b!42401 () Bool)

(declare-fun e!28287 () Bool)

(assert (=> b!42401 (= e!28287 true)))

(declare-datatypes ((tuple2!4154 0))(
  ( (tuple2!4155 (_1!2170 BitStream!1710) (_2!2170 BitStream!1710)) )
))
(declare-fun lt!63748 () tuple2!4154)

(declare-datatypes ((List!502 0))(
  ( (Nil!499) (Cons!498 (h!617 Bool) (t!1252 List!502)) )
))
(declare-fun lt!63749 () List!502)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1710 BitStream!1710 (_ BitVec 64)) List!502)

(assert (=> b!42401 (= lt!63749 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2170 lt!63748) (bvsub to!314 i!635)))))

(declare-fun lt!63750 () Unit!3020)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1710 array!2173 (_ BitVec 64)) Unit!3020)

(assert (=> b!42401 (= lt!63750 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1314 thiss!1379) (bvsub to!314 i!635)))))

(declare-datatypes ((tuple2!4156 0))(
  ( (tuple2!4157 (_1!2171 array!2173) (_2!2171 BitStream!1710)) )
))
(declare-fun lt!63746 () tuple2!4156)

(declare-fun checkByteArrayBitContent!0 (BitStream!1710 array!2173 array!2173 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42401 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2171 lt!63746) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42402 () Bool)

(declare-fun res!36063 () Bool)

(assert (=> b!42402 (=> (not res!36063) (not e!28288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42402 (= res!36063 (validate_offset_bits!1 ((_ sign_extend 32) (size!983 (buf!1314 thiss!1379))) ((_ sign_extend 32) (currentByte!2772 thiss!1379)) ((_ sign_extend 32) (currentBit!2767 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42403 () Bool)

(assert (=> b!42403 (= e!28286 e!28287)))

(declare-fun res!36062 () Bool)

(assert (=> b!42403 (=> res!36062 e!28287)))

(assert (=> b!42403 (= res!36062 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1710 (_ BitVec 64)) tuple2!4156)

(assert (=> b!42403 (= lt!63746 (readBits!0 (_1!2170 lt!63748) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1710 BitStream!1710) tuple2!4154)

(assert (=> b!42403 (= lt!63748 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!8484 res!36059) b!42402))

(assert (= (and b!42402 res!36063) b!42399))

(assert (= (and b!42399 (not res!36060)) b!42398))

(assert (= (and b!42398 (not res!36061)) b!42403))

(assert (= (and b!42403 (not res!36062)) b!42401))

(assert (= start!8484 b!42400))

(declare-fun m!64323 () Bool)

(assert (=> b!42401 m!64323))

(declare-fun m!64325 () Bool)

(assert (=> b!42401 m!64325))

(declare-fun m!64327 () Bool)

(assert (=> b!42401 m!64327))

(declare-fun m!64329 () Bool)

(assert (=> b!42402 m!64329))

(declare-fun m!64331 () Bool)

(assert (=> b!42403 m!64331))

(declare-fun m!64333 () Bool)

(assert (=> b!42403 m!64333))

(declare-fun m!64335 () Bool)

(assert (=> b!42399 m!64335))

(declare-fun m!64337 () Bool)

(assert (=> b!42399 m!64337))

(declare-fun m!64339 () Bool)

(assert (=> b!42399 m!64339))

(declare-fun m!64341 () Bool)

(assert (=> b!42398 m!64341))

(declare-fun m!64343 () Bool)

(assert (=> start!8484 m!64343))

(declare-fun m!64345 () Bool)

(assert (=> start!8484 m!64345))

(declare-fun m!64347 () Bool)

(assert (=> b!42400 m!64347))

(check-sat (not b!42398) (not b!42399) (not b!42400) (not b!42403) (not b!42402) (not b!42401) (not start!8484))
