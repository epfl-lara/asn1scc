; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72658 () Bool)

(assert start!72658)

(declare-datatypes ((array!20820 0))(
  ( (array!20821 (arr!10145 (Array (_ BitVec 32) (_ BitVec 8))) (size!9053 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14268 0))(
  ( (BitStream!14269 (buf!8195 array!20820) (currentByte!15147 (_ BitVec 32)) (currentBit!15142 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14268)

(assert (=> start!72658 (and (bvsle ((_ sign_extend 32) (size!9053 (buf!8195 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15147 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15142 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9053 (buf!8195 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15147 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15142 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233786 () Bool)

(declare-fun inv!12 (BitStream!14268) Bool)

(assert (=> start!72658 (and (inv!12 thiss!877) e!233786)))

(declare-fun b!324352 () Bool)

(declare-fun array_inv!8605 (array!20820) Bool)

(assert (=> b!324352 (= e!233786 (array_inv!8605 (buf!8195 thiss!877)))))

(assert (= start!72658 b!324352))

(declare-fun m!462471 () Bool)

(assert (=> start!72658 m!462471))

(declare-fun m!462473 () Bool)

(assert (=> b!324352 m!462473))

(check-sat (not start!72658) (not b!324352))
(check-sat)
(get-model)

(declare-fun d!106586 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106586 (= (inv!12 thiss!877) (invariant!0 (currentBit!15142 thiss!877) (currentByte!15147 thiss!877) (size!9053 (buf!8195 thiss!877))))))

(declare-fun bs!28078 () Bool)

(assert (= bs!28078 d!106586))

(declare-fun m!462479 () Bool)

(assert (=> bs!28078 m!462479))

(assert (=> start!72658 d!106586))

(declare-fun d!106588 () Bool)

(assert (=> d!106588 (= (array_inv!8605 (buf!8195 thiss!877)) (bvsge (size!9053 (buf!8195 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324352 d!106588))

(check-sat (not d!106586))
(check-sat)
(get-model)

(declare-fun d!106594 () Bool)

(assert (=> d!106594 (= (invariant!0 (currentBit!15142 thiss!877) (currentByte!15147 thiss!877) (size!9053 (buf!8195 thiss!877))) (and (bvsge (currentBit!15142 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15142 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15147 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15147 thiss!877) (size!9053 (buf!8195 thiss!877))) (and (= (currentBit!15142 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15147 thiss!877) (size!9053 (buf!8195 thiss!877)))))))))

(assert (=> d!106586 d!106594))

(check-sat)
