; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25302 () Bool)

(assert start!25302)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5867 0))(
  ( (array!5868 (arr!3270 (Array (_ BitVec 32) (_ BitVec 8))) (size!2653 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5867)

(declare-datatypes ((BitStream!4570 0))(
  ( (BitStream!4571 (buf!3011 array!5867) (currentByte!5756 (_ BitVec 32)) (currentBit!5751 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4570)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25302 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2653 arr!237)) (or (bvsgt ((_ sign_extend 32) (size!2653 (buf!3011 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5756 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5751 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!25302 true))

(declare-fun array_inv!2442 (array!5867) Bool)

(assert (=> start!25302 (array_inv!2442 arr!237)))

(declare-fun e!84730 () Bool)

(declare-fun inv!12 (BitStream!4570) Bool)

(assert (=> start!25302 (and (inv!12 thiss!1634) e!84730)))

(declare-fun b!127886 () Bool)

(assert (=> b!127886 (= e!84730 (array_inv!2442 (buf!3011 thiss!1634)))))

(assert (= start!25302 b!127886))

(declare-fun m!193677 () Bool)

(assert (=> start!25302 m!193677))

(declare-fun m!193679 () Bool)

(assert (=> start!25302 m!193679))

(declare-fun m!193681 () Bool)

(assert (=> b!127886 m!193681))

(push 1)

(assert (not start!25302))

(assert (not b!127886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

