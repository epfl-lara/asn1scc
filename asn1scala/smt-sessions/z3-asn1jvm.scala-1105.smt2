; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31748 () Bool)

(assert start!31748)

(declare-fun res!132389 () Bool)

(declare-fun e!107780 () Bool)

(assert (=> start!31748 (=> (not res!132389) (not e!107780))))

(declare-datatypes ((array!7387 0))(
  ( (array!7388 (arr!4274 (Array (_ BitVec 32) (_ BitVec 8))) (size!3353 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5874 0))(
  ( (BitStream!5875 (buf!3811 array!7387) (currentByte!7000 (_ BitVec 32)) (currentBit!6995 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5874)

(declare-fun buf!77 () array!7387)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31748 (= res!132389 (and (= (size!3353 (buf!3811 b1!99)) (size!3353 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!3353 (buf!3811 b1!99))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7000 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!6995 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3353 (buf!3811 b1!99))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7000 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!6995 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31748 e!107780))

(declare-fun e!107781 () Bool)

(declare-fun inv!12 (BitStream!5874) Bool)

(assert (=> start!31748 (and (inv!12 b1!99) e!107781)))

(declare-fun array_inv!3100 (array!7387) Bool)

(assert (=> start!31748 (array_inv!3100 buf!77)))

(assert (=> start!31748 true))

(declare-fun b!158498 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158498 (= e!107780 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6995 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7000 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3353 (buf!3811 b1!99)))))))))

(declare-fun b!158499 () Bool)

(assert (=> b!158499 (= e!107781 (array_inv!3100 (buf!3811 b1!99)))))

(assert (= (and start!31748 res!132389) b!158498))

(assert (= start!31748 b!158499))

(declare-fun m!248983 () Bool)

(assert (=> start!31748 m!248983))

(declare-fun m!248985 () Bool)

(assert (=> start!31748 m!248985))

(declare-fun m!248987 () Bool)

(assert (=> b!158498 m!248987))

(declare-fun m!248989 () Bool)

(assert (=> b!158499 m!248989))

(check-sat (not b!158499) (not start!31748) (not b!158498))
(check-sat)
(get-model)

(declare-fun d!53151 () Bool)

(assert (=> d!53151 (= (array_inv!3100 (buf!3811 b1!99)) (bvsge (size!3353 (buf!3811 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158499 d!53151))

(declare-fun d!53153 () Bool)

(assert (=> d!53153 (= (inv!12 b1!99) (invariant!0 (currentBit!6995 b1!99) (currentByte!7000 b1!99) (size!3353 (buf!3811 b1!99))))))

(declare-fun bs!13106 () Bool)

(assert (= bs!13106 d!53153))

(declare-fun m!248999 () Bool)

(assert (=> bs!13106 m!248999))

(assert (=> start!31748 d!53153))

(declare-fun d!53157 () Bool)

(assert (=> d!53157 (= (array_inv!3100 buf!77) (bvsge (size!3353 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31748 d!53157))

(declare-fun d!53159 () Bool)

(assert (=> d!53159 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6995 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7000 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3353 (buf!3811 b1!99))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6995 b1!99))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6995 b1!99))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7000 b1!99))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7000 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3353 (buf!3811 b1!99))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!6995 b1!99))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7000 b1!99))) ((_ extract 31 0) ((_ sign_extend 32) (size!3353 (buf!3811 b1!99)))))))))))

(assert (=> b!158498 d!53159))

(check-sat (not d!53153))
(check-sat)
