; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8468 () Bool)

(assert start!8468)

(declare-fun b!42254 () Bool)

(declare-fun e!28143 () Bool)

(declare-fun e!28147 () Bool)

(assert (=> b!42254 (= e!28143 e!28147)))

(declare-fun res!35943 () Bool)

(assert (=> b!42254 (=> res!35943 e!28147)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!42254 (= res!35943 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!2157 0))(
  ( (array!2158 (arr!1474 (Array (_ BitVec 32) (_ BitVec 8))) (size!975 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1694 0))(
  ( (BitStream!1695 (buf!1306 array!2157) (currentByte!2764 (_ BitVec 32)) (currentBit!2759 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4122 0))(
  ( (tuple2!4123 (_1!2154 BitStream!1694) (_2!2154 BitStream!1694)) )
))
(declare-fun lt!63602 () tuple2!4122)

(declare-datatypes ((tuple2!4124 0))(
  ( (tuple2!4125 (_1!2155 array!2157) (_2!2155 BitStream!1694)) )
))
(declare-fun lt!63606 () tuple2!4124)

(declare-fun readBits!0 (BitStream!1694 (_ BitVec 64)) tuple2!4124)

(assert (=> b!42254 (= lt!63606 (readBits!0 (_1!2154 lt!63602) (bvsub to!314 i!635)))))

(declare-fun thiss!1379 () BitStream!1694)

(declare-fun reader!0 (BitStream!1694 BitStream!1694) tuple2!4122)

(assert (=> b!42254 (= lt!63602 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42255 () Bool)

(declare-fun e!28142 () Bool)

(declare-fun array_inv!900 (array!2157) Bool)

(assert (=> b!42255 (= e!28142 (array_inv!900 (buf!1306 thiss!1379)))))

(declare-fun b!42256 () Bool)

(declare-fun res!35941 () Bool)

(assert (=> b!42256 (=> res!35941 e!28143)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42256 (= res!35941 (not (invariant!0 (currentBit!2759 thiss!1379) (currentByte!2764 thiss!1379) (size!975 (buf!1306 thiss!1379)))))))

(declare-fun b!42257 () Bool)

(declare-fun e!28145 () Bool)

(assert (=> b!42257 (= e!28145 (not e!28143))))

(declare-fun res!35940 () Bool)

(assert (=> b!42257 (=> res!35940 e!28143)))

(declare-fun lt!63605 () (_ BitVec 64))

(assert (=> b!42257 (= res!35940 (or (bvslt i!635 to!314) (not (= lt!63605 (bvsub (bvadd lt!63605 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1694 BitStream!1694) Bool)

(assert (=> b!42257 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3004 0))(
  ( (Unit!3005) )
))
(declare-fun lt!63607 () Unit!3004)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1694) Unit!3004)

(assert (=> b!42257 (= lt!63607 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42257 (= lt!63605 (bitIndex!0 (size!975 (buf!1306 thiss!1379)) (currentByte!2764 thiss!1379) (currentBit!2759 thiss!1379)))))

(declare-fun res!35942 () Bool)

(assert (=> start!8468 (=> (not res!35942) (not e!28145))))

(declare-fun srcBuffer!2 () array!2157)

(assert (=> start!8468 (= res!35942 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!975 srcBuffer!2))))))))

(assert (=> start!8468 e!28145))

(assert (=> start!8468 true))

(assert (=> start!8468 (array_inv!900 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1694) Bool)

(assert (=> start!8468 (and (inv!12 thiss!1379) e!28142)))

(declare-fun b!42258 () Bool)

(declare-fun res!35939 () Bool)

(assert (=> b!42258 (=> (not res!35939) (not e!28145))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42258 (= res!35939 (validate_offset_bits!1 ((_ sign_extend 32) (size!975 (buf!1306 thiss!1379))) ((_ sign_extend 32) (currentByte!2764 thiss!1379)) ((_ sign_extend 32) (currentBit!2759 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42259 () Bool)

(assert (=> b!42259 (= e!28147 true)))

(declare-datatypes ((List!494 0))(
  ( (Nil!491) (Cons!490 (h!609 Bool) (t!1244 List!494)) )
))
(declare-fun lt!63604 () List!494)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1694 BitStream!1694 (_ BitVec 64)) List!494)

(assert (=> b!42259 (= lt!63604 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2154 lt!63602) (bvsub to!314 i!635)))))

(declare-fun lt!63603 () Unit!3004)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1694 array!2157 (_ BitVec 64)) Unit!3004)

(assert (=> b!42259 (= lt!63603 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1306 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun checkByteArrayBitContent!0 (BitStream!1694 array!2157 array!2157 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42259 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2155 lt!63606) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!8468 res!35942) b!42258))

(assert (= (and b!42258 res!35939) b!42257))

(assert (= (and b!42257 (not res!35940)) b!42256))

(assert (= (and b!42256 (not res!35941)) b!42254))

(assert (= (and b!42254 (not res!35943)) b!42259))

(assert (= start!8468 b!42255))

(declare-fun m!64115 () Bool)

(assert (=> b!42259 m!64115))

(declare-fun m!64117 () Bool)

(assert (=> b!42259 m!64117))

(declare-fun m!64119 () Bool)

(assert (=> b!42259 m!64119))

(declare-fun m!64121 () Bool)

(assert (=> b!42256 m!64121))

(declare-fun m!64123 () Bool)

(assert (=> b!42257 m!64123))

(declare-fun m!64125 () Bool)

(assert (=> b!42257 m!64125))

(declare-fun m!64127 () Bool)

(assert (=> b!42257 m!64127))

(declare-fun m!64129 () Bool)

(assert (=> b!42258 m!64129))

(declare-fun m!64131 () Bool)

(assert (=> start!8468 m!64131))

(declare-fun m!64133 () Bool)

(assert (=> start!8468 m!64133))

(declare-fun m!64135 () Bool)

(assert (=> b!42254 m!64135))

(declare-fun m!64137 () Bool)

(assert (=> b!42254 m!64137))

(declare-fun m!64139 () Bool)

(assert (=> b!42255 m!64139))

(push 1)

(assert (not start!8468))

(assert (not b!42256))

(assert (not b!42254))

(assert (not b!42255))

(assert (not b!42258))

(assert (not b!42257))

(assert (not b!42259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

