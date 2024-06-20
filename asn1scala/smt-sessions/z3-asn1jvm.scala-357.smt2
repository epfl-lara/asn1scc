; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8358 () Bool)

(assert start!8358)

(declare-fun b!41705 () Bool)

(declare-fun e!27679 () Bool)

(declare-fun e!27677 () Bool)

(assert (=> b!41705 (= e!27679 e!27677)))

(declare-fun res!35478 () Bool)

(assert (=> b!41705 (=> res!35478 e!27677)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41705 (= res!35478 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!2110 0))(
  ( (array!2111 (arr!1452 (Array (_ BitVec 32) (_ BitVec 8))) (size!953 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1650 0))(
  ( (BitStream!1651 (buf!1281 array!2110) (currentByte!2733 (_ BitVec 32)) (currentBit!2728 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1650)

(declare-datatypes ((tuple2!4034 0))(
  ( (tuple2!4035 (_1!2107 array!2110) (_2!2107 BitStream!1650)) )
))
(declare-fun lt!63020 () tuple2!4034)

(declare-fun readBits!0 (BitStream!1650 (_ BitVec 64)) tuple2!4034)

(declare-datatypes ((tuple2!4036 0))(
  ( (tuple2!4037 (_1!2108 BitStream!1650) (_2!2108 BitStream!1650)) )
))
(declare-fun reader!0 (BitStream!1650 BitStream!1650) tuple2!4036)

(assert (=> b!41705 (= lt!63020 (readBits!0 (_1!2108 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41706 () Bool)

(declare-fun res!35476 () Bool)

(declare-fun e!27675 () Bool)

(assert (=> b!41706 (=> (not res!35476) (not e!27675))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41706 (= res!35476 (validate_offset_bits!1 ((_ sign_extend 32) (size!953 (buf!1281 thiss!1379))) ((_ sign_extend 32) (currentByte!2733 thiss!1379)) ((_ sign_extend 32) (currentBit!2728 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35477 () Bool)

(assert (=> start!8358 (=> (not res!35477) (not e!27675))))

(declare-fun srcBuffer!2 () array!2110)

(assert (=> start!8358 (= res!35477 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!953 srcBuffer!2))))))))

(assert (=> start!8358 e!27675))

(assert (=> start!8358 true))

(declare-fun array_inv!878 (array!2110) Bool)

(assert (=> start!8358 (array_inv!878 srcBuffer!2)))

(declare-fun e!27676 () Bool)

(declare-fun inv!12 (BitStream!1650) Bool)

(assert (=> start!8358 (and (inv!12 thiss!1379) e!27676)))

(declare-fun b!41707 () Bool)

(assert (=> b!41707 (= e!27677 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1650 array!2110 array!2110 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41707 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2107 lt!63020) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41708 () Bool)

(assert (=> b!41708 (= e!27676 (array_inv!878 (buf!1281 thiss!1379)))))

(declare-fun b!41709 () Bool)

(declare-fun res!35475 () Bool)

(assert (=> b!41709 (=> res!35475 e!27679)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41709 (= res!35475 (not (invariant!0 (currentBit!2728 thiss!1379) (currentByte!2733 thiss!1379) (size!953 (buf!1281 thiss!1379)))))))

(declare-fun b!41710 () Bool)

(assert (=> b!41710 (= e!27675 (not e!27679))))

(declare-fun res!35474 () Bool)

(assert (=> b!41710 (=> res!35474 e!27679)))

(declare-fun lt!63022 () (_ BitVec 64))

(assert (=> b!41710 (= res!35474 (or (bvslt i!635 to!314) (not (= lt!63022 (bvsub (bvadd lt!63022 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1650 BitStream!1650) Bool)

(assert (=> b!41710 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2957 0))(
  ( (Unit!2958) )
))
(declare-fun lt!63021 () Unit!2957)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1650) Unit!2957)

(assert (=> b!41710 (= lt!63021 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41710 (= lt!63022 (bitIndex!0 (size!953 (buf!1281 thiss!1379)) (currentByte!2733 thiss!1379) (currentBit!2728 thiss!1379)))))

(assert (= (and start!8358 res!35477) b!41706))

(assert (= (and b!41706 res!35476) b!41710))

(assert (= (and b!41710 (not res!35474)) b!41709))

(assert (= (and b!41709 (not res!35475)) b!41705))

(assert (= (and b!41705 (not res!35478)) b!41707))

(assert (= start!8358 b!41708))

(declare-fun m!63449 () Bool)

(assert (=> b!41705 m!63449))

(declare-fun m!63451 () Bool)

(assert (=> b!41705 m!63451))

(declare-fun m!63453 () Bool)

(assert (=> b!41710 m!63453))

(declare-fun m!63455 () Bool)

(assert (=> b!41710 m!63455))

(declare-fun m!63457 () Bool)

(assert (=> b!41710 m!63457))

(declare-fun m!63459 () Bool)

(assert (=> start!8358 m!63459))

(declare-fun m!63461 () Bool)

(assert (=> start!8358 m!63461))

(declare-fun m!63463 () Bool)

(assert (=> b!41706 m!63463))

(declare-fun m!63465 () Bool)

(assert (=> b!41707 m!63465))

(declare-fun m!63467 () Bool)

(assert (=> b!41708 m!63467))

(declare-fun m!63469 () Bool)

(assert (=> b!41709 m!63469))

(check-sat (not b!41709) (not start!8358) (not b!41707) (not b!41710) (not b!41708) (not b!41706) (not b!41705))
