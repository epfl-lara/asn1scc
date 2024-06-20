; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10356 () Bool)

(assert start!10356)

(declare-fun res!43556 () Bool)

(declare-fun e!34418 () Bool)

(assert (=> start!10356 (=> (not res!43556) (not e!34418))))

(declare-datatypes ((array!2383 0))(
  ( (array!2384 (arr!1622 (Array (_ BitVec 32) (_ BitVec 8))) (size!1086 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2383)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10356 (= res!43556 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1086 srcBuffer!2))))))))

(assert (=> start!10356 e!34418))

(assert (=> start!10356 true))

(declare-fun array_inv!991 (array!2383) Bool)

(assert (=> start!10356 (array_inv!991 srcBuffer!2)))

(declare-datatypes ((BitStream!1876 0))(
  ( (BitStream!1877 (buf!1442 array!2383) (currentByte!2985 (_ BitVec 32)) (currentBit!2980 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1876)

(declare-fun e!34416 () Bool)

(declare-fun inv!12 (BitStream!1876) Bool)

(assert (=> start!10356 (and (inv!12 thiss!1379) e!34416)))

(declare-fun b!52118 () Bool)

(declare-fun res!43557 () Bool)

(assert (=> b!52118 (=> (not res!43557) (not e!34418))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52118 (= res!43557 (validate_offset_bits!1 ((_ sign_extend 32) (size!1086 (buf!1442 thiss!1379))) ((_ sign_extend 32) (currentByte!2985 thiss!1379)) ((_ sign_extend 32) (currentBit!2980 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52119 () Bool)

(assert (=> b!52119 (= e!34418 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1876 BitStream!1876) Bool)

(assert (=> b!52119 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3594 0))(
  ( (Unit!3595) )
))
(declare-fun lt!81235 () Unit!3594)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1876) Unit!3594)

(assert (=> b!52119 (= lt!81235 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81234 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52119 (= lt!81234 (bitIndex!0 (size!1086 (buf!1442 thiss!1379)) (currentByte!2985 thiss!1379) (currentBit!2980 thiss!1379)))))

(declare-fun b!52120 () Bool)

(assert (=> b!52120 (= e!34416 (array_inv!991 (buf!1442 thiss!1379)))))

(assert (= (and start!10356 res!43556) b!52118))

(assert (= (and b!52118 res!43557) b!52119))

(assert (= start!10356 b!52120))

(declare-fun m!82303 () Bool)

(assert (=> start!10356 m!82303))

(declare-fun m!82305 () Bool)

(assert (=> start!10356 m!82305))

(declare-fun m!82307 () Bool)

(assert (=> b!52118 m!82307))

(declare-fun m!82309 () Bool)

(assert (=> b!52119 m!82309))

(declare-fun m!82311 () Bool)

(assert (=> b!52119 m!82311))

(declare-fun m!82313 () Bool)

(assert (=> b!52119 m!82313))

(declare-fun m!82315 () Bool)

(assert (=> b!52120 m!82315))

(push 1)

(assert (not b!52118))

(assert (not b!52120))

(assert (not b!52119))

(assert (not start!10356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

