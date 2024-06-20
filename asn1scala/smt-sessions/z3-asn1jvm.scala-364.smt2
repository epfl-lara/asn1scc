; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8466 () Bool)

(assert start!8466)

(declare-fun b!42236 () Bool)

(declare-fun e!28129 () Bool)

(declare-fun e!28125 () Bool)

(assert (=> b!42236 (= e!28129 (not e!28125))))

(declare-fun res!35927 () Bool)

(assert (=> b!42236 (=> res!35927 e!28125)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!63588 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!42236 (= res!35927 (or (bvslt i!635 to!314) (not (= lt!63588 (bvsub (bvadd lt!63588 to!314) i!635)))))))

(declare-datatypes ((array!2155 0))(
  ( (array!2156 (arr!1473 (Array (_ BitVec 32) (_ BitVec 8))) (size!974 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1692 0))(
  ( (BitStream!1693 (buf!1305 array!2155) (currentByte!2763 (_ BitVec 32)) (currentBit!2758 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1692)

(declare-fun isPrefixOf!0 (BitStream!1692 BitStream!1692) Bool)

(assert (=> b!42236 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3002 0))(
  ( (Unit!3003) )
))
(declare-fun lt!63586 () Unit!3002)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1692) Unit!3002)

(assert (=> b!42236 (= lt!63586 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42236 (= lt!63588 (bitIndex!0 (size!974 (buf!1305 thiss!1379)) (currentByte!2763 thiss!1379) (currentBit!2758 thiss!1379)))))

(declare-fun b!42237 () Bool)

(declare-fun res!35928 () Bool)

(assert (=> b!42237 (=> res!35928 e!28125)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42237 (= res!35928 (not (invariant!0 (currentBit!2758 thiss!1379) (currentByte!2763 thiss!1379) (size!974 (buf!1305 thiss!1379)))))))

(declare-fun b!42239 () Bool)

(declare-fun res!35924 () Bool)

(assert (=> b!42239 (=> (not res!35924) (not e!28129))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42239 (= res!35924 (validate_offset_bits!1 ((_ sign_extend 32) (size!974 (buf!1305 thiss!1379))) ((_ sign_extend 32) (currentByte!2763 thiss!1379)) ((_ sign_extend 32) (currentBit!2758 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42240 () Bool)

(declare-fun e!28127 () Bool)

(assert (=> b!42240 (= e!28125 e!28127)))

(declare-fun res!35926 () Bool)

(assert (=> b!42240 (=> res!35926 e!28127)))

(assert (=> b!42240 (= res!35926 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4118 0))(
  ( (tuple2!4119 (_1!2152 BitStream!1692) (_2!2152 BitStream!1692)) )
))
(declare-fun lt!63589 () tuple2!4118)

(declare-datatypes ((tuple2!4120 0))(
  ( (tuple2!4121 (_1!2153 array!2155) (_2!2153 BitStream!1692)) )
))
(declare-fun lt!63587 () tuple2!4120)

(declare-fun readBits!0 (BitStream!1692 (_ BitVec 64)) tuple2!4120)

(assert (=> b!42240 (= lt!63587 (readBits!0 (_1!2152 lt!63589) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1692 BitStream!1692) tuple2!4118)

(assert (=> b!42240 (= lt!63589 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42241 () Bool)

(assert (=> b!42241 (= e!28127 true)))

(declare-datatypes ((List!493 0))(
  ( (Nil!490) (Cons!489 (h!608 Bool) (t!1243 List!493)) )
))
(declare-fun lt!63584 () List!493)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1692 BitStream!1692 (_ BitVec 64)) List!493)

(assert (=> b!42241 (= lt!63584 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2152 lt!63589) (bvsub to!314 i!635)))))

(declare-fun lt!63585 () Unit!3002)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1692 array!2155 (_ BitVec 64)) Unit!3002)

(assert (=> b!42241 (= lt!63585 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1305 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2155)

(declare-fun checkByteArrayBitContent!0 (BitStream!1692 array!2155 array!2155 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42241 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2153 lt!63587) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!42238 () Bool)

(declare-fun e!28128 () Bool)

(declare-fun array_inv!899 (array!2155) Bool)

(assert (=> b!42238 (= e!28128 (array_inv!899 (buf!1305 thiss!1379)))))

(declare-fun res!35925 () Bool)

(assert (=> start!8466 (=> (not res!35925) (not e!28129))))

(assert (=> start!8466 (= res!35925 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!974 srcBuffer!2))))))))

(assert (=> start!8466 e!28129))

(assert (=> start!8466 true))

(assert (=> start!8466 (array_inv!899 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1692) Bool)

(assert (=> start!8466 (and (inv!12 thiss!1379) e!28128)))

(assert (= (and start!8466 res!35925) b!42239))

(assert (= (and b!42239 res!35924) b!42236))

(assert (= (and b!42236 (not res!35927)) b!42237))

(assert (= (and b!42237 (not res!35928)) b!42240))

(assert (= (and b!42240 (not res!35926)) b!42241))

(assert (= start!8466 b!42238))

(declare-fun m!64089 () Bool)

(assert (=> start!8466 m!64089))

(declare-fun m!64091 () Bool)

(assert (=> start!8466 m!64091))

(declare-fun m!64093 () Bool)

(assert (=> b!42240 m!64093))

(declare-fun m!64095 () Bool)

(assert (=> b!42240 m!64095))

(declare-fun m!64097 () Bool)

(assert (=> b!42237 m!64097))

(declare-fun m!64099 () Bool)

(assert (=> b!42236 m!64099))

(declare-fun m!64101 () Bool)

(assert (=> b!42236 m!64101))

(declare-fun m!64103 () Bool)

(assert (=> b!42236 m!64103))

(declare-fun m!64105 () Bool)

(assert (=> b!42239 m!64105))

(declare-fun m!64107 () Bool)

(assert (=> b!42241 m!64107))

(declare-fun m!64109 () Bool)

(assert (=> b!42241 m!64109))

(declare-fun m!64111 () Bool)

(assert (=> b!42241 m!64111))

(declare-fun m!64113 () Bool)

(assert (=> b!42238 m!64113))

(check-sat (not b!42241) (not b!42237) (not start!8466) (not b!42239) (not b!42236) (not b!42238) (not b!42240))
