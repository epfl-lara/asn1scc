; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4198 () Bool)

(assert start!4198)

(declare-fun res!15446 () Bool)

(declare-fun e!11232 () Bool)

(assert (=> start!4198 (=> (not res!15446) (not e!11232))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4198 (= res!15446 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4198 e!11232))

(assert (=> start!4198 true))

(declare-datatypes ((array!1151 0))(
  ( (array!1152 (arr!919 (Array (_ BitVec 32) (_ BitVec 8))) (size!490 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!850 0))(
  ( (BitStream!851 (buf!808 array!1151) (currentByte!2002 (_ BitVec 32)) (currentBit!1997 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!850)

(declare-fun e!11231 () Bool)

(declare-fun inv!12 (BitStream!850) Bool)

(assert (=> start!4198 (and (inv!12 thiss!1917) e!11231)))

(declare-fun b!17496 () Bool)

(declare-fun res!15445 () Bool)

(assert (=> b!17496 (=> (not res!15445) (not e!11232))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17496 (= res!15445 (validate_offset_bits!1 ((_ sign_extend 32) (size!490 (buf!808 thiss!1917))) ((_ sign_extend 32) (currentByte!2002 thiss!1917)) ((_ sign_extend 32) (currentBit!1997 thiss!1917)) nBits!604))))

(declare-fun b!17497 () Bool)

(assert (=> b!17497 (= e!11232 (bvsgt nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun b!17498 () Bool)

(declare-fun array_inv!460 (array!1151) Bool)

(assert (=> b!17498 (= e!11231 (array_inv!460 (buf!808 thiss!1917)))))

(assert (= (and start!4198 res!15446) b!17496))

(assert (= (and b!17496 res!15445) b!17497))

(assert (= start!4198 b!17498))

(declare-fun m!23809 () Bool)

(assert (=> start!4198 m!23809))

(declare-fun m!23811 () Bool)

(assert (=> b!17496 m!23811))

(declare-fun m!23813 () Bool)

(assert (=> b!17498 m!23813))

(push 1)

(assert (not b!17498))

(assert (not start!4198))

(assert (not b!17496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5726 () Bool)

(assert (=> d!5726 (= (array_inv!460 (buf!808 thiss!1917)) (bvsge (size!490 (buf!808 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17498 d!5726))

(declare-fun d!5730 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5730 (= (inv!12 thiss!1917) (invariant!0 (currentBit!1997 thiss!1917) (currentByte!2002 thiss!1917) (size!490 (buf!808 thiss!1917))))))

(declare-fun bs!1639 () Bool)

(assert (= bs!1639 d!5730))

(declare-fun m!23829 () Bool)

(assert (=> bs!1639 m!23829))

(assert (=> start!4198 d!5730))

(declare-fun d!5734 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!490 (buf!808 thiss!1917))) ((_ sign_extend 32) (currentByte!2002 thiss!1917)) ((_ sign_extend 32) (currentBit!1997 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!490 (buf!808 thiss!1917))) ((_ sign_extend 32) (currentByte!2002 thiss!1917)) ((_ sign_extend 32) (currentBit!1997 thiss!1917))) nBits!604))))

(declare-fun bs!1641 () Bool)

(assert (= bs!1641 d!5734))

(declare-fun m!23833 () Bool)

(assert (=> bs!1641 m!23833))

(assert (=> b!17496 d!5734))

(push 1)

(assert (not d!5734))

(assert (not d!5730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5744 () Bool)

(assert (=> d!5744 (= (remainingBits!0 ((_ sign_extend 32) (size!490 (buf!808 thiss!1917))) ((_ sign_extend 32) (currentByte!2002 thiss!1917)) ((_ sign_extend 32) (currentBit!1997 thiss!1917))) (bvsub (bvmul ((_ sign_extend 32) (size!490 (buf!808 thiss!1917))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2002 thiss!1917)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1997 thiss!1917)))))))

(assert (=> d!5734 d!5744))

(declare-fun d!5748 () Bool)

(assert (=> d!5748 (= (invariant!0 (currentBit!1997 thiss!1917) (currentByte!2002 thiss!1917) (size!490 (buf!808 thiss!1917))) (and (bvsge (currentBit!1997 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!1997 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2002 thiss!1917) #b00000000000000000000000000000000) (or (bvslt (currentByte!2002 thiss!1917) (size!490 (buf!808 thiss!1917))) (and (= (currentBit!1997 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2002 thiss!1917) (size!490 (buf!808 thiss!1917)))))))))

(assert (=> d!5730 d!5748))

(push 1)

(check-sat)

