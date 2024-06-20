; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3984 () Bool)

(assert start!3984)

(declare-fun b!17099 () Bool)

(declare-fun e!10829 () Bool)

(declare-datatypes ((array!1013 0))(
  ( (array!1014 (arr!859 (Array (_ BitVec 32) (_ BitVec 8))) (size!430 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!820 0))(
  ( (BitStream!821 (buf!793 array!1013) (currentByte!1972 (_ BitVec 32)) (currentBit!1967 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!820)

(declare-fun array_inv!419 (array!1013) Bool)

(assert (=> b!17099 (= e!10829 (array_inv!419 (buf!793 b!162)))))

(declare-fun res!15375 () Bool)

(declare-fun e!10830 () Bool)

(assert (=> start!3984 (=> (not res!15375) (not e!10830))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!3984 (= res!15375 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3984 e!10830))

(assert (=> start!3984 true))

(declare-fun inv!12 (BitStream!820) Bool)

(assert (=> start!3984 (and (inv!12 b!162) e!10829)))

(declare-fun b!17098 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17098 (= e!10830 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1967 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1972 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!430 (buf!793 b!162)))))))))

(declare-fun b!17097 () Bool)

(declare-fun res!15377 () Bool)

(assert (=> b!17097 (=> (not res!15377) (not e!10830))))

(assert (=> b!17097 (= res!15377 (and (bvsle ((_ sign_extend 32) (size!430 (buf!793 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1972 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1967 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!430 (buf!793 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1972 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1967 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!17096 () Bool)

(declare-fun res!15376 () Bool)

(assert (=> b!17096 (=> (not res!15376) (not e!10830))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17096 (= res!15376 (validate_offset_bits!1 ((_ sign_extend 32) (size!430 (buf!793 b!162))) ((_ sign_extend 32) (currentByte!1972 b!162)) ((_ sign_extend 32) (currentBit!1967 b!162)) origOffset!1))))

(assert (= (and start!3984 res!15375) b!17096))

(assert (= (and b!17096 res!15376) b!17097))

(assert (= (and b!17097 res!15377) b!17098))

(assert (= start!3984 b!17099))

(declare-fun m!23277 () Bool)

(assert (=> b!17099 m!23277))

(declare-fun m!23279 () Bool)

(assert (=> start!3984 m!23279))

(declare-fun m!23281 () Bool)

(assert (=> b!17098 m!23281))

(declare-fun m!23283 () Bool)

(assert (=> b!17096 m!23283))

(push 1)

(assert (not b!17096))

(assert (not start!3984))

(assert (not b!17099))

(assert (not b!17098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5574 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5574 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!430 (buf!793 b!162))) ((_ sign_extend 32) (currentByte!1972 b!162)) ((_ sign_extend 32) (currentBit!1967 b!162)) origOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!430 (buf!793 b!162))) ((_ sign_extend 32) (currentByte!1972 b!162)) ((_ sign_extend 32) (currentBit!1967 b!162))) origOffset!1))))

(declare-fun bs!1558 () Bool)

(assert (= bs!1558 d!5574))

(declare-fun m!23301 () Bool)

(assert (=> bs!1558 m!23301))

(assert (=> b!17096 d!5574))

(declare-fun d!5576 () Bool)

(assert (=> d!5576 (= (inv!12 b!162) (invariant!0 (currentBit!1967 b!162) (currentByte!1972 b!162) (size!430 (buf!793 b!162))))))

(declare-fun bs!1559 () Bool)

(assert (= bs!1559 d!5576))

(declare-fun m!23303 () Bool)

(assert (=> bs!1559 m!23303))

(assert (=> start!3984 d!5576))

(declare-fun d!5582 () Bool)

(assert (=> d!5582 (= (array_inv!419 (buf!793 b!162)) (bvsge (size!430 (buf!793 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!17099 d!5582))

(declare-fun d!5586 () Bool)

(assert (=> d!5586 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1967 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1972 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!430 (buf!793 b!162))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1967 b!162))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1967 b!162))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1972 b!162))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1972 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!430 (buf!793 b!162))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1967 b!162))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1972 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!430 (buf!793 b!162)))))))))))

(assert (=> b!17098 d!5586))

(push 1)

(assert (not d!5574))

(assert (not d!5576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

