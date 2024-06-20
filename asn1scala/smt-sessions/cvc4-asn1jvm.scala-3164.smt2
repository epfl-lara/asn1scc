; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72698 () Bool)

(assert start!72698)

(declare-fun res!266239 () Bool)

(declare-fun e!233845 () Bool)

(assert (=> start!72698 (=> (not res!266239) (not e!233845))))

(declare-datatypes ((array!20838 0))(
  ( (array!20839 (arr!10152 (Array (_ BitVec 32) (_ BitVec 8))) (size!9060 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14282 0))(
  ( (BitStream!14283 (buf!8202 array!20838) (currentByte!15157 (_ BitVec 32)) (currentBit!15152 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14282)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72698 (= res!266239 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9060 (buf!8202 thiss!877))) ((_ sign_extend 32) (currentByte!15157 thiss!877)) ((_ sign_extend 32) (currentBit!15152 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72698 e!233845))

(declare-fun e!233847 () Bool)

(declare-fun inv!12 (BitStream!14282) Bool)

(assert (=> start!72698 (and (inv!12 thiss!877) e!233847)))

(declare-fun b!324398 () Bool)

(declare-fun res!266238 () Bool)

(assert (=> b!324398 (=> (not res!266238) (not e!233845))))

(assert (=> b!324398 (= res!266238 (bvslt (currentBit!15152 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324399 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324399 (= e!233845 (not (invariant!0 (currentBit!15152 thiss!877) (currentByte!15157 thiss!877) (size!9060 (buf!8202 thiss!877)))))))

(declare-fun b!324400 () Bool)

(declare-fun array_inv!8612 (array!20838) Bool)

(assert (=> b!324400 (= e!233847 (array_inv!8612 (buf!8202 thiss!877)))))

(assert (= (and start!72698 res!266239) b!324398))

(assert (= (and b!324398 res!266238) b!324399))

(assert (= start!72698 b!324400))

(declare-fun m!462521 () Bool)

(assert (=> start!72698 m!462521))

(declare-fun m!462523 () Bool)

(assert (=> start!72698 m!462523))

(declare-fun m!462525 () Bool)

(assert (=> b!324399 m!462525))

(declare-fun m!462527 () Bool)

(assert (=> b!324400 m!462527))

(push 1)

(assert (not b!324399))

(assert (not start!72698))

(assert (not b!324400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106624 () Bool)

(assert (=> d!106624 (= (invariant!0 (currentBit!15152 thiss!877) (currentByte!15157 thiss!877) (size!9060 (buf!8202 thiss!877))) (and (bvsge (currentBit!15152 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15152 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15157 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15157 thiss!877) (size!9060 (buf!8202 thiss!877))) (and (= (currentBit!15152 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15157 thiss!877) (size!9060 (buf!8202 thiss!877)))))))))

(assert (=> b!324399 d!106624))

(declare-fun d!106630 () Bool)

(assert (=> d!106630 (= (remainingBits!0 ((_ sign_extend 32) (size!9060 (buf!8202 thiss!877))) ((_ sign_extend 32) (currentByte!15157 thiss!877)) ((_ sign_extend 32) (currentBit!15152 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9060 (buf!8202 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15157 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15152 thiss!877)))))))

