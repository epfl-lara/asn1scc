; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24770 () Bool)

(assert start!24770)

(declare-fun res!104065 () Bool)

(declare-fun e!82668 () Bool)

(assert (=> start!24770 (=> (not res!104065) (not e!82668))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5667 0))(
  ( (array!5668 (arr!3159 (Array (_ BitVec 32) (_ BitVec 8))) (size!2566 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4456 0))(
  ( (BitStream!4457 (buf!2942 array!5667) (currentByte!5655 (_ BitVec 32)) (currentBit!5650 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4456)

(declare-fun arr!227 () array!5667)

(assert (=> start!24770 (= res!104065 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2566 arr!227)) (bvsle ((_ sign_extend 32) (size!2566 (buf!2942 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5655 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5650 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2566 (buf!2942 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5655 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5650 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!24770 e!82668))

(assert (=> start!24770 true))

(declare-fun array_inv!2355 (array!5667) Bool)

(assert (=> start!24770 (array_inv!2355 arr!227)))

(declare-fun e!82670 () Bool)

(declare-fun inv!12 (BitStream!4456) Bool)

(assert (=> start!24770 (and (inv!12 thiss!1614) e!82670)))

(declare-fun b!125632 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125632 (= e!82668 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5650 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5655 thiss!1614))) ((_ extract 31 0) ((_ sign_extend 32) (size!2566 (buf!2942 thiss!1614)))))))))

(declare-fun b!125633 () Bool)

(assert (=> b!125633 (= e!82670 (array_inv!2355 (buf!2942 thiss!1614)))))

(assert (= (and start!24770 res!104065) b!125632))

(assert (= start!24770 b!125633))

(declare-fun m!190999 () Bool)

(assert (=> start!24770 m!190999))

(declare-fun m!191001 () Bool)

(assert (=> start!24770 m!191001))

(declare-fun m!191003 () Bool)

(assert (=> b!125632 m!191003))

(declare-fun m!191005 () Bool)

(assert (=> b!125633 m!191005))

(push 1)

(assert (not b!125632))

(assert (not b!125633))

(assert (not start!24770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40842 () Bool)

