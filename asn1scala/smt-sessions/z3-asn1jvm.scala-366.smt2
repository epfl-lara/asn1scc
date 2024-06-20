; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8478 () Bool)

(assert start!8478)

(declare-fun b!42344 () Bool)

(declare-fun res!36018 () Bool)

(declare-fun e!28236 () Bool)

(assert (=> b!42344 (=> (not res!36018) (not e!28236))))

(declare-datatypes ((array!2167 0))(
  ( (array!2168 (arr!1479 (Array (_ BitVec 32) (_ BitVec 8))) (size!980 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1704 0))(
  ( (BitStream!1705 (buf!1311 array!2167) (currentByte!2769 (_ BitVec 32)) (currentBit!2764 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1704)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42344 (= res!36018 (validate_offset_bits!1 ((_ sign_extend 32) (size!980 (buf!1311 thiss!1379))) ((_ sign_extend 32) (currentByte!2769 thiss!1379)) ((_ sign_extend 32) (currentBit!2764 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42345 () Bool)

(declare-fun e!28232 () Bool)

(assert (=> b!42345 (= e!28232 true)))

(declare-datatypes ((tuple2!4142 0))(
  ( (tuple2!4143 (_1!2164 BitStream!1704) (_2!2164 BitStream!1704)) )
))
(declare-fun lt!63693 () tuple2!4142)

(declare-datatypes ((List!499 0))(
  ( (Nil!496) (Cons!495 (h!614 Bool) (t!1249 List!499)) )
))
(declare-fun lt!63692 () List!499)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1704 BitStream!1704 (_ BitVec 64)) List!499)

(assert (=> b!42345 (= lt!63692 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2164 lt!63693) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!3014 0))(
  ( (Unit!3015) )
))
(declare-fun lt!63697 () Unit!3014)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1704 array!2167 (_ BitVec 64)) Unit!3014)

(assert (=> b!42345 (= lt!63697 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1311 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2167)

(declare-datatypes ((tuple2!4144 0))(
  ( (tuple2!4145 (_1!2165 array!2167) (_2!2165 BitStream!1704)) )
))
(declare-fun lt!63694 () tuple2!4144)

(declare-fun checkByteArrayBitContent!0 (BitStream!1704 array!2167 array!2167 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42345 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2165 lt!63694) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42346 () Bool)

(declare-fun e!28237 () Bool)

(declare-fun array_inv!905 (array!2167) Bool)

(assert (=> b!42346 (= e!28237 (array_inv!905 (buf!1311 thiss!1379)))))

(declare-fun b!42347 () Bool)

(declare-fun e!28234 () Bool)

(assert (=> b!42347 (= e!28236 (not e!28234))))

(declare-fun res!36014 () Bool)

(assert (=> b!42347 (=> res!36014 e!28234)))

(declare-fun lt!63696 () (_ BitVec 64))

(assert (=> b!42347 (= res!36014 (or (bvslt i!635 to!314) (not (= lt!63696 (bvsub (bvadd lt!63696 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1704 BitStream!1704) Bool)

(assert (=> b!42347 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63695 () Unit!3014)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1704) Unit!3014)

(assert (=> b!42347 (= lt!63695 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42347 (= lt!63696 (bitIndex!0 (size!980 (buf!1311 thiss!1379)) (currentByte!2769 thiss!1379) (currentBit!2764 thiss!1379)))))

(declare-fun b!42348 () Bool)

(declare-fun res!36015 () Bool)

(assert (=> b!42348 (=> res!36015 e!28234)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42348 (= res!36015 (not (invariant!0 (currentBit!2764 thiss!1379) (currentByte!2769 thiss!1379) (size!980 (buf!1311 thiss!1379)))))))

(declare-fun b!42349 () Bool)

(assert (=> b!42349 (= e!28234 e!28232)))

(declare-fun res!36016 () Bool)

(assert (=> b!42349 (=> res!36016 e!28232)))

(assert (=> b!42349 (= res!36016 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1704 (_ BitVec 64)) tuple2!4144)

(assert (=> b!42349 (= lt!63694 (readBits!0 (_1!2164 lt!63693) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1704 BitStream!1704) tuple2!4142)

(assert (=> b!42349 (= lt!63693 (reader!0 thiss!1379 thiss!1379))))

(declare-fun res!36017 () Bool)

(assert (=> start!8478 (=> (not res!36017) (not e!28236))))

(assert (=> start!8478 (= res!36017 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!980 srcBuffer!2))))))))

(assert (=> start!8478 e!28236))

(assert (=> start!8478 true))

(assert (=> start!8478 (array_inv!905 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1704) Bool)

(assert (=> start!8478 (and (inv!12 thiss!1379) e!28237)))

(assert (= (and start!8478 res!36017) b!42344))

(assert (= (and b!42344 res!36018) b!42347))

(assert (= (and b!42347 (not res!36014)) b!42348))

(assert (= (and b!42348 (not res!36015)) b!42349))

(assert (= (and b!42349 (not res!36016)) b!42345))

(assert (= start!8478 b!42346))

(declare-fun m!64245 () Bool)

(assert (=> b!42346 m!64245))

(declare-fun m!64247 () Bool)

(assert (=> b!42345 m!64247))

(declare-fun m!64249 () Bool)

(assert (=> b!42345 m!64249))

(declare-fun m!64251 () Bool)

(assert (=> b!42345 m!64251))

(declare-fun m!64253 () Bool)

(assert (=> b!42344 m!64253))

(declare-fun m!64255 () Bool)

(assert (=> b!42348 m!64255))

(declare-fun m!64257 () Bool)

(assert (=> start!8478 m!64257))

(declare-fun m!64259 () Bool)

(assert (=> start!8478 m!64259))

(declare-fun m!64261 () Bool)

(assert (=> b!42349 m!64261))

(declare-fun m!64263 () Bool)

(assert (=> b!42349 m!64263))

(declare-fun m!64265 () Bool)

(assert (=> b!42347 m!64265))

(declare-fun m!64267 () Bool)

(assert (=> b!42347 m!64267))

(declare-fun m!64269 () Bool)

(assert (=> b!42347 m!64269))

(check-sat (not b!42346) (not b!42347) (not b!42348) (not b!42344) (not b!42349) (not b!42345) (not start!8478))
