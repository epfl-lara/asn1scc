; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14738 () Bool)

(assert start!14738)

(declare-fun res!62728 () Bool)

(declare-fun e!49643 () Bool)

(assert (=> start!14738 (=> (not res!62728) (not e!49643))))

(declare-datatypes ((array!3105 0))(
  ( (array!3106 (arr!2044 (Array (_ BitVec 32) (_ BitVec 8))) (size!1446 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3105)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14738 (= res!62728 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1446 srcBuffer!2))))))))

(assert (=> start!14738 e!49643))

(assert (=> start!14738 true))

(declare-fun array_inv!1292 (array!3105) Bool)

(assert (=> start!14738 (array_inv!1292 srcBuffer!2)))

(declare-datatypes ((BitStream!2466 0))(
  ( (BitStream!2467 (buf!1827 array!3105) (currentByte!3618 (_ BitVec 32)) (currentBit!3613 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2466)

(declare-fun e!49641 () Bool)

(declare-fun inv!12 (BitStream!2466) Bool)

(assert (=> start!14738 (and (inv!12 thiss!1379) e!49641)))

(declare-fun b!75862 () Bool)

(declare-fun res!62724 () Bool)

(assert (=> b!75862 (=> (not res!62724) (not e!49643))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75862 (= res!62724 (validate_offset_bits!1 ((_ sign_extend 32) (size!1446 (buf!1827 thiss!1379))) ((_ sign_extend 32) (currentByte!3618 thiss!1379)) ((_ sign_extend 32) (currentBit!3613 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75863 () Bool)

(assert (=> b!75863 (= e!49641 (array_inv!1292 (buf!1827 thiss!1379)))))

(declare-fun b!75864 () Bool)

(declare-fun e!49642 () Bool)

(declare-fun e!49640 () Bool)

(assert (=> b!75864 (= e!49642 e!49640)))

(declare-fun res!62727 () Bool)

(assert (=> b!75864 (=> res!62727 e!49640)))

(assert (=> b!75864 (= res!62727 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6542 0))(
  ( (tuple2!6543 (_1!3402 array!3105) (_2!3402 BitStream!2466)) )
))
(declare-fun lt!121948 () tuple2!6542)

(declare-fun readBits!0 (BitStream!2466 (_ BitVec 64)) tuple2!6542)

(declare-datatypes ((tuple2!6544 0))(
  ( (tuple2!6545 (_1!3403 BitStream!2466) (_2!3403 BitStream!2466)) )
))
(declare-fun reader!0 (BitStream!2466 BitStream!2466) tuple2!6544)

(assert (=> b!75864 (= lt!121948 (readBits!0 (_1!3403 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75865 () Bool)

(assert (=> b!75865 (= e!49643 (not e!49642))))

(declare-fun res!62726 () Bool)

(assert (=> b!75865 (=> res!62726 e!49642)))

(declare-fun lt!121950 () (_ BitVec 64))

(assert (=> b!75865 (= res!62726 (or (bvslt i!635 to!314) (not (= lt!121950 (bvsub (bvadd lt!121950 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2466 BitStream!2466) Bool)

(assert (=> b!75865 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4992 0))(
  ( (Unit!4993) )
))
(declare-fun lt!121949 () Unit!4992)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2466) Unit!4992)

(assert (=> b!75865 (= lt!121949 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75865 (= lt!121950 (bitIndex!0 (size!1446 (buf!1827 thiss!1379)) (currentByte!3618 thiss!1379) (currentBit!3613 thiss!1379)))))

(declare-fun b!75866 () Bool)

(assert (=> b!75866 (= e!49640 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2466 array!3105 array!3105 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75866 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3402 lt!121948) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75867 () Bool)

(declare-fun res!62725 () Bool)

(assert (=> b!75867 (=> res!62725 e!49642)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75867 (= res!62725 (not (invariant!0 (currentBit!3613 thiss!1379) (currentByte!3618 thiss!1379) (size!1446 (buf!1827 thiss!1379)))))))

(assert (= (and start!14738 res!62728) b!75862))

(assert (= (and b!75862 res!62724) b!75865))

(assert (= (and b!75865 (not res!62726)) b!75867))

(assert (= (and b!75867 (not res!62725)) b!75864))

(assert (= (and b!75864 (not res!62727)) b!75866))

(assert (= start!14738 b!75863))

(declare-fun m!120975 () Bool)

(assert (=> b!75864 m!120975))

(declare-fun m!120977 () Bool)

(assert (=> b!75864 m!120977))

(declare-fun m!120979 () Bool)

(assert (=> b!75862 m!120979))

(declare-fun m!120981 () Bool)

(assert (=> b!75865 m!120981))

(declare-fun m!120983 () Bool)

(assert (=> b!75865 m!120983))

(declare-fun m!120985 () Bool)

(assert (=> b!75865 m!120985))

(declare-fun m!120987 () Bool)

(assert (=> b!75863 m!120987))

(declare-fun m!120989 () Bool)

(assert (=> b!75867 m!120989))

(declare-fun m!120991 () Bool)

(assert (=> b!75866 m!120991))

(declare-fun m!120993 () Bool)

(assert (=> start!14738 m!120993))

(declare-fun m!120995 () Bool)

(assert (=> start!14738 m!120995))

(check-sat (not b!75864) (not b!75862) (not b!75867) (not start!14738) (not b!75865) (not b!75863) (not b!75866))
