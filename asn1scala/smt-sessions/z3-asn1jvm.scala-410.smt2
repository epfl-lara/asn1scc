; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10448 () Bool)

(assert start!10448)

(declare-fun b!52485 () Bool)

(declare-fun e!34902 () Bool)

(assert (=> b!52485 (= e!34902 true)))

(declare-datatypes ((array!2469 0))(
  ( (array!2470 (arr!1665 (Array (_ BitVec 32) (_ BitVec 8))) (size!1129 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2469)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!1950 0))(
  ( (BitStream!1951 (buf!1479 array!2469) (currentByte!3022 (_ BitVec 32)) (currentBit!3017 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3662 0))(
  ( (Unit!3663) )
))
(declare-datatypes ((tuple2!4768 0))(
  ( (tuple2!4769 (_1!2489 Unit!3662) (_2!2489 BitStream!1950)) )
))
(declare-fun lt!81461 () tuple2!4768)

(declare-fun thiss!1379 () BitStream!1950)

(declare-fun appendBitFromByte!0 (BitStream!1950 (_ BitVec 8) (_ BitVec 32)) tuple2!4768)

(assert (=> b!52485 (= lt!81461 (appendBitFromByte!0 thiss!1379 (select (arr!1665 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!52486 () Bool)

(declare-fun e!34903 () Bool)

(declare-fun array_inv!1034 (array!2469) Bool)

(assert (=> b!52486 (= e!34903 (array_inv!1034 (buf!1479 thiss!1379)))))

(declare-fun b!52484 () Bool)

(declare-fun e!34900 () Bool)

(assert (=> b!52484 (= e!34900 (not e!34902))))

(declare-fun res!43811 () Bool)

(assert (=> b!52484 (=> res!43811 e!34902)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!52484 (= res!43811 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1950 BitStream!1950) Bool)

(assert (=> b!52484 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81463 () Unit!3662)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1950) Unit!3662)

(assert (=> b!52484 (= lt!81463 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81462 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52484 (= lt!81462 (bitIndex!0 (size!1129 (buf!1479 thiss!1379)) (currentByte!3022 thiss!1379) (currentBit!3017 thiss!1379)))))

(declare-fun res!43812 () Bool)

(assert (=> start!10448 (=> (not res!43812) (not e!34900))))

(assert (=> start!10448 (= res!43812 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1129 srcBuffer!2))))))))

(assert (=> start!10448 e!34900))

(assert (=> start!10448 true))

(assert (=> start!10448 (array_inv!1034 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1950) Bool)

(assert (=> start!10448 (and (inv!12 thiss!1379) e!34903)))

(declare-fun b!52483 () Bool)

(declare-fun res!43810 () Bool)

(assert (=> b!52483 (=> (not res!43810) (not e!34900))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52483 (= res!43810 (validate_offset_bits!1 ((_ sign_extend 32) (size!1129 (buf!1479 thiss!1379))) ((_ sign_extend 32) (currentByte!3022 thiss!1379)) ((_ sign_extend 32) (currentBit!3017 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10448 res!43812) b!52483))

(assert (= (and b!52483 res!43810) b!52484))

(assert (= (and b!52484 (not res!43811)) b!52485))

(assert (= start!10448 b!52486))

(declare-fun m!82849 () Bool)

(assert (=> b!52485 m!82849))

(assert (=> b!52485 m!82849))

(declare-fun m!82851 () Bool)

(assert (=> b!52485 m!82851))

(declare-fun m!82853 () Bool)

(assert (=> start!10448 m!82853))

(declare-fun m!82855 () Bool)

(assert (=> start!10448 m!82855))

(declare-fun m!82857 () Bool)

(assert (=> b!52486 m!82857))

(declare-fun m!82859 () Bool)

(assert (=> b!52484 m!82859))

(declare-fun m!82861 () Bool)

(assert (=> b!52484 m!82861))

(declare-fun m!82863 () Bool)

(assert (=> b!52484 m!82863))

(declare-fun m!82865 () Bool)

(assert (=> b!52483 m!82865))

(check-sat (not b!52486) (not b!52484) (not b!52485) (not b!52483) (not start!10448))
