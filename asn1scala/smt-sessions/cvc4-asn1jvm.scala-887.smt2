; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25312 () Bool)

(assert start!25312)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5877 0))(
  ( (array!5878 (arr!3275 (Array (_ BitVec 32) (_ BitVec 8))) (size!2658 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5877)

(declare-datatypes ((BitStream!4580 0))(
  ( (BitStream!4581 (buf!3016 array!5877) (currentByte!5761 (_ BitVec 32)) (currentBit!5756 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4580)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25312 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2658 arr!237)) (bvsle ((_ sign_extend 32) (size!2658 (buf!3016 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5761 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5756 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2658 (buf!3016 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5761 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5756 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!25312 true))

(declare-fun array_inv!2447 (array!5877) Bool)

(assert (=> start!25312 (array_inv!2447 arr!237)))

(declare-fun e!84775 () Bool)

(declare-fun inv!12 (BitStream!4580) Bool)

(assert (=> start!25312 (and (inv!12 thiss!1634) e!84775)))

(declare-fun b!127901 () Bool)

(assert (=> b!127901 (= e!84775 (array_inv!2447 (buf!3016 thiss!1634)))))

(assert (= start!25312 b!127901))

(declare-fun m!193707 () Bool)

(assert (=> start!25312 m!193707))

(declare-fun m!193709 () Bool)

(assert (=> start!25312 m!193709))

(declare-fun m!193711 () Bool)

(assert (=> b!127901 m!193711))

(push 1)

(assert (not start!25312))

(assert (not b!127901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

