; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8382 () Bool)

(assert start!8382)

(declare-fun b!41921 () Bool)

(declare-fun e!27893 () Bool)

(declare-fun e!27891 () Bool)

(assert (=> b!41921 (= e!27893 (not e!27891))))

(declare-fun res!35654 () Bool)

(assert (=> b!41921 (=> res!35654 e!27891)))

(declare-fun lt!63129 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!41921 (= res!35654 (or (bvslt i!635 to!314) (not (= lt!63129 (bvsub (bvadd lt!63129 to!314) i!635)))))))

(declare-datatypes ((array!2134 0))(
  ( (array!2135 (arr!1464 (Array (_ BitVec 32) (_ BitVec 8))) (size!965 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1674 0))(
  ( (BitStream!1675 (buf!1293 array!2134) (currentByte!2745 (_ BitVec 32)) (currentBit!2740 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1674)

(declare-fun isPrefixOf!0 (BitStream!1674 BitStream!1674) Bool)

(assert (=> b!41921 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2981 0))(
  ( (Unit!2982) )
))
(declare-fun lt!63128 () Unit!2981)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1674) Unit!2981)

(assert (=> b!41921 (= lt!63128 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41921 (= lt!63129 (bitIndex!0 (size!965 (buf!1293 thiss!1379)) (currentByte!2745 thiss!1379) (currentBit!2740 thiss!1379)))))

(declare-fun b!41922 () Bool)

(declare-fun e!27894 () Bool)

(assert (=> b!41922 (= e!27891 e!27894)))

(declare-fun res!35655 () Bool)

(assert (=> b!41922 (=> res!35655 e!27894)))

(assert (=> b!41922 (= res!35655 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4082 0))(
  ( (tuple2!4083 (_1!2131 array!2134) (_2!2131 BitStream!1674)) )
))
(declare-fun lt!63130 () tuple2!4082)

(declare-fun readBits!0 (BitStream!1674 (_ BitVec 64)) tuple2!4082)

(declare-datatypes ((tuple2!4084 0))(
  ( (tuple2!4085 (_1!2132 BitStream!1674) (_2!2132 BitStream!1674)) )
))
(declare-fun reader!0 (BitStream!1674 BitStream!1674) tuple2!4084)

(assert (=> b!41922 (= lt!63130 (readBits!0 (_1!2132 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41923 () Bool)

(declare-fun res!35658 () Bool)

(assert (=> b!41923 (=> res!35658 e!27891)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41923 (= res!35658 (not (invariant!0 (currentBit!2740 thiss!1379) (currentByte!2745 thiss!1379) (size!965 (buf!1293 thiss!1379)))))))

(declare-fun b!41924 () Bool)

(declare-fun e!27890 () Bool)

(declare-fun array_inv!890 (array!2134) Bool)

(assert (=> b!41924 (= e!27890 (array_inv!890 (buf!1293 thiss!1379)))))

(declare-fun b!41925 () Bool)

(declare-fun res!35656 () Bool)

(assert (=> b!41925 (=> (not res!35656) (not e!27893))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41925 (= res!35656 (validate_offset_bits!1 ((_ sign_extend 32) (size!965 (buf!1293 thiss!1379))) ((_ sign_extend 32) (currentByte!2745 thiss!1379)) ((_ sign_extend 32) (currentBit!2740 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41926 () Bool)

(assert (=> b!41926 (= e!27894 true)))

(declare-fun srcBuffer!2 () array!2134)

(declare-fun checkByteArrayBitContent!0 (BitStream!1674 array!2134 array!2134 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41926 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2131 lt!63130) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun res!35657 () Bool)

(assert (=> start!8382 (=> (not res!35657) (not e!27893))))

(assert (=> start!8382 (= res!35657 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!965 srcBuffer!2))))))))

(assert (=> start!8382 e!27893))

(assert (=> start!8382 true))

(assert (=> start!8382 (array_inv!890 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1674) Bool)

(assert (=> start!8382 (and (inv!12 thiss!1379) e!27890)))

(assert (= (and start!8382 res!35657) b!41925))

(assert (= (and b!41925 res!35656) b!41921))

(assert (= (and b!41921 (not res!35654)) b!41923))

(assert (= (and b!41923 (not res!35658)) b!41922))

(assert (= (and b!41922 (not res!35655)) b!41926))

(assert (= start!8382 b!41924))

(declare-fun m!63713 () Bool)

(assert (=> start!8382 m!63713))

(declare-fun m!63715 () Bool)

(assert (=> start!8382 m!63715))

(declare-fun m!63717 () Bool)

(assert (=> b!41925 m!63717))

(declare-fun m!63719 () Bool)

(assert (=> b!41924 m!63719))

(declare-fun m!63721 () Bool)

(assert (=> b!41923 m!63721))

(declare-fun m!63723 () Bool)

(assert (=> b!41922 m!63723))

(declare-fun m!63725 () Bool)

(assert (=> b!41922 m!63725))

(declare-fun m!63727 () Bool)

(assert (=> b!41926 m!63727))

(declare-fun m!63729 () Bool)

(assert (=> b!41921 m!63729))

(declare-fun m!63731 () Bool)

(assert (=> b!41921 m!63731))

(declare-fun m!63733 () Bool)

(assert (=> b!41921 m!63733))

(check-sat (not b!41925) (not b!41922) (not b!41923) (not start!8382) (not b!41926) (not b!41921) (not b!41924))
