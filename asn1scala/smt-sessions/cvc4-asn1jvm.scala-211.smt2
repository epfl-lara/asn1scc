; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4202 () Bool)

(assert start!4202)

(declare-fun res!15458 () Bool)

(declare-fun e!11248 () Bool)

(assert (=> start!4202 (=> (not res!15458) (not e!11248))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4202 (= res!15458 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4202 e!11248))

(assert (=> start!4202 true))

(declare-datatypes ((array!1155 0))(
  ( (array!1156 (arr!921 (Array (_ BitVec 32) (_ BitVec 8))) (size!492 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!854 0))(
  ( (BitStream!855 (buf!810 array!1155) (currentByte!2004 (_ BitVec 32)) (currentBit!1999 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!854)

(declare-fun e!11249 () Bool)

(declare-fun inv!12 (BitStream!854) Bool)

(assert (=> start!4202 (and (inv!12 thiss!1917) e!11249)))

(declare-fun b!17514 () Bool)

(declare-fun res!15457 () Bool)

(assert (=> b!17514 (=> (not res!15457) (not e!11248))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17514 (= res!15457 (validate_offset_bits!1 ((_ sign_extend 32) (size!492 (buf!810 thiss!1917))) ((_ sign_extend 32) (currentByte!2004 thiss!1917)) ((_ sign_extend 32) (currentBit!1999 thiss!1917)) nBits!604))))

(declare-fun b!17515 () Bool)

(assert (=> b!17515 (= e!11248 (bvsgt nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun b!17516 () Bool)

(declare-fun array_inv!462 (array!1155) Bool)

(assert (=> b!17516 (= e!11249 (array_inv!462 (buf!810 thiss!1917)))))

(assert (= (and start!4202 res!15458) b!17514))

(assert (= (and b!17514 res!15457) b!17515))

(assert (= start!4202 b!17516))

(declare-fun m!23821 () Bool)

(assert (=> start!4202 m!23821))

(declare-fun m!23823 () Bool)

(assert (=> b!17514 m!23823))

(declare-fun m!23825 () Bool)

(assert (=> b!17516 m!23825))

(push 1)

(assert (not start!4202))

(assert (not b!17514))

(assert (not b!17516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5728 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5728 (= (inv!12 thiss!1917) (invariant!0 (currentBit!1999 thiss!1917) (currentByte!2004 thiss!1917) (size!492 (buf!810 thiss!1917))))))

(declare-fun bs!1638 () Bool)

(assert (= bs!1638 d!5728))

(declare-fun m!23827 () Bool)

(assert (=> bs!1638 m!23827))

(assert (=> start!4202 d!5728))

(declare-fun d!5732 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5732 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!492 (buf!810 thiss!1917))) ((_ sign_extend 32) (currentByte!2004 thiss!1917)) ((_ sign_extend 32) (currentBit!1999 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!492 (buf!810 thiss!1917))) ((_ sign_extend 32) (currentByte!2004 thiss!1917)) ((_ sign_extend 32) (currentBit!1999 thiss!1917))) nBits!604))))

(declare-fun bs!1640 () Bool)

(assert (= bs!1640 d!5732))

(declare-fun m!23831 () Bool)

(assert (=> bs!1640 m!23831))

(assert (=> b!17514 d!5732))

(declare-fun d!5736 () Bool)

(assert (=> d!5736 (= (array_inv!462 (buf!810 thiss!1917)) (bvsge (size!492 (buf!810 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17516 d!5736))

(push 1)

(assert (not d!5732))

(assert (not d!5728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5746 () Bool)

(assert (=> d!5746 (= (remainingBits!0 ((_ sign_extend 32) (size!492 (buf!810 thiss!1917))) ((_ sign_extend 32) (currentByte!2004 thiss!1917)) ((_ sign_extend 32) (currentBit!1999 thiss!1917))) (bvsub (bvmul ((_ sign_extend 32) (size!492 (buf!810 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2004 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1999 thiss!1917)))))))

(assert (=> d!5732 d!5746))

(declare-fun d!5750 () Bool)

(assert (=> d!5750 (= (invariant!0 (currentBit!1999 thiss!1917) (currentByte!2004 thiss!1917) (size!492 (buf!810 thiss!1917))) (and (bvsge (currentBit!1999 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!1999 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2004 thiss!1917) #b00000000000000000000000000000000) (or (bvslt (currentByte!2004 thiss!1917) (size!492 (buf!810 thiss!1917))) (and (= (currentBit!1999 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2004 thiss!1917) (size!492 (buf!810 thiss!1917)))))))))

(assert (=> d!5728 d!5750))

(push 1)

(check-sat)

(pop 1)

