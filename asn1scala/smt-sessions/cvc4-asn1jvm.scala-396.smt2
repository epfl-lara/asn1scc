; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10366 () Bool)

(assert start!10366)

(declare-fun b!52179 () Bool)

(declare-fun e!34485 () Bool)

(declare-datatypes ((array!2393 0))(
  ( (array!2394 (arr!1627 (Array (_ BitVec 32) (_ BitVec 8))) (size!1091 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1886 0))(
  ( (BitStream!1887 (buf!1447 array!2393) (currentByte!2990 (_ BitVec 32)) (currentBit!2985 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1886)

(declare-fun array_inv!996 (array!2393) Bool)

(assert (=> b!52179 (= e!34485 (array_inv!996 (buf!1447 thiss!1379)))))

(declare-fun b!52180 () Bool)

(declare-fun res!43602 () Bool)

(declare-fun e!34487 () Bool)

(assert (=> b!52180 (=> (not res!43602) (not e!34487))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52180 (= res!43602 (validate_offset_bits!1 ((_ sign_extend 32) (size!1091 (buf!1447 thiss!1379))) ((_ sign_extend 32) (currentByte!2990 thiss!1379)) ((_ sign_extend 32) (currentBit!2985 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52181 () Bool)

(declare-fun e!34484 () Bool)

(assert (=> b!52181 (= e!34484 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4756 0))(
  ( (tuple2!4757 (_1!2483 array!2393) (_2!2483 BitStream!1886)) )
))
(declare-fun lt!81274 () tuple2!4756)

(declare-fun readBits!0 (BitStream!1886 (_ BitVec 64)) tuple2!4756)

(declare-datatypes ((tuple2!4758 0))(
  ( (tuple2!4759 (_1!2484 BitStream!1886) (_2!2484 BitStream!1886)) )
))
(declare-fun reader!0 (BitStream!1886 BitStream!1886) tuple2!4758)

(assert (=> b!52181 (= lt!81274 (readBits!0 (_1!2484 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52182 () Bool)

(declare-fun res!43605 () Bool)

(assert (=> b!52182 (=> res!43605 e!34484)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!52182 (= res!43605 (not (invariant!0 (currentBit!2985 thiss!1379) (currentByte!2990 thiss!1379) (size!1091 (buf!1447 thiss!1379)))))))

(declare-fun res!43603 () Bool)

(assert (=> start!10366 (=> (not res!43603) (not e!34487))))

(declare-fun srcBuffer!2 () array!2393)

(assert (=> start!10366 (= res!43603 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1091 srcBuffer!2))))))))

(assert (=> start!10366 e!34487))

(assert (=> start!10366 true))

(assert (=> start!10366 (array_inv!996 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1886) Bool)

(assert (=> start!10366 (and (inv!12 thiss!1379) e!34485)))

(declare-fun b!52183 () Bool)

(assert (=> b!52183 (= e!34487 (not e!34484))))

(declare-fun res!43604 () Bool)

(assert (=> b!52183 (=> res!43604 e!34484)))

(declare-fun lt!81272 () (_ BitVec 64))

(assert (=> b!52183 (= res!43604 (or (bvslt i!635 to!314) (not (= lt!81272 (bvsub (bvadd lt!81272 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1886 BitStream!1886) Bool)

(assert (=> b!52183 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3604 0))(
  ( (Unit!3605) )
))
(declare-fun lt!81273 () Unit!3604)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1886) Unit!3604)

(assert (=> b!52183 (= lt!81273 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52183 (= lt!81272 (bitIndex!0 (size!1091 (buf!1447 thiss!1379)) (currentByte!2990 thiss!1379) (currentBit!2985 thiss!1379)))))

(assert (= (and start!10366 res!43603) b!52180))

(assert (= (and b!52180 res!43602) b!52183))

(assert (= (and b!52183 (not res!43604)) b!52182))

(assert (= (and b!52182 (not res!43605)) b!52181))

(assert (= start!10366 b!52179))

(declare-fun m!82385 () Bool)

(assert (=> b!52179 m!82385))

(declare-fun m!82387 () Bool)

(assert (=> b!52183 m!82387))

(declare-fun m!82389 () Bool)

(assert (=> b!52183 m!82389))

(declare-fun m!82391 () Bool)

(assert (=> b!52183 m!82391))

(declare-fun m!82393 () Bool)

(assert (=> b!52181 m!82393))

(declare-fun m!82395 () Bool)

(assert (=> b!52181 m!82395))

(declare-fun m!82397 () Bool)

(assert (=> b!52180 m!82397))

(declare-fun m!82399 () Bool)

(assert (=> start!10366 m!82399))

(declare-fun m!82401 () Bool)

(assert (=> start!10366 m!82401))

(declare-fun m!82403 () Bool)

(assert (=> b!52182 m!82403))

(push 1)

(assert (not b!52182))

(assert (not b!52180))

(assert (not b!52183))

(assert (not b!52179))

(assert (not b!52181))

(assert (not start!10366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

