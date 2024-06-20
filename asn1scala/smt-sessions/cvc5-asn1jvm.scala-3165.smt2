; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72724 () Bool)

(assert start!72724)

(declare-fun res!266245 () Bool)

(declare-fun e!233854 () Bool)

(assert (=> start!72724 (=> (not res!266245) (not e!233854))))

(declare-datatypes ((array!20843 0))(
  ( (array!20844 (arr!10153 (Array (_ BitVec 32) (_ BitVec 8))) (size!9061 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14284 0))(
  ( (BitStream!14285 (buf!8203 array!20843) (currentByte!15164 (_ BitVec 32)) (currentBit!15159 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14284)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72724 (= res!266245 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9061 (buf!8203 thiss!877))) ((_ sign_extend 32) (currentByte!15164 thiss!877)) ((_ sign_extend 32) (currentBit!15159 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72724 e!233854))

(declare-fun e!233856 () Bool)

(declare-fun inv!12 (BitStream!14284) Bool)

(assert (=> start!72724 (and (inv!12 thiss!877) e!233856)))

(declare-fun b!324407 () Bool)

(declare-fun res!266244 () Bool)

(assert (=> b!324407 (=> (not res!266244) (not e!233854))))

(assert (=> b!324407 (= res!266244 (bvslt (currentBit!15159 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324408 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324408 (= e!233854 (not (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15159 thiss!877)) (currentByte!15164 thiss!877) (size!9061 (buf!8203 thiss!877)))))))

(declare-fun b!324409 () Bool)

(declare-fun array_inv!8613 (array!20843) Bool)

(assert (=> b!324409 (= e!233856 (array_inv!8613 (buf!8203 thiss!877)))))

(assert (= (and start!72724 res!266245) b!324407))

(assert (= (and b!324407 res!266244) b!324408))

(assert (= start!72724 b!324409))

(declare-fun m!462529 () Bool)

(assert (=> start!72724 m!462529))

(declare-fun m!462531 () Bool)

(assert (=> start!72724 m!462531))

(declare-fun m!462533 () Bool)

(assert (=> b!324408 m!462533))

(declare-fun m!462535 () Bool)

(assert (=> b!324409 m!462535))

(push 1)

(assert (not start!72724))

(assert (not b!324409))

(assert (not b!324408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106646 () Bool)

(assert (=> d!106646 (= (remainingBits!0 ((_ sign_extend 32) (size!9061 (buf!8203 thiss!877))) ((_ sign_extend 32) (currentByte!15164 thiss!877)) ((_ sign_extend 32) (currentBit!15159 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9061 (buf!8203 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15164 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15159 thiss!877)))))))

(assert (=> start!72724 d!106646))

(declare-fun d!106650 () Bool)

(assert (=> d!106650 (= (inv!12 thiss!877) (invariant!0 (currentBit!15159 thiss!877) (currentByte!15164 thiss!877) (size!9061 (buf!8203 thiss!877))))))

(declare-fun bs!28094 () Bool)

(assert (= bs!28094 d!106650))

(declare-fun m!462553 () Bool)

(assert (=> bs!28094 m!462553))

(assert (=> start!72724 d!106650))

(declare-fun d!106656 () Bool)

(assert (=> d!106656 (= (array_inv!8613 (buf!8203 thiss!877)) (bvsge (size!9061 (buf!8203 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324409 d!106656))

(declare-fun d!106658 () Bool)

(assert (=> d!106658 (= (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15159 thiss!877)) (currentByte!15164 thiss!877) (size!9061 (buf!8203 thiss!877))) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentBit!15159 thiss!877)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentBit!15159 thiss!877)) #b00000000000000000000000000001000) (bvsge (currentByte!15164 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15164 thiss!877) (size!9061 (buf!8203 thiss!877))) (and (= (bvadd #b00000000000000000000000000000001 (currentBit!15159 thiss!877)) #b00000000000000000000000000000000) (= (currentByte!15164 thiss!877) (size!9061 (buf!8203 thiss!877)))))))))

(assert (=> b!324408 d!106658))

(push 1)

(assert (not d!106650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106666 () Bool)

(assert (=> d!106666 (= (invariant!0 (currentBit!15159 thiss!877) (currentByte!15164 thiss!877) (size!9061 (buf!8203 thiss!877))) (and (bvsge (currentBit!15159 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15159 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15164 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15164 thiss!877) (size!9061 (buf!8203 thiss!877))) (and (= (currentBit!15159 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15164 thiss!877) (size!9061 (buf!8203 thiss!877)))))))))

(assert (=> d!106650 d!106666))

(push 1)

(check-sat)

