; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71234 () Bool)

(assert start!71234)

(declare-datatypes ((array!20326 0))(
  ( (array!20327 (arr!9948 (Array (_ BitVec 32) (_ BitVec 8))) (size!8856 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13874 0))(
  ( (BitStream!13875 (buf!7998 array!20326) (currentByte!14763 (_ BitVec 32)) (currentBit!14758 (_ BitVec 32))) )
))
(declare-fun thiss!911 () BitStream!13874)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!71234 (not (invariant!0 (currentBit!14758 thiss!911) (currentByte!14763 thiss!911) (size!8856 (buf!7998 thiss!911))))))

(declare-fun e!231356 () Bool)

(declare-fun inv!12 (BitStream!13874) Bool)

(assert (=> start!71234 (and (inv!12 thiss!911) e!231356)))

(declare-fun b!321352 () Bool)

(declare-fun array_inv!8408 (array!20326) Bool)

(assert (=> b!321352 (= e!231356 (array_inv!8408 (buf!7998 thiss!911)))))

(assert (= start!71234 b!321352))

(declare-fun m!459639 () Bool)

(assert (=> start!71234 m!459639))

(declare-fun m!459641 () Bool)

(assert (=> start!71234 m!459641))

(declare-fun m!459643 () Bool)

(assert (=> b!321352 m!459643))

(push 1)

(assert (not b!321352))

(assert (not start!71234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105256 () Bool)

(assert (=> d!105256 (= (array_inv!8408 (buf!7998 thiss!911)) (bvsge (size!8856 (buf!7998 thiss!911)) #b00000000000000000000000000000000))))

(assert (=> b!321352 d!105256))

(declare-fun d!105260 () Bool)

(assert (=> d!105260 (= (invariant!0 (currentBit!14758 thiss!911) (currentByte!14763 thiss!911) (size!8856 (buf!7998 thiss!911))) (and (bvsge (currentBit!14758 thiss!911) #b00000000000000000000000000000000) (bvslt (currentBit!14758 thiss!911) #b00000000000000000000000000001000) (bvsge (currentByte!14763 thiss!911) #b00000000000000000000000000000000) (or (bvslt (currentByte!14763 thiss!911) (size!8856 (buf!7998 thiss!911))) (and (= (currentBit!14758 thiss!911) #b00000000000000000000000000000000) (= (currentByte!14763 thiss!911) (size!8856 (buf!7998 thiss!911)))))))))

(assert (=> start!71234 d!105260))

(declare-fun d!105266 () Bool)

(assert (=> d!105266 (= (inv!12 thiss!911) (invariant!0 (currentBit!14758 thiss!911) (currentByte!14763 thiss!911) (size!8856 (buf!7998 thiss!911))))))

(declare-fun bs!27678 () Bool)

(assert (= bs!27678 d!105266))

(assert (=> bs!27678 m!459639))

(assert (=> start!71234 d!105266))

(push 1)

(assert (not d!105266))

(check-sat)

(pop 1)

