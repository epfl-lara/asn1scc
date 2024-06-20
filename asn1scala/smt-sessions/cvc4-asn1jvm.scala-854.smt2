; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24746 () Bool)

(assert start!24746)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5656 0))(
  ( (array!5657 (arr!3155 (Array (_ BitVec 32) (_ BitVec 8))) (size!2562 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5656)

(declare-datatypes ((BitStream!4448 0))(
  ( (BitStream!4449 (buf!2938 array!5656) (currentByte!5649 (_ BitVec 32)) (currentBit!5644 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4448)

(assert (=> start!24746 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2562 arr!227)) (or (bvsgt ((_ sign_extend 32) (size!2562 (buf!2938 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5649 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5644 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!24746 true))

(declare-fun array_inv!2351 (array!5656) Bool)

(assert (=> start!24746 (array_inv!2351 arr!227)))

(declare-fun e!82630 () Bool)

(declare-fun inv!12 (BitStream!4448) Bool)

(assert (=> start!24746 (and (inv!12 thiss!1614) e!82630)))

(declare-fun b!125618 () Bool)

(assert (=> b!125618 (= e!82630 (array_inv!2351 (buf!2938 thiss!1614)))))

(assert (= start!24746 b!125618))

(declare-fun m!190971 () Bool)

(assert (=> start!24746 m!190971))

(declare-fun m!190973 () Bool)

(assert (=> start!24746 m!190973))

(declare-fun m!190975 () Bool)

(assert (=> b!125618 m!190975))

(push 1)

(assert (not b!125618))

(assert (not start!24746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

