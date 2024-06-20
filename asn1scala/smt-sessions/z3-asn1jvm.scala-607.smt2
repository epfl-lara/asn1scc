; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17332 () Bool)

(assert start!17332)

(declare-datatypes ((array!3920 0))(
  ( (array!3921 (arr!2416 (Array (_ BitVec 32) (_ BitVec 8))) (size!1779 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3120 0))(
  ( (BitStream!3121 (buf!2169 array!3920) (currentByte!4312 (_ BitVec 32)) (currentBit!4307 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3120)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!17332 (not (invariant!0 (currentBit!4307 b!169) (currentByte!4312 b!169) (size!1779 (buf!2169 b!169))))))

(declare-fun e!56087 () Bool)

(declare-fun inv!12 (BitStream!3120) Bool)

(assert (=> start!17332 (and (inv!12 b!169) e!56087)))

(declare-fun b!84010 () Bool)

(declare-fun array_inv!1625 (array!3920) Bool)

(assert (=> b!84010 (= e!56087 (array_inv!1625 (buf!2169 b!169)))))

(assert (= start!17332 b!84010))

(declare-fun m!130695 () Bool)

(assert (=> start!17332 m!130695))

(declare-fun m!130697 () Bool)

(assert (=> start!17332 m!130697))

(declare-fun m!130699 () Bool)

(assert (=> b!84010 m!130699))

(check-sat (not start!17332) (not b!84010))
(check-sat)
(get-model)

(declare-fun d!27004 () Bool)

(assert (=> d!27004 (= (invariant!0 (currentBit!4307 b!169) (currentByte!4312 b!169) (size!1779 (buf!2169 b!169))) (and (bvsge (currentBit!4307 b!169) #b00000000000000000000000000000000) (bvslt (currentBit!4307 b!169) #b00000000000000000000000000001000) (bvsge (currentByte!4312 b!169) #b00000000000000000000000000000000) (or (bvslt (currentByte!4312 b!169) (size!1779 (buf!2169 b!169))) (and (= (currentBit!4307 b!169) #b00000000000000000000000000000000) (= (currentByte!4312 b!169) (size!1779 (buf!2169 b!169)))))))))

(assert (=> start!17332 d!27004))

(declare-fun d!27010 () Bool)

(assert (=> d!27010 (= (inv!12 b!169) (invariant!0 (currentBit!4307 b!169) (currentByte!4312 b!169) (size!1779 (buf!2169 b!169))))))

(declare-fun bs!6669 () Bool)

(assert (= bs!6669 d!27010))

(assert (=> bs!6669 m!130695))

(assert (=> start!17332 d!27010))

(declare-fun d!27016 () Bool)

(assert (=> d!27016 (= (array_inv!1625 (buf!2169 b!169)) (bvsge (size!1779 (buf!2169 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!84010 d!27016))

(check-sat (not d!27010))
(check-sat)
