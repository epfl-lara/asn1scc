; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8370 () Bool)

(assert start!8370)

(declare-fun res!35565 () Bool)

(declare-fun e!27786 () Bool)

(assert (=> start!8370 (=> (not res!35565) (not e!27786))))

(declare-datatypes ((array!2122 0))(
  ( (array!2123 (arr!1458 (Array (_ BitVec 32) (_ BitVec 8))) (size!959 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2122)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8370 (= res!35565 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!959 srcBuffer!2))))))))

(assert (=> start!8370 e!27786))

(assert (=> start!8370 true))

(declare-fun array_inv!884 (array!2122) Bool)

(assert (=> start!8370 (array_inv!884 srcBuffer!2)))

(declare-datatypes ((BitStream!1662 0))(
  ( (BitStream!1663 (buf!1287 array!2122) (currentByte!2739 (_ BitVec 32)) (currentBit!2734 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1662)

(declare-fun e!27784 () Bool)

(declare-fun inv!12 (BitStream!1662) Bool)

(assert (=> start!8370 (and (inv!12 thiss!1379) e!27784)))

(declare-fun b!41813 () Bool)

(declare-fun e!27785 () Bool)

(declare-fun e!27787 () Bool)

(assert (=> b!41813 (= e!27785 e!27787)))

(declare-fun res!35564 () Bool)

(assert (=> b!41813 (=> res!35564 e!27787)))

(assert (=> b!41813 (= res!35564 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4058 0))(
  ( (tuple2!4059 (_1!2119 array!2122) (_2!2119 BitStream!1662)) )
))
(declare-fun lt!63074 () tuple2!4058)

(declare-fun readBits!0 (BitStream!1662 (_ BitVec 64)) tuple2!4058)

(declare-datatypes ((tuple2!4060 0))(
  ( (tuple2!4061 (_1!2120 BitStream!1662) (_2!2120 BitStream!1662)) )
))
(declare-fun reader!0 (BitStream!1662 BitStream!1662) tuple2!4060)

(assert (=> b!41813 (= lt!63074 (readBits!0 (_1!2120 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41814 () Bool)

(declare-fun res!35567 () Bool)

(assert (=> b!41814 (=> res!35567 e!27785)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41814 (= res!35567 (not (invariant!0 (currentBit!2734 thiss!1379) (currentByte!2739 thiss!1379) (size!959 (buf!1287 thiss!1379)))))))

(declare-fun b!41815 () Bool)

(declare-fun res!35566 () Bool)

(assert (=> b!41815 (=> (not res!35566) (not e!27786))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41815 (= res!35566 (validate_offset_bits!1 ((_ sign_extend 32) (size!959 (buf!1287 thiss!1379))) ((_ sign_extend 32) (currentByte!2739 thiss!1379)) ((_ sign_extend 32) (currentBit!2734 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41816 () Bool)

(assert (=> b!41816 (= e!27786 (not e!27785))))

(declare-fun res!35568 () Bool)

(assert (=> b!41816 (=> res!35568 e!27785)))

(declare-fun lt!63076 () (_ BitVec 64))

(assert (=> b!41816 (= res!35568 (or (bvslt i!635 to!314) (not (= lt!63076 (bvsub (bvadd lt!63076 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1662 BitStream!1662) Bool)

(assert (=> b!41816 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2969 0))(
  ( (Unit!2970) )
))
(declare-fun lt!63075 () Unit!2969)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1662) Unit!2969)

(assert (=> b!41816 (= lt!63075 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41816 (= lt!63076 (bitIndex!0 (size!959 (buf!1287 thiss!1379)) (currentByte!2739 thiss!1379) (currentBit!2734 thiss!1379)))))

(declare-fun b!41817 () Bool)

(assert (=> b!41817 (= e!27787 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1662 array!2122 array!2122 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41817 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2119 lt!63074) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41818 () Bool)

(assert (=> b!41818 (= e!27784 (array_inv!884 (buf!1287 thiss!1379)))))

(assert (= (and start!8370 res!35565) b!41815))

(assert (= (and b!41815 res!35566) b!41816))

(assert (= (and b!41816 (not res!35568)) b!41814))

(assert (= (and b!41814 (not res!35567)) b!41813))

(assert (= (and b!41813 (not res!35564)) b!41817))

(assert (= start!8370 b!41818))

(declare-fun m!63581 () Bool)

(assert (=> b!41818 m!63581))

(declare-fun m!63583 () Bool)

(assert (=> start!8370 m!63583))

(declare-fun m!63585 () Bool)

(assert (=> start!8370 m!63585))

(declare-fun m!63587 () Bool)

(assert (=> b!41814 m!63587))

(declare-fun m!63589 () Bool)

(assert (=> b!41813 m!63589))

(declare-fun m!63591 () Bool)

(assert (=> b!41813 m!63591))

(declare-fun m!63593 () Bool)

(assert (=> b!41815 m!63593))

(declare-fun m!63595 () Bool)

(assert (=> b!41816 m!63595))

(declare-fun m!63597 () Bool)

(assert (=> b!41816 m!63597))

(declare-fun m!63599 () Bool)

(assert (=> b!41816 m!63599))

(declare-fun m!63601 () Bool)

(assert (=> b!41817 m!63601))

(check-sat (not start!8370) (not b!41816) (not b!41815) (not b!41814) (not b!41817) (not b!41818) (not b!41813))
