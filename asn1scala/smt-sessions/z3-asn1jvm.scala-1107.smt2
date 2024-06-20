; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31778 () Bool)

(assert start!31778)

(declare-fun res!132421 () Bool)

(declare-fun e!107853 () Bool)

(assert (=> start!31778 (=> (not res!132421) (not e!107853))))

(declare-datatypes ((array!7402 0))(
  ( (array!7403 (arr!4280 (Array (_ BitVec 32) (_ BitVec 8))) (size!3359 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5886 0))(
  ( (BitStream!5887 (buf!3817 array!7402) (currentByte!7009 (_ BitVec 32)) (currentBit!7004 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5886)

(declare-fun buf!77 () array!7402)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31778 (= res!132421 (and (= (size!3359 (buf!3817 b1!99)) (size!3359 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31778 e!107853))

(declare-fun e!107850 () Bool)

(declare-fun inv!12 (BitStream!5886) Bool)

(assert (=> start!31778 (and (inv!12 b1!99) e!107850)))

(declare-fun array_inv!3106 (array!7402) Bool)

(assert (=> start!31778 (array_inv!3106 buf!77)))

(assert (=> start!31778 true))

(declare-fun b!158548 () Bool)

(declare-fun res!132422 () Bool)

(assert (=> b!158548 (=> (not res!132422) (not e!107853))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158548 (= res!132422 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3359 (buf!3817 b1!99))) ((_ sign_extend 32) (currentByte!7009 b1!99)) ((_ sign_extend 32) (currentBit!7004 b1!99)) bytes!14))))

(declare-fun b!158549 () Bool)

(assert (=> b!158549 (= e!107853 (and (bvsle ((_ sign_extend 32) (size!3359 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7009 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7004 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3359 buf!77)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!7009 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!7004 b1!99)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!158550 () Bool)

(assert (=> b!158550 (= e!107850 (array_inv!3106 (buf!3817 b1!99)))))

(assert (= (and start!31778 res!132421) b!158548))

(assert (= (and b!158548 res!132422) b!158549))

(assert (= start!31778 b!158550))

(declare-fun m!249037 () Bool)

(assert (=> start!31778 m!249037))

(declare-fun m!249039 () Bool)

(assert (=> start!31778 m!249039))

(declare-fun m!249041 () Bool)

(assert (=> b!158548 m!249041))

(declare-fun m!249043 () Bool)

(assert (=> b!158550 m!249043))

(check-sat (not b!158550) (not start!31778) (not b!158548))
(check-sat)
(get-model)

(declare-fun d!53179 () Bool)

(assert (=> d!53179 (= (array_inv!3106 (buf!3817 b1!99)) (bvsge (size!3359 (buf!3817 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158550 d!53179))

(declare-fun d!53181 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53181 (= (inv!12 b1!99) (invariant!0 (currentBit!7004 b1!99) (currentByte!7009 b1!99) (size!3359 (buf!3817 b1!99))))))

(declare-fun bs!13115 () Bool)

(assert (= bs!13115 d!53181))

(declare-fun m!249053 () Bool)

(assert (=> bs!13115 m!249053))

(assert (=> start!31778 d!53181))

(declare-fun d!53183 () Bool)

(assert (=> d!53183 (= (array_inv!3106 buf!77) (bvsge (size!3359 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31778 d!53183))

(declare-fun d!53185 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53185 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3359 (buf!3817 b1!99))) ((_ sign_extend 32) (currentByte!7009 b1!99)) ((_ sign_extend 32) (currentBit!7004 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3359 (buf!3817 b1!99))) ((_ sign_extend 32) (currentByte!7009 b1!99)) ((_ sign_extend 32) (currentBit!7004 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13116 () Bool)

(assert (= bs!13116 d!53185))

(declare-fun m!249055 () Bool)

(assert (=> bs!13116 m!249055))

(assert (=> b!158548 d!53185))

(check-sat (not d!53181) (not d!53185))
(check-sat)
(get-model)

(declare-fun d!53195 () Bool)

(assert (=> d!53195 (= (invariant!0 (currentBit!7004 b1!99) (currentByte!7009 b1!99) (size!3359 (buf!3817 b1!99))) (and (bvsge (currentBit!7004 b1!99) #b00000000000000000000000000000000) (bvslt (currentBit!7004 b1!99) #b00000000000000000000000000001000) (bvsge (currentByte!7009 b1!99) #b00000000000000000000000000000000) (or (bvslt (currentByte!7009 b1!99) (size!3359 (buf!3817 b1!99))) (and (= (currentBit!7004 b1!99) #b00000000000000000000000000000000) (= (currentByte!7009 b1!99) (size!3359 (buf!3817 b1!99)))))))))

(assert (=> d!53181 d!53195))

(declare-fun d!53199 () Bool)

(assert (=> d!53199 (= (remainingBits!0 ((_ sign_extend 32) (size!3359 (buf!3817 b1!99))) ((_ sign_extend 32) (currentByte!7009 b1!99)) ((_ sign_extend 32) (currentBit!7004 b1!99))) (bvsub (bvmul ((_ sign_extend 32) (size!3359 (buf!3817 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7009 b1!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7004 b1!99)))))))

(assert (=> d!53185 d!53199))

(check-sat)
