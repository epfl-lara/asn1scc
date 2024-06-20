; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25324 () Bool)

(assert start!25324)

(declare-fun res!105844 () Bool)

(declare-fun e!84787 () Bool)

(assert (=> start!25324 (=> (not res!105844) (not e!84787))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5881 0))(
  ( (array!5882 (arr!3276 (Array (_ BitVec 32) (_ BitVec 8))) (size!2659 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5881)

(declare-datatypes ((BitStream!4582 0))(
  ( (BitStream!4583 (buf!3017 array!5881) (currentByte!5763 (_ BitVec 32)) (currentBit!5758 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4582)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25324 (= res!105844 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2659 arr!237)) (bvsle ((_ sign_extend 32) (size!2659 (buf!3017 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5763 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5758 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2659 (buf!3017 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5763 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5758 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!25324 e!84787))

(assert (=> start!25324 true))

(declare-fun array_inv!2448 (array!5881) Bool)

(assert (=> start!25324 (array_inv!2448 arr!237)))

(declare-fun e!84785 () Bool)

(declare-fun inv!12 (BitStream!4582) Bool)

(assert (=> start!25324 (and (inv!12 thiss!1634) e!84785)))

(declare-fun b!127906 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127906 (= e!84787 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5758 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5763 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2659 (buf!3017 thiss!1634)))))))))

(declare-fun b!127907 () Bool)

(assert (=> b!127907 (= e!84785 (array_inv!2448 (buf!3017 thiss!1634)))))

(assert (= (and start!25324 res!105844) b!127906))

(assert (= start!25324 b!127907))

(declare-fun m!193717 () Bool)

(assert (=> start!25324 m!193717))

(declare-fun m!193719 () Bool)

(assert (=> start!25324 m!193719))

(declare-fun m!193721 () Bool)

(assert (=> b!127906 m!193721))

(declare-fun m!193723 () Bool)

(assert (=> b!127907 m!193723))

(push 1)

(assert (not b!127906))

(assert (not b!127907))

(assert (not start!25324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

