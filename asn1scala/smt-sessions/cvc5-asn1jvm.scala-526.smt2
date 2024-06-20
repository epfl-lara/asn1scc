; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15268 () Bool)

(assert start!15268)

(declare-fun res!64336 () Bool)

(declare-fun e!51103 () Bool)

(assert (=> start!15268 (=> (not res!64336) (not e!51103))))

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3308 0))(
  ( (array!3309 (arr!2136 (Array (_ BitVec 32) (_ BitVec 8))) (size!1535 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2632 0))(
  ( (BitStream!2633 (buf!1925 array!3308) (currentByte!3743 (_ BitVec 32)) (currentBit!3738 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2632)

(assert (=> start!15268 (= res!64336 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!1535 (buf!1925 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3743 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3738 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1535 (buf!1925 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3743 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3738 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15268 e!51103))

(assert (=> start!15268 true))

(declare-fun e!51104 () Bool)

(declare-fun inv!12 (BitStream!2632) Bool)

(assert (=> start!15268 (and (inv!12 thiss!1107) e!51104)))

(declare-fun b!77903 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!77903 (= e!51103 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3738 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3743 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (size!1535 (buf!1925 thiss!1107)))))))))

(declare-fun b!77904 () Bool)

(declare-fun array_inv!1381 (array!3308) Bool)

(assert (=> b!77904 (= e!51104 (array_inv!1381 (buf!1925 thiss!1107)))))

(assert (= (and start!15268 res!64336) b!77903))

(assert (= start!15268 b!77904))

(declare-fun m!123533 () Bool)

(assert (=> start!15268 m!123533))

(declare-fun m!123535 () Bool)

(assert (=> b!77903 m!123535))

(declare-fun m!123537 () Bool)

(assert (=> b!77904 m!123537))

(push 1)

(assert (not start!15268))

(assert (not b!77903))

(assert (not b!77904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

