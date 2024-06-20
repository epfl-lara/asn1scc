; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8482 () Bool)

(assert start!8482)

(declare-fun b!42380 () Bool)

(declare-fun res!36046 () Bool)

(declare-fun e!28272 () Bool)

(assert (=> b!42380 (=> res!36046 e!28272)))

(declare-datatypes ((array!2171 0))(
  ( (array!2172 (arr!1481 (Array (_ BitVec 32) (_ BitVec 8))) (size!982 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1708 0))(
  ( (BitStream!1709 (buf!1313 array!2171) (currentByte!2771 (_ BitVec 32)) (currentBit!2766 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1708)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42380 (= res!36046 (not (invariant!0 (currentBit!2766 thiss!1379) (currentByte!2771 thiss!1379) (size!982 (buf!1313 thiss!1379)))))))

(declare-fun b!42381 () Bool)

(declare-fun e!28273 () Bool)

(assert (=> b!42381 (= e!28273 true)))

(declare-datatypes ((tuple2!4150 0))(
  ( (tuple2!4151 (_1!2168 BitStream!1708) (_2!2168 BitStream!1708)) )
))
(declare-fun lt!63733 () tuple2!4150)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((List!501 0))(
  ( (Nil!498) (Cons!497 (h!616 Bool) (t!1251 List!501)) )
))
(declare-fun lt!63728 () List!501)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1708 BitStream!1708 (_ BitVec 64)) List!501)

(assert (=> b!42381 (= lt!63728 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2168 lt!63733) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!3018 0))(
  ( (Unit!3019) )
))
(declare-fun lt!63731 () Unit!3018)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1708 array!2171 (_ BitVec 64)) Unit!3018)

(assert (=> b!42381 (= lt!63731 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1313 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2171)

(declare-datatypes ((tuple2!4152 0))(
  ( (tuple2!4153 (_1!2169 array!2171) (_2!2169 BitStream!1708)) )
))
(declare-fun lt!63729 () tuple2!4152)

(declare-fun checkByteArrayBitContent!0 (BitStream!1708 array!2171 array!2171 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42381 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2169 lt!63729) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42382 () Bool)

(declare-fun res!36044 () Bool)

(declare-fun e!28271 () Bool)

(assert (=> b!42382 (=> (not res!36044) (not e!28271))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42382 (= res!36044 (validate_offset_bits!1 ((_ sign_extend 32) (size!982 (buf!1313 thiss!1379))) ((_ sign_extend 32) (currentByte!2771 thiss!1379)) ((_ sign_extend 32) (currentBit!2766 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!36048 () Bool)

(assert (=> start!8482 (=> (not res!36048) (not e!28271))))

(assert (=> start!8482 (= res!36048 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!982 srcBuffer!2))))))))

(assert (=> start!8482 e!28271))

(assert (=> start!8482 true))

(declare-fun array_inv!907 (array!2171) Bool)

(assert (=> start!8482 (array_inv!907 srcBuffer!2)))

(declare-fun e!28269 () Bool)

(declare-fun inv!12 (BitStream!1708) Bool)

(assert (=> start!8482 (and (inv!12 thiss!1379) e!28269)))

(declare-fun b!42383 () Bool)

(assert (=> b!42383 (= e!28271 (not e!28272))))

(declare-fun res!36045 () Bool)

(assert (=> b!42383 (=> res!36045 e!28272)))

(declare-fun lt!63732 () (_ BitVec 64))

(assert (=> b!42383 (= res!36045 (or (bvslt i!635 to!314) (not (= lt!63732 (bvsub (bvadd lt!63732 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1708 BitStream!1708) Bool)

(assert (=> b!42383 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63730 () Unit!3018)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1708) Unit!3018)

(assert (=> b!42383 (= lt!63730 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42383 (= lt!63732 (bitIndex!0 (size!982 (buf!1313 thiss!1379)) (currentByte!2771 thiss!1379) (currentBit!2766 thiss!1379)))))

(declare-fun b!42384 () Bool)

(assert (=> b!42384 (= e!28269 (array_inv!907 (buf!1313 thiss!1379)))))

(declare-fun b!42385 () Bool)

(assert (=> b!42385 (= e!28272 e!28273)))

(declare-fun res!36047 () Bool)

(assert (=> b!42385 (=> res!36047 e!28273)))

(assert (=> b!42385 (= res!36047 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1708 (_ BitVec 64)) tuple2!4152)

(assert (=> b!42385 (= lt!63729 (readBits!0 (_1!2168 lt!63733) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1708 BitStream!1708) tuple2!4150)

(assert (=> b!42385 (= lt!63733 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!8482 res!36048) b!42382))

(assert (= (and b!42382 res!36044) b!42383))

(assert (= (and b!42383 (not res!36045)) b!42380))

(assert (= (and b!42380 (not res!36046)) b!42385))

(assert (= (and b!42385 (not res!36047)) b!42381))

(assert (= start!8482 b!42384))

(declare-fun m!64297 () Bool)

(assert (=> b!42381 m!64297))

(declare-fun m!64299 () Bool)

(assert (=> b!42381 m!64299))

(declare-fun m!64301 () Bool)

(assert (=> b!42381 m!64301))

(declare-fun m!64303 () Bool)

(assert (=> b!42382 m!64303))

(declare-fun m!64305 () Bool)

(assert (=> b!42384 m!64305))

(declare-fun m!64307 () Bool)

(assert (=> b!42383 m!64307))

(declare-fun m!64309 () Bool)

(assert (=> b!42383 m!64309))

(declare-fun m!64311 () Bool)

(assert (=> b!42383 m!64311))

(declare-fun m!64313 () Bool)

(assert (=> start!8482 m!64313))

(declare-fun m!64315 () Bool)

(assert (=> start!8482 m!64315))

(declare-fun m!64317 () Bool)

(assert (=> b!42380 m!64317))

(declare-fun m!64319 () Bool)

(assert (=> b!42385 m!64319))

(declare-fun m!64321 () Bool)

(assert (=> b!42385 m!64321))

(push 1)

(assert (not b!42382))

(assert (not b!42380))

(assert (not b!42381))

(assert (not b!42383))

(assert (not b!42385))

(assert (not b!42384))

(assert (not start!8482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

