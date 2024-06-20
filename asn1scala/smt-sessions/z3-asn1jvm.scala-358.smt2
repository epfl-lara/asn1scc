; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8364 () Bool)

(assert start!8364)

(declare-fun b!41759 () Bool)

(declare-fun e!27730 () Bool)

(declare-fun e!27732 () Bool)

(assert (=> b!41759 (= e!27730 e!27732)))

(declare-fun res!35521 () Bool)

(assert (=> b!41759 (=> res!35521 e!27732)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41759 (= res!35521 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!2116 0))(
  ( (array!2117 (arr!1455 (Array (_ BitVec 32) (_ BitVec 8))) (size!956 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1656 0))(
  ( (BitStream!1657 (buf!1284 array!2116) (currentByte!2736 (_ BitVec 32)) (currentBit!2731 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4046 0))(
  ( (tuple2!4047 (_1!2113 array!2116) (_2!2113 BitStream!1656)) )
))
(declare-fun lt!63047 () tuple2!4046)

(declare-fun thiss!1379 () BitStream!1656)

(declare-fun readBits!0 (BitStream!1656 (_ BitVec 64)) tuple2!4046)

(declare-datatypes ((tuple2!4048 0))(
  ( (tuple2!4049 (_1!2114 BitStream!1656) (_2!2114 BitStream!1656)) )
))
(declare-fun reader!0 (BitStream!1656 BitStream!1656) tuple2!4048)

(assert (=> b!41759 (= lt!63047 (readBits!0 (_1!2114 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41760 () Bool)

(declare-fun res!35522 () Bool)

(assert (=> b!41760 (=> res!35522 e!27730)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41760 (= res!35522 (not (invariant!0 (currentBit!2731 thiss!1379) (currentByte!2736 thiss!1379) (size!956 (buf!1284 thiss!1379)))))))

(declare-fun b!41761 () Bool)

(declare-fun res!35523 () Bool)

(declare-fun e!27729 () Bool)

(assert (=> b!41761 (=> (not res!35523) (not e!27729))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41761 (= res!35523 (validate_offset_bits!1 ((_ sign_extend 32) (size!956 (buf!1284 thiss!1379))) ((_ sign_extend 32) (currentByte!2736 thiss!1379)) ((_ sign_extend 32) (currentBit!2731 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41762 () Bool)

(assert (=> b!41762 (= e!27732 true)))

(declare-fun srcBuffer!2 () array!2116)

(declare-fun checkByteArrayBitContent!0 (BitStream!1656 array!2116 array!2116 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41762 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2113 lt!63047) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41763 () Bool)

(declare-fun e!27728 () Bool)

(declare-fun array_inv!881 (array!2116) Bool)

(assert (=> b!41763 (= e!27728 (array_inv!881 (buf!1284 thiss!1379)))))

(declare-fun b!41764 () Bool)

(assert (=> b!41764 (= e!27729 (not e!27730))))

(declare-fun res!35519 () Bool)

(assert (=> b!41764 (=> res!35519 e!27730)))

(declare-fun lt!63048 () (_ BitVec 64))

(assert (=> b!41764 (= res!35519 (or (bvslt i!635 to!314) (not (= lt!63048 (bvsub (bvadd lt!63048 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1656 BitStream!1656) Bool)

(assert (=> b!41764 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2963 0))(
  ( (Unit!2964) )
))
(declare-fun lt!63049 () Unit!2963)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1656) Unit!2963)

(assert (=> b!41764 (= lt!63049 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41764 (= lt!63048 (bitIndex!0 (size!956 (buf!1284 thiss!1379)) (currentByte!2736 thiss!1379) (currentBit!2731 thiss!1379)))))

(declare-fun res!35520 () Bool)

(assert (=> start!8364 (=> (not res!35520) (not e!27729))))

(assert (=> start!8364 (= res!35520 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!956 srcBuffer!2))))))))

(assert (=> start!8364 e!27729))

(assert (=> start!8364 true))

(assert (=> start!8364 (array_inv!881 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1656) Bool)

(assert (=> start!8364 (and (inv!12 thiss!1379) e!27728)))

(assert (= (and start!8364 res!35520) b!41761))

(assert (= (and b!41761 res!35523) b!41764))

(assert (= (and b!41764 (not res!35519)) b!41760))

(assert (= (and b!41760 (not res!35522)) b!41759))

(assert (= (and b!41759 (not res!35521)) b!41762))

(assert (= start!8364 b!41763))

(declare-fun m!63515 () Bool)

(assert (=> b!41759 m!63515))

(declare-fun m!63517 () Bool)

(assert (=> b!41759 m!63517))

(declare-fun m!63519 () Bool)

(assert (=> b!41764 m!63519))

(declare-fun m!63521 () Bool)

(assert (=> b!41764 m!63521))

(declare-fun m!63523 () Bool)

(assert (=> b!41764 m!63523))

(declare-fun m!63525 () Bool)

(assert (=> b!41763 m!63525))

(declare-fun m!63527 () Bool)

(assert (=> b!41761 m!63527))

(declare-fun m!63529 () Bool)

(assert (=> b!41762 m!63529))

(declare-fun m!63531 () Bool)

(assert (=> b!41760 m!63531))

(declare-fun m!63533 () Bool)

(assert (=> start!8364 m!63533))

(declare-fun m!63535 () Bool)

(assert (=> start!8364 m!63535))

(check-sat (not b!41762) (not b!41760) (not b!41761) (not start!8364) (not b!41759) (not b!41764) (not b!41763))
