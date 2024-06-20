; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10400 () Bool)

(assert start!10400)

(declare-fun res!43652 () Bool)

(declare-fun e!34598 () Bool)

(assert (=> start!10400 (=> (not res!43652) (not e!34598))))

(declare-datatypes ((array!2421 0))(
  ( (array!2422 (arr!1641 (Array (_ BitVec 32) (_ BitVec 8))) (size!1105 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2421)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10400 (= res!43652 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1105 srcBuffer!2))))))))

(assert (=> start!10400 e!34598))

(assert (=> start!10400 true))

(declare-fun array_inv!1010 (array!2421) Bool)

(assert (=> start!10400 (array_inv!1010 srcBuffer!2)))

(declare-datatypes ((BitStream!1902 0))(
  ( (BitStream!1903 (buf!1455 array!2421) (currentByte!2998 (_ BitVec 32)) (currentBit!2993 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1902)

(declare-fun e!34601 () Bool)

(declare-fun inv!12 (BitStream!1902) Bool)

(assert (=> start!10400 (and (inv!12 thiss!1379) e!34601)))

(declare-fun b!52253 () Bool)

(declare-fun res!43653 () Bool)

(assert (=> b!52253 (=> (not res!43653) (not e!34598))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52253 (= res!43653 (validate_offset_bits!1 ((_ sign_extend 32) (size!1105 (buf!1455 thiss!1379))) ((_ sign_extend 32) (currentByte!2998 thiss!1379)) ((_ sign_extend 32) (currentBit!2993 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52254 () Bool)

(assert (=> b!52254 (= e!34598 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1902 BitStream!1902) Bool)

(assert (=> b!52254 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3614 0))(
  ( (Unit!3615) )
))
(declare-fun lt!81303 () Unit!3614)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1902) Unit!3614)

(assert (=> b!52254 (= lt!81303 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81304 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52254 (= lt!81304 (bitIndex!0 (size!1105 (buf!1455 thiss!1379)) (currentByte!2998 thiss!1379) (currentBit!2993 thiss!1379)))))

(declare-fun b!52255 () Bool)

(assert (=> b!52255 (= e!34601 (array_inv!1010 (buf!1455 thiss!1379)))))

(assert (= (and start!10400 res!43652) b!52253))

(assert (= (and b!52253 res!43653) b!52254))

(assert (= start!10400 b!52255))

(declare-fun m!82497 () Bool)

(assert (=> start!10400 m!82497))

(declare-fun m!82499 () Bool)

(assert (=> start!10400 m!82499))

(declare-fun m!82501 () Bool)

(assert (=> b!52253 m!82501))

(declare-fun m!82503 () Bool)

(assert (=> b!52254 m!82503))

(declare-fun m!82505 () Bool)

(assert (=> b!52254 m!82505))

(declare-fun m!82507 () Bool)

(assert (=> b!52254 m!82507))

(declare-fun m!82509 () Bool)

(assert (=> b!52255 m!82509))

(check-sat (not b!52253) (not b!52255) (not b!52254) (not start!10400))
