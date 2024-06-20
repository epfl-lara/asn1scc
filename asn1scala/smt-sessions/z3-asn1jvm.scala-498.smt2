; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14750 () Bool)

(assert start!14750)

(declare-fun b!75971 () Bool)

(declare-fun e!49751 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!75971 (= e!49751 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((array!3117 0))(
  ( (array!3118 (arr!2050 (Array (_ BitVec 32) (_ BitVec 8))) (size!1452 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2478 0))(
  ( (BitStream!2479 (buf!1833 array!3117) (currentByte!3624 (_ BitVec 32)) (currentBit!3619 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2478)

(declare-datatypes ((Unit!5004 0))(
  ( (Unit!5005) )
))
(declare-fun lt!122007 () Unit!5004)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2478 array!3117 (_ BitVec 64)) Unit!5004)

(assert (=> b!75971 (= lt!122007 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1833 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!3117)

(declare-datatypes ((tuple2!6566 0))(
  ( (tuple2!6567 (_1!3414 array!3117) (_2!3414 BitStream!2478)) )
))
(declare-fun lt!122008 () tuple2!6566)

(declare-fun checkByteArrayBitContent!0 (BitStream!2478 array!3117 array!3117 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75971 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3414 lt!122008) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75972 () Bool)

(declare-fun e!49752 () Bool)

(assert (=> b!75972 (= e!49752 e!49751)))

(declare-fun res!62818 () Bool)

(assert (=> b!75972 (=> res!62818 e!49751)))

(assert (=> b!75972 (= res!62818 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2478 (_ BitVec 64)) tuple2!6566)

(declare-datatypes ((tuple2!6568 0))(
  ( (tuple2!6569 (_1!3415 BitStream!2478) (_2!3415 BitStream!2478)) )
))
(declare-fun reader!0 (BitStream!2478 BitStream!2478) tuple2!6568)

(assert (=> b!75972 (= lt!122008 (readBits!0 (_1!3415 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75973 () Bool)

(declare-fun e!49750 () Bool)

(declare-fun array_inv!1298 (array!3117) Bool)

(assert (=> b!75973 (= e!49750 (array_inv!1298 (buf!1833 thiss!1379)))))

(declare-fun b!75974 () Bool)

(declare-fun e!49749 () Bool)

(assert (=> b!75974 (= e!49749 (not e!49752))))

(declare-fun res!62816 () Bool)

(assert (=> b!75974 (=> res!62816 e!49752)))

(declare-fun lt!122009 () (_ BitVec 64))

(assert (=> b!75974 (= res!62816 (or (bvslt i!635 to!314) (not (= lt!122009 (bvsub (bvadd lt!122009 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2478 BitStream!2478) Bool)

(assert (=> b!75974 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!122010 () Unit!5004)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2478) Unit!5004)

(assert (=> b!75974 (= lt!122010 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75974 (= lt!122009 (bitIndex!0 (size!1452 (buf!1833 thiss!1379)) (currentByte!3624 thiss!1379) (currentBit!3619 thiss!1379)))))

(declare-fun b!75975 () Bool)

(declare-fun res!62817 () Bool)

(assert (=> b!75975 (=> (not res!62817) (not e!49749))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75975 (= res!62817 (validate_offset_bits!1 ((_ sign_extend 32) (size!1452 (buf!1833 thiss!1379))) ((_ sign_extend 32) (currentByte!3624 thiss!1379)) ((_ sign_extend 32) (currentBit!3619 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75970 () Bool)

(declare-fun res!62814 () Bool)

(assert (=> b!75970 (=> res!62814 e!49752)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75970 (= res!62814 (not (invariant!0 (currentBit!3619 thiss!1379) (currentByte!3624 thiss!1379) (size!1452 (buf!1833 thiss!1379)))))))

(declare-fun res!62815 () Bool)

(assert (=> start!14750 (=> (not res!62815) (not e!49749))))

(assert (=> start!14750 (= res!62815 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1452 srcBuffer!2))))))))

(assert (=> start!14750 e!49749))

(assert (=> start!14750 true))

(assert (=> start!14750 (array_inv!1298 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2478) Bool)

(assert (=> start!14750 (and (inv!12 thiss!1379) e!49750)))

(assert (= (and start!14750 res!62815) b!75975))

(assert (= (and b!75975 res!62817) b!75974))

(assert (= (and b!75974 (not res!62816)) b!75970))

(assert (= (and b!75970 (not res!62814)) b!75972))

(assert (= (and b!75972 (not res!62818)) b!75971))

(assert (= start!14750 b!75973))

(declare-fun m!121109 () Bool)

(assert (=> start!14750 m!121109))

(declare-fun m!121111 () Bool)

(assert (=> start!14750 m!121111))

(declare-fun m!121113 () Bool)

(assert (=> b!75972 m!121113))

(declare-fun m!121115 () Bool)

(assert (=> b!75972 m!121115))

(declare-fun m!121117 () Bool)

(assert (=> b!75973 m!121117))

(declare-fun m!121119 () Bool)

(assert (=> b!75974 m!121119))

(declare-fun m!121121 () Bool)

(assert (=> b!75974 m!121121))

(declare-fun m!121123 () Bool)

(assert (=> b!75974 m!121123))

(declare-fun m!121125 () Bool)

(assert (=> b!75970 m!121125))

(declare-fun m!121127 () Bool)

(assert (=> b!75975 m!121127))

(declare-fun m!121129 () Bool)

(assert (=> b!75971 m!121129))

(declare-fun m!121131 () Bool)

(assert (=> b!75971 m!121131))

(check-sat (not b!75975) (not b!75972) (not b!75973) (not start!14750) (not b!75970) (not b!75974) (not b!75971))
