; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61066 () Bool)

(assert start!61066)

(declare-fun res!228808 () Bool)

(declare-fun e!195087 () Bool)

(assert (=> start!61066 (=> (not res!228808) (not e!195087))))

(declare-datatypes ((array!15679 0))(
  ( (array!15680 (arr!7778 (Array (_ BitVec 32) (_ BitVec 8))) (size!6791 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12396 0))(
  ( (BitStream!12397 (buf!7259 array!15679) (currentByte!13419 (_ BitVec 32)) (currentBit!13414 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12396)

(declare-fun bs2!19 () BitStream!12396)

(assert (=> start!61066 (= res!228808 (and (= (size!6791 (buf!7259 bs1!11)) (size!6791 (buf!7259 bs2!19))) (bvsle ((_ sign_extend 32) (size!6791 (buf!7259 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13419 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13414 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6791 (buf!7259 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13419 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13414 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!61066 e!195087))

(declare-fun e!195091 () Bool)

(declare-fun inv!12 (BitStream!12396) Bool)

(assert (=> start!61066 (and (inv!12 bs1!11) e!195091)))

(declare-fun e!195088 () Bool)

(assert (=> start!61066 (and (inv!12 bs2!19) e!195088)))

(declare-fun b!275143 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275143 (= e!195087 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13414 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13419 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (size!6791 (buf!7259 bs1!11)))))))))

(declare-fun b!275144 () Bool)

(declare-fun array_inv!6515 (array!15679) Bool)

(assert (=> b!275144 (= e!195091 (array_inv!6515 (buf!7259 bs1!11)))))

(declare-fun b!275145 () Bool)

(assert (=> b!275145 (= e!195088 (array_inv!6515 (buf!7259 bs2!19)))))

(assert (= (and start!61066 res!228808) b!275143))

(assert (= start!61066 b!275144))

(assert (= start!61066 b!275145))

(declare-fun m!407715 () Bool)

(assert (=> start!61066 m!407715))

(declare-fun m!407717 () Bool)

(assert (=> start!61066 m!407717))

(declare-fun m!407719 () Bool)

(assert (=> b!275143 m!407719))

(declare-fun m!407721 () Bool)

(assert (=> b!275144 m!407721))

(declare-fun m!407723 () Bool)

(assert (=> b!275145 m!407723))

(check-sat (not start!61066) (not b!275145) (not b!275143) (not b!275144))
(check-sat)
(get-model)

(declare-fun d!94602 () Bool)

(assert (=> d!94602 (= (inv!12 bs1!11) (invariant!0 (currentBit!13414 bs1!11) (currentByte!13419 bs1!11) (size!6791 (buf!7259 bs1!11))))))

(declare-fun bs!23827 () Bool)

(assert (= bs!23827 d!94602))

(declare-fun m!407735 () Bool)

(assert (=> bs!23827 m!407735))

(assert (=> start!61066 d!94602))

(declare-fun d!94604 () Bool)

(assert (=> d!94604 (= (inv!12 bs2!19) (invariant!0 (currentBit!13414 bs2!19) (currentByte!13419 bs2!19) (size!6791 (buf!7259 bs2!19))))))

(declare-fun bs!23828 () Bool)

(assert (= bs!23828 d!94604))

(declare-fun m!407737 () Bool)

(assert (=> bs!23828 m!407737))

(assert (=> start!61066 d!94604))

(declare-fun d!94606 () Bool)

(assert (=> d!94606 (= (array_inv!6515 (buf!7259 bs2!19)) (bvsge (size!6791 (buf!7259 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275145 d!94606))

(declare-fun d!94608 () Bool)

(assert (=> d!94608 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13414 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13419 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (size!6791 (buf!7259 bs1!11))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13414 bs1!11))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13414 bs1!11))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13419 bs1!11))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13419 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (size!6791 (buf!7259 bs1!11))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13414 bs1!11))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13419 bs1!11))) ((_ extract 31 0) ((_ sign_extend 32) (size!6791 (buf!7259 bs1!11)))))))))))

(assert (=> b!275143 d!94608))

(declare-fun d!94610 () Bool)

(assert (=> d!94610 (= (array_inv!6515 (buf!7259 bs1!11)) (bvsge (size!6791 (buf!7259 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275144 d!94610))

(check-sat (not d!94602) (not d!94604))
(check-sat)
