; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25328 () Bool)

(assert start!25328)

(declare-fun res!105850 () Bool)

(declare-fun e!84810 () Bool)

(assert (=> start!25328 (=> (not res!105850) (not e!84810))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5885 0))(
  ( (array!5886 (arr!3278 (Array (_ BitVec 32) (_ BitVec 8))) (size!2661 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5885)

(declare-datatypes ((BitStream!4586 0))(
  ( (BitStream!4587 (buf!3019 array!5885) (currentByte!5765 (_ BitVec 32)) (currentBit!5760 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4586)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25328 (= res!105850 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2661 arr!237)) (bvsle ((_ sign_extend 32) (size!2661 (buf!3019 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5765 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5760 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2661 (buf!3019 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5765 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5760 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!25328 e!84810))

(assert (=> start!25328 true))

(declare-fun array_inv!2450 (array!5885) Bool)

(assert (=> start!25328 (array_inv!2450 arr!237)))

(declare-fun e!84812 () Bool)

(declare-fun inv!12 (BitStream!4586) Bool)

(assert (=> start!25328 (and (inv!12 thiss!1634) e!84812)))

(declare-fun b!127918 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127918 (= e!84810 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5760 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5765 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2661 (buf!3019 thiss!1634)))))))))

(declare-fun b!127919 () Bool)

(assert (=> b!127919 (= e!84812 (array_inv!2450 (buf!3019 thiss!1634)))))

(assert (= (and start!25328 res!105850) b!127918))

(assert (= start!25328 b!127919))

(declare-fun m!193733 () Bool)

(assert (=> start!25328 m!193733))

(declare-fun m!193735 () Bool)

(assert (=> start!25328 m!193735))

(declare-fun m!193737 () Bool)

(assert (=> b!127918 m!193737))

(declare-fun m!193739 () Bool)

(assert (=> b!127919 m!193739))

(push 1)

(assert (not b!127918))

(assert (not b!127919))

(assert (not start!25328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

