; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4014 () Bool)

(assert start!4014)

(declare-fun res!15401 () Bool)

(declare-fun e!10857 () Bool)

(assert (=> start!4014 (=> (not res!15401) (not e!10857))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!4014 (= res!15401 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!4014 e!10857))

(assert (=> start!4014 true))

(declare-datatypes ((array!1022 0))(
  ( (array!1023 (arr!862 (Array (_ BitVec 32) (_ BitVec 8))) (size!433 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!826 0))(
  ( (BitStream!827 (buf!796 array!1022) (currentByte!1981 (_ BitVec 32)) (currentBit!1976 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!826)

(declare-fun e!10856 () Bool)

(declare-fun inv!12 (BitStream!826) Bool)

(assert (=> start!4014 (and (inv!12 b!162) e!10856)))

(declare-fun b!17130 () Bool)

(declare-fun res!15400 () Bool)

(assert (=> b!17130 (=> (not res!15400) (not e!10857))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17130 (= res!15400 (validate_offset_bits!1 ((_ sign_extend 32) (size!433 (buf!796 b!162))) ((_ sign_extend 32) (currentByte!1981 b!162)) ((_ sign_extend 32) (currentBit!1976 b!162)) origOffset!1))))

(declare-fun b!17131 () Bool)

(assert (=> b!17131 (= e!10857 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!433 (buf!796 b!162))) ((_ sign_extend 32) (currentByte!1981 b!162)) ((_ sign_extend 32) (currentBit!1976 b!162)) newOffset!1)))))

(declare-fun b!17132 () Bool)

(declare-fun array_inv!422 (array!1022) Bool)

(assert (=> b!17132 (= e!10856 (array_inv!422 (buf!796 b!162)))))

(assert (= (and start!4014 res!15401) b!17130))

(assert (= (and b!17130 res!15400) b!17131))

(assert (= start!4014 b!17132))

(declare-fun m!23311 () Bool)

(assert (=> start!4014 m!23311))

(declare-fun m!23313 () Bool)

(assert (=> b!17130 m!23313))

(declare-fun m!23315 () Bool)

(assert (=> b!17131 m!23315))

(declare-fun m!23317 () Bool)

(assert (=> b!17132 m!23317))

(push 1)

(assert (not start!4014))

(assert (not b!17130))

(assert (not b!17132))

(assert (not b!17131))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5604 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5604 (= (inv!12 b!162) (invariant!0 (currentBit!1976 b!162) (currentByte!1981 b!162) (size!433 (buf!796 b!162))))))

(declare-fun bs!1568 () Bool)

(assert (= bs!1568 d!5604))

(declare-fun m!23339 () Bool)

(assert (=> bs!1568 m!23339))

(assert (=> start!4014 d!5604))

(declare-fun d!5608 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5608 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!433 (buf!796 b!162))) ((_ sign_extend 32) (currentByte!1981 b!162)) ((_ sign_extend 32) (currentBit!1976 b!162)) origOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!433 (buf!796 b!162))) ((_ sign_extend 32) (currentByte!1981 b!162)) ((_ sign_extend 32) (currentBit!1976 b!162))) origOffset!1))))

(declare-fun bs!1570 () Bool)

(assert (= bs!1570 d!5608))

(declare-fun m!23341 () Bool)

(assert (=> bs!1570 m!23341))

(assert (=> b!17130 d!5608))

(declare-fun d!5612 () Bool)

(assert (=> d!5612 (= (array_inv!422 (buf!796 b!162)) (bvsge (size!433 (buf!796 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!17132 d!5612))

(declare-fun d!5614 () Bool)

(assert (=> d!5614 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!433 (buf!796 b!162))) ((_ sign_extend 32) (currentByte!1981 b!162)) ((_ sign_extend 32) (currentBit!1976 b!162)) newOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!433 (buf!796 b!162))) ((_ sign_extend 32) (currentByte!1981 b!162)) ((_ sign_extend 32) (currentBit!1976 b!162))) newOffset!1))))

(declare-fun bs!1571 () Bool)

(assert (= bs!1571 d!5614))

(assert (=> bs!1571 m!23341))

(assert (=> b!17131 d!5614))

(push 1)

(assert (not d!5614))

(assert (not d!5608))

(assert (not d!5604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

