; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10402 () Bool)

(assert start!10402)

(declare-fun res!43658 () Bool)

(declare-fun e!34610 () Bool)

(assert (=> start!10402 (=> (not res!43658) (not e!34610))))

(declare-datatypes ((array!2423 0))(
  ( (array!2424 (arr!1642 (Array (_ BitVec 32) (_ BitVec 8))) (size!1106 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2423)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10402 (= res!43658 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1106 srcBuffer!2))))))))

(assert (=> start!10402 e!34610))

(assert (=> start!10402 true))

(declare-fun array_inv!1011 (array!2423) Bool)

(assert (=> start!10402 (array_inv!1011 srcBuffer!2)))

(declare-datatypes ((BitStream!1904 0))(
  ( (BitStream!1905 (buf!1456 array!2423) (currentByte!2999 (_ BitVec 32)) (currentBit!2994 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1904)

(declare-fun e!34611 () Bool)

(declare-fun inv!12 (BitStream!1904) Bool)

(assert (=> start!10402 (and (inv!12 thiss!1379) e!34611)))

(declare-fun b!52262 () Bool)

(declare-fun res!43659 () Bool)

(assert (=> b!52262 (=> (not res!43659) (not e!34610))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52262 (= res!43659 (validate_offset_bits!1 ((_ sign_extend 32) (size!1106 (buf!1456 thiss!1379))) ((_ sign_extend 32) (currentByte!2999 thiss!1379)) ((_ sign_extend 32) (currentBit!2994 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52263 () Bool)

(assert (=> b!52263 (= e!34610 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1904 BitStream!1904) Bool)

(assert (=> b!52263 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3616 0))(
  ( (Unit!3617) )
))
(declare-fun lt!81309 () Unit!3616)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1904) Unit!3616)

(assert (=> b!52263 (= lt!81309 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81310 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52263 (= lt!81310 (bitIndex!0 (size!1106 (buf!1456 thiss!1379)) (currentByte!2999 thiss!1379) (currentBit!2994 thiss!1379)))))

(declare-fun b!52264 () Bool)

(assert (=> b!52264 (= e!34611 (array_inv!1011 (buf!1456 thiss!1379)))))

(assert (= (and start!10402 res!43658) b!52262))

(assert (= (and b!52262 res!43659) b!52263))

(assert (= start!10402 b!52264))

(declare-fun m!82511 () Bool)

(assert (=> start!10402 m!82511))

(declare-fun m!82513 () Bool)

(assert (=> start!10402 m!82513))

(declare-fun m!82515 () Bool)

(assert (=> b!52262 m!82515))

(declare-fun m!82517 () Bool)

(assert (=> b!52263 m!82517))

(declare-fun m!82519 () Bool)

(assert (=> b!52263 m!82519))

(declare-fun m!82521 () Bool)

(assert (=> b!52263 m!82521))

(declare-fun m!82523 () Bool)

(assert (=> b!52264 m!82523))

(push 1)

(assert (not b!52264))

(assert (not start!10402))

(assert (not b!52263))

(assert (not b!52262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

