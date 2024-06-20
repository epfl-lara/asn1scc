; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10398 () Bool)

(assert start!10398)

(declare-fun res!43647 () Bool)

(declare-fun e!34589 () Bool)

(assert (=> start!10398 (=> (not res!43647) (not e!34589))))

(declare-datatypes ((array!2419 0))(
  ( (array!2420 (arr!1640 (Array (_ BitVec 32) (_ BitVec 8))) (size!1104 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2419)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10398 (= res!43647 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1104 srcBuffer!2))))))))

(assert (=> start!10398 e!34589))

(assert (=> start!10398 true))

(declare-fun array_inv!1009 (array!2419) Bool)

(assert (=> start!10398 (array_inv!1009 srcBuffer!2)))

(declare-datatypes ((BitStream!1900 0))(
  ( (BitStream!1901 (buf!1454 array!2419) (currentByte!2997 (_ BitVec 32)) (currentBit!2992 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1900)

(declare-fun e!34586 () Bool)

(declare-fun inv!12 (BitStream!1900) Bool)

(assert (=> start!10398 (and (inv!12 thiss!1379) e!34586)))

(declare-fun b!52244 () Bool)

(declare-fun res!43646 () Bool)

(assert (=> b!52244 (=> (not res!43646) (not e!34589))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52244 (= res!43646 (validate_offset_bits!1 ((_ sign_extend 32) (size!1104 (buf!1454 thiss!1379))) ((_ sign_extend 32) (currentByte!2997 thiss!1379)) ((_ sign_extend 32) (currentBit!2992 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52245 () Bool)

(assert (=> b!52245 (= e!34589 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1900 BitStream!1900) Bool)

(assert (=> b!52245 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3612 0))(
  ( (Unit!3613) )
))
(declare-fun lt!81298 () Unit!3612)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1900) Unit!3612)

(assert (=> b!52245 (= lt!81298 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81297 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52245 (= lt!81297 (bitIndex!0 (size!1104 (buf!1454 thiss!1379)) (currentByte!2997 thiss!1379) (currentBit!2992 thiss!1379)))))

(declare-fun b!52246 () Bool)

(assert (=> b!52246 (= e!34586 (array_inv!1009 (buf!1454 thiss!1379)))))

(assert (= (and start!10398 res!43647) b!52244))

(assert (= (and b!52244 res!43646) b!52245))

(assert (= start!10398 b!52246))

(declare-fun m!82483 () Bool)

(assert (=> start!10398 m!82483))

(declare-fun m!82485 () Bool)

(assert (=> start!10398 m!82485))

(declare-fun m!82487 () Bool)

(assert (=> b!52244 m!82487))

(declare-fun m!82489 () Bool)

(assert (=> b!52245 m!82489))

(declare-fun m!82491 () Bool)

(assert (=> b!52245 m!82491))

(declare-fun m!82493 () Bool)

(assert (=> b!52245 m!82493))

(declare-fun m!82495 () Bool)

(assert (=> b!52246 m!82495))

(push 1)

(assert (not b!52246))

(assert (not b!52244))

(assert (not b!52245))

(assert (not start!10398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

