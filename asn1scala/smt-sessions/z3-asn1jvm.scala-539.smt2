; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15738 () Bool)

(assert start!15738)

(declare-fun res!65830 () Bool)

(declare-fun e!52234 () Bool)

(assert (=> start!15738 (=> (not res!65830) (not e!52234))))

(declare-fun nBits!516 () (_ BitVec 64))

(declare-datatypes ((array!3413 0))(
  ( (array!3414 (arr!2176 (Array (_ BitVec 32) (_ BitVec 8))) (size!1575 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2712 0))(
  ( (BitStream!2713 (buf!1965 array!3413) (currentByte!3843 (_ BitVec 32)) (currentBit!3838 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2712)

(assert (=> start!15738 (= res!65830 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1575 (buf!1965 thiss!1716))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3843 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3838 thiss!1716)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1575 (buf!1965 thiss!1716))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3843 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3838 thiss!1716)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15738 e!52234))

(assert (=> start!15738 true))

(declare-fun e!52235 () Bool)

(declare-fun inv!12 (BitStream!2712) Bool)

(assert (=> start!15738 (and (inv!12 thiss!1716) e!52235)))

(declare-fun b!79517 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!79517 (= e!52234 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3838 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3843 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (size!1575 (buf!1965 thiss!1716)))))))))

(declare-fun b!79518 () Bool)

(declare-fun array_inv!1421 (array!3413) Bool)

(assert (=> b!79518 (= e!52235 (array_inv!1421 (buf!1965 thiss!1716)))))

(assert (= (and start!15738 res!65830) b!79517))

(assert (= start!15738 b!79518))

(declare-fun m!124931 () Bool)

(assert (=> start!15738 m!124931))

(declare-fun m!124933 () Bool)

(assert (=> b!79517 m!124933))

(declare-fun m!124935 () Bool)

(assert (=> b!79518 m!124935))

(check-sat (not start!15738) (not b!79517) (not b!79518))
(check-sat)
(get-model)

(declare-fun d!25082 () Bool)

(assert (=> d!25082 (= (inv!12 thiss!1716) (invariant!0 (currentBit!3838 thiss!1716) (currentByte!3843 thiss!1716) (size!1575 (buf!1965 thiss!1716))))))

(declare-fun bs!6085 () Bool)

(assert (= bs!6085 d!25082))

(declare-fun m!124943 () Bool)

(assert (=> bs!6085 m!124943))

(assert (=> start!15738 d!25082))

(declare-fun d!25084 () Bool)

(assert (=> d!25084 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3838 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3843 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (size!1575 (buf!1965 thiss!1716))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3838 thiss!1716))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3838 thiss!1716))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3843 thiss!1716))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3843 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (size!1575 (buf!1965 thiss!1716))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3838 thiss!1716))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3843 thiss!1716))) ((_ extract 31 0) ((_ sign_extend 32) (size!1575 (buf!1965 thiss!1716)))))))))))

(assert (=> b!79517 d!25084))

(declare-fun d!25086 () Bool)

(assert (=> d!25086 (= (array_inv!1421 (buf!1965 thiss!1716)) (bvsge (size!1575 (buf!1965 thiss!1716)) #b00000000000000000000000000000000))))

(assert (=> b!79518 d!25086))

(check-sat (not d!25082))
(check-sat)
