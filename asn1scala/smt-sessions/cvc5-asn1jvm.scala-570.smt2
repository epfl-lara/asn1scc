; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16290 () Bool)

(assert start!16290)

(declare-fun res!67468 () Bool)

(declare-fun e!53783 () Bool)

(assert (=> start!16290 (=> (not res!67468) (not e!53783))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3627 0))(
  ( (array!3628 (arr!2304 (Array (_ BitVec 32) (_ BitVec 8))) (size!1667 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2896 0))(
  ( (BitStream!2897 (buf!2057 array!3627) (currentByte!3989 (_ BitVec 32)) (currentBit!3984 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2896)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2896)

(assert (=> start!16290 (= res!67468 (and (= (size!1667 (buf!2057 b1!98)) (size!1667 (buf!2057 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11) (bvsle ((_ sign_extend 32) (size!1667 (buf!2057 b1!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3989 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3984 b1!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1667 (buf!2057 b1!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3989 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3984 b1!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!16290 e!53783))

(declare-fun e!53787 () Bool)

(declare-fun inv!12 (BitStream!2896) Bool)

(assert (=> start!16290 (and (inv!12 b1!98) e!53787)))

(declare-fun e!53785 () Bool)

(assert (=> start!16290 (and (inv!12 b2!98) e!53785)))

(assert (=> start!16290 true))

(declare-fun b!81766 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!81766 (= e!53783 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3984 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3989 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1667 (buf!2057 b1!98)))))))))

(declare-fun b!81767 () Bool)

(declare-fun array_inv!1513 (array!3627) Bool)

(assert (=> b!81767 (= e!53787 (array_inv!1513 (buf!2057 b1!98)))))

(declare-fun b!81768 () Bool)

(assert (=> b!81768 (= e!53785 (array_inv!1513 (buf!2057 b2!98)))))

(assert (= (and start!16290 res!67468) b!81766))

(assert (= start!16290 b!81767))

(assert (= start!16290 b!81768))

(declare-fun m!128137 () Bool)

(assert (=> start!16290 m!128137))

(declare-fun m!128139 () Bool)

(assert (=> start!16290 m!128139))

(declare-fun m!128141 () Bool)

(assert (=> b!81766 m!128141))

(declare-fun m!128143 () Bool)

(assert (=> b!81767 m!128143))

(declare-fun m!128145 () Bool)

(assert (=> b!81768 m!128145))

(push 1)

(assert (not b!81766))

(assert (not b!81767))

(assert (not b!81768))

(assert (not start!16290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25588 () Bool)

(assert (=> d!25588 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3984 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3989 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1667 (buf!2057 b1!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3984 b1!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3984 b1!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3989 b1!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3989 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1667 (buf!2057 b1!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3984 b1!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3989 b1!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1667 (buf!2057 b1!98)))))))))))

(assert (=> b!81766 d!25588))

(declare-fun d!25596 () Bool)

(assert (=> d!25596 (= (array_inv!1513 (buf!2057 b1!98)) (bvsge (size!1667 (buf!2057 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!81767 d!25596))

(declare-fun d!25598 () Bool)

(assert (=> d!25598 (= (array_inv!1513 (buf!2057 b2!98)) (bvsge (size!1667 (buf!2057 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!81768 d!25598))

(declare-fun d!25600 () Bool)

(assert (=> d!25600 (= (inv!12 b1!98) (invariant!0 (currentBit!3984 b1!98) (currentByte!3989 b1!98) (size!1667 (buf!2057 b1!98))))))

(declare-fun bs!6262 () Bool)

(assert (= bs!6262 d!25600))

(declare-fun m!128171 () Bool)

(assert (=> bs!6262 m!128171))

(assert (=> start!16290 d!25600))

(declare-fun d!25602 () Bool)

(assert (=> d!25602 (= (inv!12 b2!98) (invariant!0 (currentBit!3984 b2!98) (currentByte!3989 b2!98) (size!1667 (buf!2057 b2!98))))))

(declare-fun bs!6263 () Bool)

(assert (= bs!6263 d!25602))

(declare-fun m!128173 () Bool)

(assert (=> bs!6263 m!128173))

(assert (=> start!16290 d!25602))

(push 1)

