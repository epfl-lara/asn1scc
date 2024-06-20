; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50182 () Bool)

(assert start!50182)

(declare-fun res!197037 () Bool)

(declare-fun e!162915 () Bool)

(assert (=> start!50182 (=> (not res!197037) (not e!162915))))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12410 0))(
  ( (array!12411 (arr!6438 (Array (_ BitVec 32) (_ BitVec 8))) (size!5451 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9866 0))(
  ( (BitStream!9867 (buf!5926 array!12410) (currentByte!11033 (_ BitVec 32)) (currentBit!11028 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9866)

(declare-fun i!756 () (_ BitVec 32))

(assert (=> start!50182 (= res!197037 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5451 (buf!5926 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11033 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11028 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5451 (buf!5926 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11033 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11028 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50182 e!162915))

(assert (=> start!50182 true))

(declare-fun e!162916 () Bool)

(declare-fun inv!12 (BitStream!9866) Bool)

(assert (=> start!50182 (and (inv!12 thiss!1848) e!162916)))

(declare-fun b!235693 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235693 (= e!162915 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11028 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11033 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5451 (buf!5926 thiss!1848)))))))))

(declare-fun b!235694 () Bool)

(declare-fun array_inv!5192 (array!12410) Bool)

(assert (=> b!235694 (= e!162916 (array_inv!5192 (buf!5926 thiss!1848)))))

(assert (= (and start!50182 res!197037) b!235693))

(assert (= start!50182 b!235694))

(declare-fun m!358385 () Bool)

(assert (=> start!50182 m!358385))

(declare-fun m!358387 () Bool)

(assert (=> b!235693 m!358387))

(declare-fun m!358389 () Bool)

(assert (=> b!235694 m!358389))

(push 1)

(assert (not start!50182))

(assert (not b!235694))

(assert (not b!235693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

