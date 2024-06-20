; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24774 () Bool)

(assert start!24774)

(declare-fun res!104071 () Bool)

(declare-fun e!82693 () Bool)

(assert (=> start!24774 (=> (not res!104071) (not e!82693))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5671 0))(
  ( (array!5672 (arr!3161 (Array (_ BitVec 32) (_ BitVec 8))) (size!2568 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4460 0))(
  ( (BitStream!4461 (buf!2944 array!5671) (currentByte!5657 (_ BitVec 32)) (currentBit!5652 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4460)

(declare-fun arr!227 () array!5671)

(assert (=> start!24774 (= res!104071 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2568 arr!227)) (bvsle ((_ sign_extend 32) (size!2568 (buf!2944 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5657 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5652 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2568 (buf!2944 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5657 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5652 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!24774 e!82693))

(assert (=> start!24774 true))

(declare-fun array_inv!2357 (array!5671) Bool)

(assert (=> start!24774 (array_inv!2357 arr!227)))

(declare-fun e!82691 () Bool)

(declare-fun inv!12 (BitStream!4460) Bool)

(assert (=> start!24774 (and (inv!12 thiss!1614) e!82691)))

(declare-fun b!125644 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125644 (= e!82693 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5652 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5657 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (size!2568 (buf!2944 thiss!1614)))))))))

(declare-fun b!125645 () Bool)

(assert (=> b!125645 (= e!82691 (array_inv!2357 (buf!2944 thiss!1614)))))

(assert (= (and start!24774 res!104071) b!125644))

(assert (= start!24774 b!125645))

(declare-fun m!191015 () Bool)

(assert (=> start!24774 m!191015))

(declare-fun m!191017 () Bool)

(assert (=> start!24774 m!191017))

(declare-fun m!191019 () Bool)

(assert (=> b!125644 m!191019))

(declare-fun m!191021 () Bool)

(assert (=> b!125645 m!191021))

(push 1)

(assert (not b!125644))

(assert (not b!125645))

(assert (not start!24774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

