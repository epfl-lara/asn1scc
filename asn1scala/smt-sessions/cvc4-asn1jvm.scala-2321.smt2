; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59088 () Bool)

(assert start!59088)

(declare-fun b!270801 () Bool)

(declare-fun e!190678 () Bool)

(declare-datatypes ((array!15093 0))(
  ( (array!15094 (arr!7557 (Array (_ BitVec 32) (_ BitVec 8))) (size!6570 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11954 0))(
  ( (BitStream!11955 (buf!7038 array!15093) (currentByte!13012 (_ BitVec 32)) (currentBit!13007 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11954)

(declare-fun array_inv!6294 (array!15093) Bool)

(assert (=> b!270801 (= e!190678 (array_inv!6294 (buf!7038 w3!25)))))

(declare-fun b!270802 () Bool)

(declare-fun e!190672 () Bool)

(declare-fun w1!591 () BitStream!11954)

(assert (=> b!270802 (= e!190672 (and (bvsge (currentByte!13012 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13012 w1!591) (size!6570 (buf!7038 w3!25)))))))

(declare-fun w2!587 () BitStream!11954)

(assert (=> b!270802 (= (select (arr!7557 (buf!7038 w2!587)) (currentByte!13012 w1!591)) (select (arr!7557 (buf!7038 w3!25)) (currentByte!13012 w1!591)))))

(declare-datatypes ((Unit!19095 0))(
  ( (Unit!19096) )
))
(declare-fun lt!409627 () Unit!19095)

(declare-fun arrayRangesEqImpliesEq!162 (array!15093 array!15093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19095)

(assert (=> b!270802 (= lt!409627 (arrayRangesEqImpliesEq!162 (buf!7038 w2!587) (buf!7038 w3!25) #b00000000000000000000000000000000 (currentByte!13012 w1!591) (currentByte!13012 w2!587)))))

(declare-fun b!270803 () Bool)

(declare-fun e!190675 () Bool)

(assert (=> b!270803 (= e!190675 (array_inv!6294 (buf!7038 w1!591)))))

(declare-fun b!270804 () Bool)

(declare-fun e!190671 () Bool)

(assert (=> b!270804 (= e!190671 (array_inv!6294 (buf!7038 w2!587)))))

(declare-fun res!225655 () Bool)

(declare-fun e!190674 () Bool)

(assert (=> start!59088 (=> (not res!225655) (not e!190674))))

(declare-fun isPrefixOf!0 (BitStream!11954 BitStream!11954) Bool)

(assert (=> start!59088 (= res!225655 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59088 e!190674))

(declare-fun inv!12 (BitStream!11954) Bool)

(assert (=> start!59088 (and (inv!12 w1!591) e!190675)))

(assert (=> start!59088 (and (inv!12 w2!587) e!190671)))

(assert (=> start!59088 (and (inv!12 w3!25) e!190678)))

(declare-fun b!270805 () Bool)

(assert (=> b!270805 (= e!190674 (not e!190672))))

(declare-fun res!225653 () Bool)

(assert (=> b!270805 (=> res!225653 e!190672)))

(assert (=> b!270805 (= res!225653 (or (bvsge (currentByte!13012 w1!591) (size!6570 (buf!7038 w1!591))) (bvsge (currentByte!13012 w1!591) (currentByte!13012 w2!587))))))

(declare-fun arrayRangesEq!1102 (array!15093 array!15093 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270805 (arrayRangesEq!1102 (buf!7038 w1!591) (buf!7038 w3!25) #b00000000000000000000000000000000 (currentByte!13012 w1!591))))

(declare-fun lt!409628 () Unit!19095)

(declare-fun arrayRangesEqTransitive!365 (array!15093 array!15093 array!15093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19095)

(assert (=> b!270805 (= lt!409628 (arrayRangesEqTransitive!365 (buf!7038 w1!591) (buf!7038 w2!587) (buf!7038 w3!25) #b00000000000000000000000000000000 (currentByte!13012 w1!591) (currentByte!13012 w2!587)))))

(declare-fun b!270806 () Bool)

(declare-fun res!225654 () Bool)

(assert (=> b!270806 (=> (not res!225654) (not e!190674))))

(assert (=> b!270806 (= res!225654 (isPrefixOf!0 w2!587 w3!25))))

(assert (= (and start!59088 res!225655) b!270806))

(assert (= (and b!270806 res!225654) b!270805))

(assert (= (and b!270805 (not res!225653)) b!270802))

(assert (= start!59088 b!270803))

(assert (= start!59088 b!270804))

(assert (= start!59088 b!270801))

(declare-fun m!402895 () Bool)

(assert (=> b!270806 m!402895))

(declare-fun m!402897 () Bool)

(assert (=> b!270801 m!402897))

(declare-fun m!402899 () Bool)

(assert (=> b!270805 m!402899))

(declare-fun m!402901 () Bool)

(assert (=> b!270805 m!402901))

(declare-fun m!402903 () Bool)

(assert (=> b!270804 m!402903))

(declare-fun m!402905 () Bool)

(assert (=> b!270803 m!402905))

(declare-fun m!402907 () Bool)

(assert (=> start!59088 m!402907))

(declare-fun m!402909 () Bool)

(assert (=> start!59088 m!402909))

(declare-fun m!402911 () Bool)

(assert (=> start!59088 m!402911))

(declare-fun m!402913 () Bool)

(assert (=> start!59088 m!402913))

(declare-fun m!402915 () Bool)

(assert (=> b!270802 m!402915))

(declare-fun m!402917 () Bool)

(assert (=> b!270802 m!402917))

(declare-fun m!402919 () Bool)

(assert (=> b!270802 m!402919))

(push 1)

(assert (not start!59088))

(assert (not b!270803))

(assert (not b!270805))

(assert (not b!270806))

(assert (not b!270804))

(assert (not b!270802))

(assert (not b!270801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92134 () Bool)

(declare-fun res!225689 () Bool)

(declare-fun e!190703 () Bool)

(assert (=> d!92134 (=> (not res!225689) (not e!190703))))

(assert (=> d!92134 (= res!225689 (= (size!6570 (buf!7038 w2!587)) (size!6570 (buf!7038 w3!25))))))

(assert (=> d!92134 (= (isPrefixOf!0 w2!587 w3!25) e!190703)))

(declare-fun b!270840 () Bool)

(declare-fun res!225690 () Bool)

(assert (=> b!270840 (=> (not res!225690) (not e!190703))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270840 (= res!225690 (bvsle (bitIndex!0 (size!6570 (buf!7038 w2!587)) (currentByte!13012 w2!587) (currentBit!13007 w2!587)) (bitIndex!0 (size!6570 (buf!7038 w3!25)) (currentByte!13012 w3!25) (currentBit!13007 w3!25))))))

(declare-fun b!270841 () Bool)

(declare-fun e!190704 () Bool)

(assert (=> b!270841 (= e!190703 e!190704)))

(declare-fun res!225691 () Bool)

(assert (=> b!270841 (=> res!225691 e!190704)))

(assert (=> b!270841 (= res!225691 (= (size!6570 (buf!7038 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270842 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15093 array!15093 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270842 (= e!190704 (arrayBitRangesEq!0 (buf!7038 w2!587) (buf!7038 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6570 (buf!7038 w2!587)) (currentByte!13012 w2!587) (currentBit!13007 w2!587))))))

(assert (= (and d!92134 res!225689) b!270840))

(assert (= (and b!270840 res!225690) b!270841))

(assert (= (and b!270841 (not res!225691)) b!270842))

(declare-fun m!402955 () Bool)

(assert (=> b!270840 m!402955))

(declare-fun m!402957 () Bool)

(assert (=> b!270840 m!402957))

(assert (=> b!270842 m!402955))

(assert (=> b!270842 m!402955))

(declare-fun m!402959 () Bool)

(assert (=> b!270842 m!402959))

(assert (=> b!270806 d!92134))

(declare-fun d!92156 () Bool)

(assert (=> d!92156 (= (array_inv!6294 (buf!7038 w3!25)) (bvsge (size!6570 (buf!7038 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270801 d!92156))

(declare-fun d!92158 () Bool)

(assert (=> d!92158 (and (bvsge (currentByte!13012 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13012 w1!591) (size!6570 (buf!7038 w2!587))) (bvslt (currentByte!13012 w1!591) (size!6570 (buf!7038 w3!25))) (= (select (arr!7557 (buf!7038 w2!587)) (currentByte!13012 w1!591)) (select (arr!7557 (buf!7038 w3!25)) (currentByte!13012 w1!591))))))

(declare-fun lt!409643 () Unit!19095)

