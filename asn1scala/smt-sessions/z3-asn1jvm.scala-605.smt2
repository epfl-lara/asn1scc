; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17292 () Bool)

(assert start!17292)

(declare-datatypes ((array!3904 0))(
  ( (array!3905 (arr!2410 (Array (_ BitVec 32) (_ BitVec 8))) (size!1773 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3108 0))(
  ( (BitStream!3109 (buf!2163 array!3904) (currentByte!4302 (_ BitVec 32)) (currentBit!4297 (_ BitVec 32))) )
))
(declare-fun b!169 () BitStream!3108)

(assert (=> start!17292 (and (bvsle ((_ sign_extend 32) (size!1773 (buf!2163 b!169))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4302 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4297 b!169)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1773 (buf!2163 b!169))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4302 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4297 b!169)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!56042 () Bool)

(declare-fun inv!12 (BitStream!3108) Bool)

(assert (=> start!17292 (and (inv!12 b!169) e!56042)))

(declare-fun b!83983 () Bool)

(declare-fun array_inv!1619 (array!3904) Bool)

(assert (=> b!83983 (= e!56042 (array_inv!1619 (buf!2163 b!169)))))

(assert (= start!17292 b!83983))

(declare-fun m!130651 () Bool)

(assert (=> start!17292 m!130651))

(declare-fun m!130653 () Bool)

(assert (=> b!83983 m!130653))

(check-sat (not b!83983) (not start!17292))
(check-sat)
(get-model)

(declare-fun d!26968 () Bool)

(assert (=> d!26968 (= (array_inv!1619 (buf!2163 b!169)) (bvsge (size!1773 (buf!2163 b!169)) #b00000000000000000000000000000000))))

(assert (=> b!83983 d!26968))

(declare-fun d!26970 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26970 (= (inv!12 b!169) (invariant!0 (currentBit!4297 b!169) (currentByte!4302 b!169) (size!1773 (buf!2163 b!169))))))

(declare-fun bs!6655 () Bool)

(assert (= bs!6655 d!26970))

(declare-fun m!130659 () Bool)

(assert (=> bs!6655 m!130659))

(assert (=> start!17292 d!26970))

(check-sat (not d!26970))
(check-sat)
(get-model)

(declare-fun d!26974 () Bool)

(assert (=> d!26974 (= (invariant!0 (currentBit!4297 b!169) (currentByte!4302 b!169) (size!1773 (buf!2163 b!169))) (and (bvsge (currentBit!4297 b!169) #b00000000000000000000000000000000) (bvslt (currentBit!4297 b!169) #b00000000000000000000000000001000) (bvsge (currentByte!4302 b!169) #b00000000000000000000000000000000) (or (bvslt (currentByte!4302 b!169) (size!1773 (buf!2163 b!169))) (and (= (currentBit!4297 b!169) #b00000000000000000000000000000000) (= (currentByte!4302 b!169) (size!1773 (buf!2163 b!169)))))))))

(assert (=> d!26970 d!26974))

(check-sat)
