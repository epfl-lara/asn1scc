; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71230 () Bool)

(assert start!71230)

(declare-datatypes ((array!20322 0))(
  ( (array!20323 (arr!9946 (Array (_ BitVec 32) (_ BitVec 8))) (size!8854 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13870 0))(
  ( (BitStream!13871 (buf!7996 array!20322) (currentByte!14761 (_ BitVec 32)) (currentBit!14756 (_ BitVec 32))) )
))
(declare-fun thiss!911 () BitStream!13870)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!71230 (not (invariant!0 (currentBit!14756 thiss!911) (currentByte!14761 thiss!911) (size!8854 (buf!7996 thiss!911))))))

(declare-fun e!231344 () Bool)

(declare-fun inv!12 (BitStream!13870) Bool)

(assert (=> start!71230 (and (inv!12 thiss!911) e!231344)))

(declare-fun b!321346 () Bool)

(declare-fun array_inv!8406 (array!20322) Bool)

(assert (=> b!321346 (= e!231344 (array_inv!8406 (buf!7996 thiss!911)))))

(assert (= start!71230 b!321346))

(declare-fun m!459627 () Bool)

(assert (=> start!71230 m!459627))

(declare-fun m!459629 () Bool)

(assert (=> start!71230 m!459629))

(declare-fun m!459631 () Bool)

(assert (=> b!321346 m!459631))

(push 1)

(assert (not b!321346))

(assert (not start!71230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105254 () Bool)

(assert (=> d!105254 (= (array_inv!8406 (buf!7996 thiss!911)) (bvsge (size!8854 (buf!7996 thiss!911)) #b00000000000000000000000000000000))))

(assert (=> b!321346 d!105254))

(declare-fun d!105262 () Bool)

(assert (=> d!105262 (= (invariant!0 (currentBit!14756 thiss!911) (currentByte!14761 thiss!911) (size!8854 (buf!7996 thiss!911))) (and (bvsge (currentBit!14756 thiss!911) #b00000000000000000000000000000000) (bvslt (currentBit!14756 thiss!911) #b00000000000000000000000000001000) (bvsge (currentByte!14761 thiss!911) #b00000000000000000000000000000000) (or (bvslt (currentByte!14761 thiss!911) (size!8854 (buf!7996 thiss!911))) (and (= (currentBit!14756 thiss!911) #b00000000000000000000000000000000) (= (currentByte!14761 thiss!911) (size!8854 (buf!7996 thiss!911)))))))))

(assert (=> start!71230 d!105262))

(declare-fun d!105268 () Bool)

(assert (=> d!105268 (= (inv!12 thiss!911) (invariant!0 (currentBit!14756 thiss!911) (currentByte!14761 thiss!911) (size!8854 (buf!7996 thiss!911))))))

(declare-fun bs!27679 () Bool)

(assert (= bs!27679 d!105268))

(assert (=> bs!27679 m!459627))

(assert (=> start!71230 d!105268))

(push 1)

