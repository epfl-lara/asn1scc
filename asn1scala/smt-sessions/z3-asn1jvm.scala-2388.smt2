; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60978 () Bool)

(assert start!60978)

(declare-fun res!228745 () Bool)

(declare-fun e!194870 () Bool)

(assert (=> start!60978 (=> (not res!228745) (not e!194870))))

(declare-datatypes ((array!15629 0))(
  ( (array!15630 (arr!7757 (Array (_ BitVec 32) (_ BitVec 8))) (size!6770 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12354 0))(
  ( (BitStream!12355 (buf!7238 array!15629) (currentByte!13391 (_ BitVec 32)) (currentBit!13386 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12354)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!60978 (= res!228745 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6770 (buf!7238 b!177)))) diffInBits!14) (bvsle diffInBits!14 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6770 (buf!7238 b!177)))))))))

(assert (=> start!60978 e!194870))

(declare-fun e!194871 () Bool)

(declare-fun inv!12 (BitStream!12354) Bool)

(assert (=> start!60978 (and (inv!12 b!177) e!194871)))

(assert (=> start!60978 true))

(declare-fun b!274994 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!274994 (= e!194870 (not (invariant!0 (currentBit!13386 b!177) (currentByte!13391 b!177) (size!6770 (buf!7238 b!177)))))))

(declare-fun b!274995 () Bool)

(declare-fun array_inv!6494 (array!15629) Bool)

(assert (=> b!274995 (= e!194871 (array_inv!6494 (buf!7238 b!177)))))

(assert (= (and start!60978 res!228745) b!274994))

(assert (= start!60978 b!274995))

(declare-fun m!407561 () Bool)

(assert (=> start!60978 m!407561))

(declare-fun m!407563 () Bool)

(assert (=> b!274994 m!407563))

(declare-fun m!407565 () Bool)

(assert (=> b!274995 m!407565))

(check-sat (not start!60978) (not b!274995) (not b!274994))
(check-sat)
(get-model)

(declare-fun d!94530 () Bool)

(assert (=> d!94530 (= (inv!12 b!177) (invariant!0 (currentBit!13386 b!177) (currentByte!13391 b!177) (size!6770 (buf!7238 b!177))))))

(declare-fun bs!23795 () Bool)

(assert (= bs!23795 d!94530))

(assert (=> bs!23795 m!407563))

(assert (=> start!60978 d!94530))

(declare-fun d!94534 () Bool)

(assert (=> d!94534 (= (array_inv!6494 (buf!7238 b!177)) (bvsge (size!6770 (buf!7238 b!177)) #b00000000000000000000000000000000))))

(assert (=> b!274995 d!94534))

(declare-fun d!94536 () Bool)

(assert (=> d!94536 (= (invariant!0 (currentBit!13386 b!177) (currentByte!13391 b!177) (size!6770 (buf!7238 b!177))) (and (bvsge (currentBit!13386 b!177) #b00000000000000000000000000000000) (bvslt (currentBit!13386 b!177) #b00000000000000000000000000001000) (bvsge (currentByte!13391 b!177) #b00000000000000000000000000000000) (or (bvslt (currentByte!13391 b!177) (size!6770 (buf!7238 b!177))) (and (= (currentBit!13386 b!177) #b00000000000000000000000000000000) (= (currentByte!13391 b!177) (size!6770 (buf!7238 b!177)))))))))

(assert (=> b!274994 d!94536))

(check-sat (not d!94530))
