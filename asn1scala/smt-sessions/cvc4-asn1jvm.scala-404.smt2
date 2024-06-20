; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10414 () Bool)

(assert start!10414)

(declare-fun res!43694 () Bool)

(declare-fun e!34683 () Bool)

(assert (=> start!10414 (=> (not res!43694) (not e!34683))))

(declare-datatypes ((array!2435 0))(
  ( (array!2436 (arr!1648 (Array (_ BitVec 32) (_ BitVec 8))) (size!1112 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2435)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10414 (= res!43694 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1112 srcBuffer!2))))))))

(assert (=> start!10414 e!34683))

(assert (=> start!10414 true))

(declare-fun array_inv!1017 (array!2435) Bool)

(assert (=> start!10414 (array_inv!1017 srcBuffer!2)))

(declare-datatypes ((BitStream!1916 0))(
  ( (BitStream!1917 (buf!1462 array!2435) (currentByte!3005 (_ BitVec 32)) (currentBit!3000 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1916)

(declare-fun e!34684 () Bool)

(declare-fun inv!12 (BitStream!1916) Bool)

(assert (=> start!10414 (and (inv!12 thiss!1379) e!34684)))

(declare-fun b!52316 () Bool)

(declare-fun res!43695 () Bool)

(assert (=> b!52316 (=> (not res!43695) (not e!34683))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52316 (= res!43695 (validate_offset_bits!1 ((_ sign_extend 32) (size!1112 (buf!1462 thiss!1379))) ((_ sign_extend 32) (currentByte!3005 thiss!1379)) ((_ sign_extend 32) (currentBit!3000 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52317 () Bool)

(assert (=> b!52317 (= e!34683 (not (or (bvsge i!635 to!314) (bvsge (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1916 BitStream!1916) Bool)

(assert (=> b!52317 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3628 0))(
  ( (Unit!3629) )
))
(declare-fun lt!81345 () Unit!3628)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1916) Unit!3628)

(assert (=> b!52317 (= lt!81345 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81346 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52317 (= lt!81346 (bitIndex!0 (size!1112 (buf!1462 thiss!1379)) (currentByte!3005 thiss!1379) (currentBit!3000 thiss!1379)))))

(declare-fun b!52318 () Bool)

(assert (=> b!52318 (= e!34684 (array_inv!1017 (buf!1462 thiss!1379)))))

(assert (= (and start!10414 res!43694) b!52316))

(assert (= (and b!52316 res!43695) b!52317))

(assert (= start!10414 b!52318))

(declare-fun m!82595 () Bool)

(assert (=> start!10414 m!82595))

(declare-fun m!82597 () Bool)

(assert (=> start!10414 m!82597))

(declare-fun m!82599 () Bool)

(assert (=> b!52316 m!82599))

(declare-fun m!82601 () Bool)

(assert (=> b!52317 m!82601))

(declare-fun m!82603 () Bool)

(assert (=> b!52317 m!82603))

(declare-fun m!82605 () Bool)

(assert (=> b!52317 m!82605))

(declare-fun m!82607 () Bool)

(assert (=> b!52318 m!82607))

(push 1)

(assert (not start!10414))

(assert (not b!52317))

(assert (not b!52316))

(assert (not b!52318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

