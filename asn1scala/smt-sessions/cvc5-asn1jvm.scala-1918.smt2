; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50196 () Bool)

(assert start!50196)

(declare-fun res!197043 () Bool)

(declare-fun e!162924 () Bool)

(assert (=> start!50196 (=> (not res!197043) (not e!162924))))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12414 0))(
  ( (array!12415 (arr!6439 (Array (_ BitVec 32) (_ BitVec 8))) (size!5452 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9868 0))(
  ( (BitStream!9869 (buf!5927 array!12414) (currentByte!11036 (_ BitVec 32)) (currentBit!11031 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9868)

(declare-fun i!756 () (_ BitVec 32))

(assert (=> start!50196 (= res!197043 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5452 (buf!5927 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11036 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11031 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5452 (buf!5927 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11036 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11031 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50196 e!162924))

(assert (=> start!50196 true))

(declare-fun e!162925 () Bool)

(declare-fun inv!12 (BitStream!9868) Bool)

(assert (=> start!50196 (and (inv!12 thiss!1848) e!162925)))

(declare-fun b!235701 () Bool)

(declare-fun res!197042 () Bool)

(assert (=> b!235701 (=> (not res!197042) (not e!162924))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235701 (= res!197042 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11031 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11036 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5452 (buf!5927 thiss!1848))))))))

(declare-fun b!235702 () Bool)

(assert (=> b!235702 (= e!162924 (bvslt ((_ sign_extend 32) (bvsub nBits!593 i!756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235703 () Bool)

(declare-fun array_inv!5193 (array!12414) Bool)

(assert (=> b!235703 (= e!162925 (array_inv!5193 (buf!5927 thiss!1848)))))

(assert (= (and start!50196 res!197043) b!235701))

(assert (= (and b!235701 res!197042) b!235702))

(assert (= start!50196 b!235703))

(declare-fun m!358395 () Bool)

(assert (=> start!50196 m!358395))

(declare-fun m!358397 () Bool)

(assert (=> b!235701 m!358397))

(declare-fun m!358399 () Bool)

(assert (=> b!235703 m!358399))

(push 1)

(assert (not start!50196))

(assert (not b!235701))

(assert (not b!235703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

