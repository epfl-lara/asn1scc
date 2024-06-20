; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72324 () Bool)

(assert start!72324)

(declare-fun res!265963 () Bool)

(declare-fun e!233407 () Bool)

(assert (=> start!72324 (=> (not res!265963) (not e!233407))))

(declare-datatypes ((array!20718 0))(
  ( (array!20719 (arr!10109 (Array (_ BitVec 32) (_ BitVec 8))) (size!9017 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14196 0))(
  ( (BitStream!14197 (buf!8159 array!20718) (currentByte!15052 (_ BitVec 32)) (currentBit!15047 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14196)

(assert (=> start!72324 (= res!265963 (and (bvsle ((_ sign_extend 32) (size!9017 (buf!8159 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15052 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15047 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9017 (buf!8159 thiss!1711))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15052 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15047 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72324 e!233407))

(declare-fun e!233408 () Bool)

(declare-fun inv!12 (BitStream!14196) Bool)

(assert (=> start!72324 (and (inv!12 thiss!1711) e!233408)))

(declare-fun b!323994 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!323994 (= e!233407 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15047 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15052 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (size!9017 (buf!8159 thiss!1711)))))))))

(declare-fun b!323995 () Bool)

(declare-fun array_inv!8569 (array!20718) Bool)

(assert (=> b!323995 (= e!233408 (array_inv!8569 (buf!8159 thiss!1711)))))

(assert (= (and start!72324 res!265963) b!323994))

(assert (= start!72324 b!323995))

(declare-fun m!462051 () Bool)

(assert (=> start!72324 m!462051))

(declare-fun m!462053 () Bool)

(assert (=> b!323994 m!462053))

(declare-fun m!462055 () Bool)

(assert (=> b!323995 m!462055))

(check-sat (not b!323995) (not start!72324) (not b!323994))
(check-sat)
(get-model)

(declare-fun d!106276 () Bool)

(assert (=> d!106276 (= (array_inv!8569 (buf!8159 thiss!1711)) (bvsge (size!9017 (buf!8159 thiss!1711)) #b00000000000000000000000000000000))))

(assert (=> b!323995 d!106276))

(declare-fun d!106278 () Bool)

(assert (=> d!106278 (= (inv!12 thiss!1711) (invariant!0 (currentBit!15047 thiss!1711) (currentByte!15052 thiss!1711) (size!9017 (buf!8159 thiss!1711))))))

(declare-fun bs!27993 () Bool)

(assert (= bs!27993 d!106278))

(declare-fun m!462063 () Bool)

(assert (=> bs!27993 m!462063))

(assert (=> start!72324 d!106278))

(declare-fun d!106280 () Bool)

(assert (=> d!106280 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15047 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15052 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (size!9017 (buf!8159 thiss!1711))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15047 thiss!1711))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15047 thiss!1711))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15052 thiss!1711))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15052 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (size!9017 (buf!8159 thiss!1711))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15047 thiss!1711))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15052 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (size!9017 (buf!8159 thiss!1711)))))))))))

(assert (=> b!323994 d!106280))

(check-sat (not d!106278))
(check-sat)
