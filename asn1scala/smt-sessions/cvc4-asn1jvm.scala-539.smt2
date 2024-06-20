; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15740 () Bool)

(assert start!15740)

(declare-fun res!65833 () Bool)

(declare-fun e!52243 () Bool)

(assert (=> start!15740 (=> (not res!65833) (not e!52243))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3415 0))(
  ( (array!3416 (arr!2177 (Array (_ BitVec 32) (_ BitVec 8))) (size!1576 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2714 0))(
  ( (BitStream!2715 (buf!1966 array!3415) (currentByte!3844 (_ BitVec 32)) (currentBit!3839 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2714)

(assert (=> start!15740 (= res!65833 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1576 (buf!1966 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3844 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3839 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1576 (buf!1966 thiss!1716))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3844 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3839 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15740 e!52243))

(assert (=> start!15740 true))

(declare-fun e!52244 () Bool)

(declare-fun inv!12 (BitStream!2714) Bool)

(assert (=> start!15740 (and (inv!12 thiss!1716) e!52244)))

(declare-fun b!79523 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79523 (= e!52243 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3839 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3844 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (size!1576 (buf!1966 thiss!1716)))))))))

(declare-fun b!79524 () Bool)

(declare-fun array_inv!1422 (array!3415) Bool)

(assert (=> b!79524 (= e!52244 (array_inv!1422 (buf!1966 thiss!1716)))))

(assert (= (and start!15740 res!65833) b!79523))

(assert (= start!15740 b!79524))

(declare-fun m!124937 () Bool)

(assert (=> start!15740 m!124937))

(declare-fun m!124939 () Bool)

(assert (=> b!79523 m!124939))

(declare-fun m!124941 () Bool)

(assert (=> b!79524 m!124941))

(push 1)

(assert (not start!15740))

(assert (not b!79523))

(assert (not b!79524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

