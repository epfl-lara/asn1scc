; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10406 () Bool)

(assert start!10406)

(declare-fun res!43671 () Bool)

(declare-fun e!34637 () Bool)

(assert (=> start!10406 (=> (not res!43671) (not e!34637))))

(declare-datatypes ((array!2427 0))(
  ( (array!2428 (arr!1644 (Array (_ BitVec 32) (_ BitVec 8))) (size!1108 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2427)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10406 (= res!43671 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1108 srcBuffer!2))))))))

(assert (=> start!10406 e!34637))

(assert (=> start!10406 true))

(declare-fun array_inv!1013 (array!2427) Bool)

(assert (=> start!10406 (array_inv!1013 srcBuffer!2)))

(declare-datatypes ((BitStream!1908 0))(
  ( (BitStream!1909 (buf!1458 array!2427) (currentByte!3001 (_ BitVec 32)) (currentBit!2996 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1908)

(declare-fun e!34634 () Bool)

(declare-fun inv!12 (BitStream!1908) Bool)

(assert (=> start!10406 (and (inv!12 thiss!1379) e!34634)))

(declare-fun b!52280 () Bool)

(declare-fun res!43670 () Bool)

(assert (=> b!52280 (=> (not res!43670) (not e!34637))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52280 (= res!43670 (validate_offset_bits!1 ((_ sign_extend 32) (size!1108 (buf!1458 thiss!1379))) ((_ sign_extend 32) (currentByte!3001 thiss!1379)) ((_ sign_extend 32) (currentBit!2996 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52281 () Bool)

(assert (=> b!52281 (= e!34637 (not (or (bvsge i!635 to!314) (bvslt (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1908 BitStream!1908) Bool)

(assert (=> b!52281 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3620 0))(
  ( (Unit!3621) )
))
(declare-fun lt!81321 () Unit!3620)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1908) Unit!3620)

(assert (=> b!52281 (= lt!81321 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52281 (= lt!81322 (bitIndex!0 (size!1108 (buf!1458 thiss!1379)) (currentByte!3001 thiss!1379) (currentBit!2996 thiss!1379)))))

(declare-fun b!52282 () Bool)

(assert (=> b!52282 (= e!34634 (array_inv!1013 (buf!1458 thiss!1379)))))

(assert (= (and start!10406 res!43671) b!52280))

(assert (= (and b!52280 res!43670) b!52281))

(assert (= start!10406 b!52282))

(declare-fun m!82539 () Bool)

(assert (=> start!10406 m!82539))

(declare-fun m!82541 () Bool)

(assert (=> start!10406 m!82541))

(declare-fun m!82543 () Bool)

(assert (=> b!52280 m!82543))

(declare-fun m!82545 () Bool)

(assert (=> b!52281 m!82545))

(declare-fun m!82547 () Bool)

(assert (=> b!52281 m!82547))

(declare-fun m!82549 () Bool)

(assert (=> b!52281 m!82549))

(declare-fun m!82551 () Bool)

(assert (=> b!52282 m!82551))

(check-sat (not b!52282) (not b!52280) (not start!10406) (not b!52281))
(check-sat)
