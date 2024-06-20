; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10352 () Bool)

(assert start!10352)

(declare-fun res!43544 () Bool)

(declare-fun e!34392 () Bool)

(assert (=> start!10352 (=> (not res!43544) (not e!34392))))

(declare-datatypes ((array!2379 0))(
  ( (array!2380 (arr!1620 (Array (_ BitVec 32) (_ BitVec 8))) (size!1084 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2379)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10352 (= res!43544 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1084 srcBuffer!2))))))))

(assert (=> start!10352 e!34392))

(assert (=> start!10352 true))

(declare-fun array_inv!989 (array!2379) Bool)

(assert (=> start!10352 (array_inv!989 srcBuffer!2)))

(declare-datatypes ((BitStream!1872 0))(
  ( (BitStream!1873 (buf!1440 array!2379) (currentByte!2983 (_ BitVec 32)) (currentBit!2978 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1872)

(declare-fun e!34393 () Bool)

(declare-fun inv!12 (BitStream!1872) Bool)

(assert (=> start!10352 (and (inv!12 thiss!1379) e!34393)))

(declare-fun b!52100 () Bool)

(declare-fun res!43545 () Bool)

(assert (=> b!52100 (=> (not res!43545) (not e!34392))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52100 (= res!43545 (validate_offset_bits!1 ((_ sign_extend 32) (size!1084 (buf!1440 thiss!1379))) ((_ sign_extend 32) (currentByte!2983 thiss!1379)) ((_ sign_extend 32) (currentBit!2978 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52101 () Bool)

(assert (=> b!52101 (= e!34392 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1872 BitStream!1872) Bool)

(assert (=> b!52101 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3590 0))(
  ( (Unit!3591) )
))
(declare-fun lt!81223 () Unit!3590)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1872) Unit!3590)

(assert (=> b!52101 (= lt!81223 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81222 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52101 (= lt!81222 (bitIndex!0 (size!1084 (buf!1440 thiss!1379)) (currentByte!2983 thiss!1379) (currentBit!2978 thiss!1379)))))

(declare-fun b!52102 () Bool)

(assert (=> b!52102 (= e!34393 (array_inv!989 (buf!1440 thiss!1379)))))

(assert (= (and start!10352 res!43544) b!52100))

(assert (= (and b!52100 res!43545) b!52101))

(assert (= start!10352 b!52102))

(declare-fun m!82275 () Bool)

(assert (=> start!10352 m!82275))

(declare-fun m!82277 () Bool)

(assert (=> start!10352 m!82277))

(declare-fun m!82279 () Bool)

(assert (=> b!52100 m!82279))

(declare-fun m!82281 () Bool)

(assert (=> b!52101 m!82281))

(declare-fun m!82283 () Bool)

(assert (=> b!52101 m!82283))

(declare-fun m!82285 () Bool)

(assert (=> b!52101 m!82285))

(declare-fun m!82287 () Bool)

(assert (=> b!52102 m!82287))

(check-sat (not b!52100) (not b!52102) (not b!52101) (not start!10352))
