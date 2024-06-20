; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10422 () Bool)

(assert start!10422)

(declare-fun res!43719 () Bool)

(declare-fun e!34733 () Bool)

(assert (=> start!10422 (=> (not res!43719) (not e!34733))))

(declare-datatypes ((array!2443 0))(
  ( (array!2444 (arr!1652 (Array (_ BitVec 32) (_ BitVec 8))) (size!1116 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2443)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10422 (= res!43719 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1116 srcBuffer!2))))))))

(assert (=> start!10422 e!34733))

(assert (=> start!10422 true))

(declare-fun array_inv!1021 (array!2443) Bool)

(assert (=> start!10422 (array_inv!1021 srcBuffer!2)))

(declare-datatypes ((BitStream!1924 0))(
  ( (BitStream!1925 (buf!1466 array!2443) (currentByte!3009 (_ BitVec 32)) (currentBit!3004 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1924)

(declare-fun e!34730 () Bool)

(declare-fun inv!12 (BitStream!1924) Bool)

(assert (=> start!10422 (and (inv!12 thiss!1379) e!34730)))

(declare-fun b!52352 () Bool)

(declare-fun res!43718 () Bool)

(assert (=> b!52352 (=> (not res!43718) (not e!34733))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52352 (= res!43718 (validate_offset_bits!1 ((_ sign_extend 32) (size!1116 (buf!1466 thiss!1379))) ((_ sign_extend 32) (currentByte!3009 thiss!1379)) ((_ sign_extend 32) (currentBit!3004 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52353 () Bool)

(assert (=> b!52353 (= e!34733 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1924 BitStream!1924) Bool)

(assert (=> b!52353 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3636 0))(
  ( (Unit!3637) )
))
(declare-fun lt!81370 () Unit!3636)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1924) Unit!3636)

(assert (=> b!52353 (= lt!81370 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81369 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52353 (= lt!81369 (bitIndex!0 (size!1116 (buf!1466 thiss!1379)) (currentByte!3009 thiss!1379) (currentBit!3004 thiss!1379)))))

(declare-fun b!52354 () Bool)

(assert (=> b!52354 (= e!34730 (array_inv!1021 (buf!1466 thiss!1379)))))

(assert (= (and start!10422 res!43719) b!52352))

(assert (= (and b!52352 res!43718) b!52353))

(assert (= start!10422 b!52354))

(declare-fun m!82651 () Bool)

(assert (=> start!10422 m!82651))

(declare-fun m!82653 () Bool)

(assert (=> start!10422 m!82653))

(declare-fun m!82655 () Bool)

(assert (=> b!52352 m!82655))

(declare-fun m!82657 () Bool)

(assert (=> b!52353 m!82657))

(declare-fun m!82659 () Bool)

(assert (=> b!52353 m!82659))

(declare-fun m!82661 () Bool)

(assert (=> b!52353 m!82661))

(declare-fun m!82663 () Bool)

(assert (=> b!52354 m!82663))

(push 1)

(assert (not b!52352))

(assert (not b!52353))

(assert (not start!10422))

(assert (not b!52354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

