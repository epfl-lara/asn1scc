; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3988 () Bool)

(assert start!3988)

(declare-fun b!17120 () Bool)

(declare-fun res!15393 () Bool)

(declare-fun e!10846 () Bool)

(assert (=> b!17120 (=> (not res!15393) (not e!10846))))

(declare-datatypes ((array!1017 0))(
  ( (array!1018 (arr!861 (Array (_ BitVec 32) (_ BitVec 8))) (size!432 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!824 0))(
  ( (BitStream!825 (buf!795 array!1017) (currentByte!1974 (_ BitVec 32)) (currentBit!1969 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!824)

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17120 (= res!15393 (validate_offset_bits!1 ((_ sign_extend 32) (size!432 (buf!795 b!162))) ((_ sign_extend 32) (currentByte!1974 b!162)) ((_ sign_extend 32) (currentBit!1969 b!162)) origOffset!1))))

(declare-fun b!17121 () Bool)

(declare-fun res!15395 () Bool)

(assert (=> b!17121 (=> (not res!15395) (not e!10846))))

(assert (=> b!17121 (= res!15395 (and (bvsle ((_ sign_extend 32) (size!432 (buf!795 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1974 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1969 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!432 (buf!795 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1974 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1969 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!17123 () Bool)

(declare-fun e!10847 () Bool)

(declare-fun array_inv!421 (array!1017) Bool)

(assert (=> b!17123 (= e!10847 (array_inv!421 (buf!795 b!162)))))

(declare-fun b!17122 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17122 (= e!10846 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1969 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1974 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!432 (buf!795 b!162)))))))))

(declare-fun res!15394 () Bool)

(assert (=> start!3988 (=> (not res!15394) (not e!10846))))

(declare-fun newOffset!1 () (_ BitVec 64))

(assert (=> start!3988 (= res!15394 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3988 e!10846))

(assert (=> start!3988 true))

(declare-fun inv!12 (BitStream!824) Bool)

(assert (=> start!3988 (and (inv!12 b!162) e!10847)))

(assert (= (and start!3988 res!15394) b!17120))

(assert (= (and b!17120 res!15393) b!17121))

(assert (= (and b!17121 res!15395) b!17122))

(assert (= start!3988 b!17123))

(declare-fun m!23293 () Bool)

(assert (=> b!17120 m!23293))

(declare-fun m!23295 () Bool)

(assert (=> b!17123 m!23295))

(declare-fun m!23297 () Bool)

(assert (=> b!17122 m!23297))

(declare-fun m!23299 () Bool)

(assert (=> start!3988 m!23299))

(push 1)

(assert (not b!17120))

(assert (not start!3988))

(assert (not b!17123))

(assert (not b!17122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5578 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!432 (buf!795 b!162))) ((_ sign_extend 32) (currentByte!1974 b!162)) ((_ sign_extend 32) (currentBit!1969 b!162)) origOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!432 (buf!795 b!162))) ((_ sign_extend 32) (currentByte!1974 b!162)) ((_ sign_extend 32) (currentBit!1969 b!162))) origOffset!1))))

(declare-fun bs!1560 () Bool)

(assert (= bs!1560 d!5578))

(declare-fun m!23305 () Bool)

(assert (=> bs!1560 m!23305))

(assert (=> b!17120 d!5578))

(declare-fun d!5584 () Bool)

(assert (=> d!5584 (= (inv!12 b!162) (invariant!0 (currentBit!1969 b!162) (currentByte!1974 b!162) (size!432 (buf!795 b!162))))))

(declare-fun bs!1561 () Bool)

(assert (= bs!1561 d!5584))

(declare-fun m!23307 () Bool)

(assert (=> bs!1561 m!23307))

(assert (=> start!3988 d!5584))

(declare-fun d!5588 () Bool)

(assert (=> d!5588 (= (array_inv!421 (buf!795 b!162)) (bvsge (size!432 (buf!795 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!17123 d!5588))

(declare-fun d!5590 () Bool)

(assert (=> d!5590 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1969 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1974 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!432 (buf!795 b!162))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1969 b!162))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1969 b!162))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1974 b!162))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1974 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!432 (buf!795 b!162))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1969 b!162))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1974 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!432 (buf!795 b!162)))))))))))

