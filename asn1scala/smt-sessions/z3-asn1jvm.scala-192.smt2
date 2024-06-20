; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4016 () Bool)

(assert start!4016)

(declare-fun res!15406 () Bool)

(declare-fun e!10865 () Bool)

(assert (=> start!4016 (=> (not res!15406) (not e!10865))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!4016 (= res!15406 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!4016 e!10865))

(assert (=> start!4016 true))

(declare-datatypes ((array!1024 0))(
  ( (array!1025 (arr!863 (Array (_ BitVec 32) (_ BitVec 8))) (size!434 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!828 0))(
  ( (BitStream!829 (buf!797 array!1024) (currentByte!1982 (_ BitVec 32)) (currentBit!1977 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!828)

(declare-fun e!10864 () Bool)

(declare-fun inv!12 (BitStream!828) Bool)

(assert (=> start!4016 (and (inv!12 b!162) e!10864)))

(declare-fun b!17139 () Bool)

(declare-fun res!15407 () Bool)

(assert (=> b!17139 (=> (not res!15407) (not e!10865))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17139 (= res!15407 (validate_offset_bits!1 ((_ sign_extend 32) (size!434 (buf!797 b!162))) ((_ sign_extend 32) (currentByte!1982 b!162)) ((_ sign_extend 32) (currentBit!1977 b!162)) origOffset!1))))

(declare-fun b!17140 () Bool)

(assert (=> b!17140 (= e!10865 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!434 (buf!797 b!162))) ((_ sign_extend 32) (currentByte!1982 b!162)) ((_ sign_extend 32) (currentBit!1977 b!162)) newOffset!1)))))

(declare-fun b!17141 () Bool)

(declare-fun array_inv!423 (array!1024) Bool)

(assert (=> b!17141 (= e!10864 (array_inv!423 (buf!797 b!162)))))

(assert (= (and start!4016 res!15406) b!17139))

(assert (= (and b!17139 res!15407) b!17140))

(assert (= start!4016 b!17141))

(declare-fun m!23319 () Bool)

(assert (=> start!4016 m!23319))

(declare-fun m!23321 () Bool)

(assert (=> b!17139 m!23321))

(declare-fun m!23323 () Bool)

(assert (=> b!17140 m!23323))

(declare-fun m!23325 () Bool)

(assert (=> b!17141 m!23325))

(check-sat (not start!4016) (not b!17139) (not b!17141) (not b!17140))
(check-sat)
(get-model)

(declare-fun d!5600 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5600 (= (inv!12 b!162) (invariant!0 (currentBit!1977 b!162) (currentByte!1982 b!162) (size!434 (buf!797 b!162))))))

(declare-fun bs!1566 () Bool)

(assert (= bs!1566 d!5600))

(declare-fun m!23335 () Bool)

(assert (=> bs!1566 m!23335))

(assert (=> start!4016 d!5600))

(declare-fun d!5602 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5602 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!434 (buf!797 b!162))) ((_ sign_extend 32) (currentByte!1982 b!162)) ((_ sign_extend 32) (currentBit!1977 b!162)) origOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!434 (buf!797 b!162))) ((_ sign_extend 32) (currentByte!1982 b!162)) ((_ sign_extend 32) (currentBit!1977 b!162))) origOffset!1))))

(declare-fun bs!1567 () Bool)

(assert (= bs!1567 d!5602))

(declare-fun m!23337 () Bool)

(assert (=> bs!1567 m!23337))

(assert (=> b!17139 d!5602))

(declare-fun d!5606 () Bool)

(assert (=> d!5606 (= (array_inv!423 (buf!797 b!162)) (bvsge (size!434 (buf!797 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!17141 d!5606))

(declare-fun d!5610 () Bool)

(assert (=> d!5610 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!434 (buf!797 b!162))) ((_ sign_extend 32) (currentByte!1982 b!162)) ((_ sign_extend 32) (currentBit!1977 b!162)) newOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!434 (buf!797 b!162))) ((_ sign_extend 32) (currentByte!1982 b!162)) ((_ sign_extend 32) (currentBit!1977 b!162))) newOffset!1))))

(declare-fun bs!1569 () Bool)

(assert (= bs!1569 d!5610))

(assert (=> bs!1569 m!23337))

(assert (=> b!17140 d!5610))

(check-sat (not d!5602) (not d!5610) (not d!5600))
(check-sat)
