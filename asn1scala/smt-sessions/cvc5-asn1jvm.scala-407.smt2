; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10428 () Bool)

(assert start!10428)

(declare-fun res!43736 () Bool)

(declare-fun e!34769 () Bool)

(assert (=> start!10428 (=> (not res!43736) (not e!34769))))

(declare-datatypes ((array!2449 0))(
  ( (array!2450 (arr!1655 (Array (_ BitVec 32) (_ BitVec 8))) (size!1119 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2449)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10428 (= res!43736 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1119 srcBuffer!2))))))))

(assert (=> start!10428 e!34769))

(assert (=> start!10428 true))

(declare-fun array_inv!1024 (array!2449) Bool)

(assert (=> start!10428 (array_inv!1024 srcBuffer!2)))

(declare-datatypes ((BitStream!1930 0))(
  ( (BitStream!1931 (buf!1469 array!2449) (currentByte!3012 (_ BitVec 32)) (currentBit!3007 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1930)

(declare-fun e!34766 () Bool)

(declare-fun inv!12 (BitStream!1930) Bool)

(assert (=> start!10428 (and (inv!12 thiss!1379) e!34766)))

(declare-fun b!52379 () Bool)

(declare-fun res!43737 () Bool)

(assert (=> b!52379 (=> (not res!43737) (not e!34769))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52379 (= res!43737 (validate_offset_bits!1 ((_ sign_extend 32) (size!1119 (buf!1469 thiss!1379))) ((_ sign_extend 32) (currentByte!3012 thiss!1379)) ((_ sign_extend 32) (currentBit!3007 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52380 () Bool)

(assert (=> b!52380 (= e!34769 (not (or (bvsge i!635 to!314) (bvslt (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1930 BitStream!1930) Bool)

(assert (=> b!52380 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3642 0))(
  ( (Unit!3643) )
))
(declare-fun lt!81387 () Unit!3642)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1930) Unit!3642)

(assert (=> b!52380 (= lt!81387 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81388 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52380 (= lt!81388 (bitIndex!0 (size!1119 (buf!1469 thiss!1379)) (currentByte!3012 thiss!1379) (currentBit!3007 thiss!1379)))))

(declare-fun b!52381 () Bool)

(assert (=> b!52381 (= e!34766 (array_inv!1024 (buf!1469 thiss!1379)))))

(assert (= (and start!10428 res!43736) b!52379))

(assert (= (and b!52379 res!43737) b!52380))

(assert (= start!10428 b!52381))

(declare-fun m!82693 () Bool)

(assert (=> start!10428 m!82693))

(declare-fun m!82695 () Bool)

(assert (=> start!10428 m!82695))

(declare-fun m!82697 () Bool)

(assert (=> b!52379 m!82697))

(declare-fun m!82699 () Bool)

(assert (=> b!52380 m!82699))

(declare-fun m!82701 () Bool)

(assert (=> b!52380 m!82701))

(declare-fun m!82703 () Bool)

(assert (=> b!52380 m!82703))

(declare-fun m!82705 () Bool)

(assert (=> b!52381 m!82705))

(push 1)

(assert (not b!52380))

(assert (not start!10428))

(assert (not b!52379))

(assert (not b!52381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

