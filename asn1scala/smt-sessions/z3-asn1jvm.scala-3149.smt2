; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72304 () Bool)

(assert start!72304)

(declare-datatypes ((array!20709 0))(
  ( (array!20710 (arr!10106 (Array (_ BitVec 32) (_ BitVec 8))) (size!9014 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14190 0))(
  ( (BitStream!14191 (buf!8156 array!20709) (currentByte!15048 (_ BitVec 32)) (currentBit!15043 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14190)

(assert (=> start!72304 (and (bvsle ((_ sign_extend 32) (size!9014 (buf!8156 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15048 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15043 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9014 (buf!8156 thiss!1711))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15048 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!15043 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!233384 () Bool)

(declare-fun inv!12 (BitStream!14190) Bool)

(assert (=> start!72304 (and (inv!12 thiss!1711) e!233384)))

(declare-fun b!323980 () Bool)

(declare-fun array_inv!8566 (array!20709) Bool)

(assert (=> b!323980 (= e!233384 (array_inv!8566 (buf!8156 thiss!1711)))))

(assert (= start!72304 b!323980))

(declare-fun m!462031 () Bool)

(assert (=> start!72304 m!462031))

(declare-fun m!462033 () Bool)

(assert (=> b!323980 m!462033))

(check-sat (not start!72304) (not b!323980))
(check-sat)
(get-model)

(declare-fun d!106260 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106260 (= (inv!12 thiss!1711) (invariant!0 (currentBit!15043 thiss!1711) (currentByte!15048 thiss!1711) (size!9014 (buf!8156 thiss!1711))))))

(declare-fun bs!27987 () Bool)

(assert (= bs!27987 d!106260))

(declare-fun m!462039 () Bool)

(assert (=> bs!27987 m!462039))

(assert (=> start!72304 d!106260))

(declare-fun d!106262 () Bool)

(assert (=> d!106262 (= (array_inv!8566 (buf!8156 thiss!1711)) (bvsge (size!9014 (buf!8156 thiss!1711)) #b00000000000000000000000000000000))))

(assert (=> b!323980 d!106262))

(check-sat (not d!106260))
(check-sat)
(get-model)

(declare-fun d!106266 () Bool)

(assert (=> d!106266 (= (invariant!0 (currentBit!15043 thiss!1711) (currentByte!15048 thiss!1711) (size!9014 (buf!8156 thiss!1711))) (and (bvsge (currentBit!15043 thiss!1711) #b00000000000000000000000000000000) (bvslt (currentBit!15043 thiss!1711) #b00000000000000000000000000001000) (bvsge (currentByte!15048 thiss!1711) #b00000000000000000000000000000000) (or (bvslt (currentByte!15048 thiss!1711) (size!9014 (buf!8156 thiss!1711))) (and (= (currentBit!15043 thiss!1711) #b00000000000000000000000000000000) (= (currentByte!15048 thiss!1711) (size!9014 (buf!8156 thiss!1711)))))))))

(assert (=> d!106260 d!106266))

(check-sat)
