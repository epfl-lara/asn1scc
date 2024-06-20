; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3954 () Bool)

(assert start!3954)

(declare-fun res!15362 () Bool)

(declare-fun e!10812 () Bool)

(assert (=> start!3954 (=> (not res!15362) (not e!10812))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!3954 (= res!15362 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3954 e!10812))

(assert (=> start!3954 true))

(declare-datatypes ((array!1006 0))(
  ( (array!1007 (arr!857 (Array (_ BitVec 32) (_ BitVec 8))) (size!428 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!816 0))(
  ( (BitStream!817 (buf!791 array!1006) (currentByte!1963 (_ BitVec 32)) (currentBit!1958 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!816)

(declare-fun e!10811 () Bool)

(declare-fun inv!12 (BitStream!816) Bool)

(assert (=> start!3954 (and (inv!12 b!162) e!10811)))

(declare-fun b!17076 () Bool)

(declare-fun res!15361 () Bool)

(assert (=> b!17076 (=> (not res!15361) (not e!10812))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17076 (= res!15361 (validate_offset_bits!1 ((_ sign_extend 32) (size!428 (buf!791 b!162))) ((_ sign_extend 32) (currentByte!1963 b!162)) ((_ sign_extend 32) (currentBit!1958 b!162)) origOffset!1))))

(declare-fun b!17077 () Bool)

(assert (=> b!17077 (= e!10812 (and (bvsle ((_ sign_extend 32) (size!428 (buf!791 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1963 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1958 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!428 (buf!791 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1963 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1958 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!17078 () Bool)

(declare-fun array_inv!417 (array!1006) Bool)

(assert (=> b!17078 (= e!10811 (array_inv!417 (buf!791 b!162)))))

(assert (= (and start!3954 res!15362) b!17076))

(assert (= (and b!17076 res!15361) b!17077))

(assert (= start!3954 b!17078))

(declare-fun m!23253 () Bool)

(assert (=> start!3954 m!23253))

(declare-fun m!23255 () Bool)

(assert (=> b!17076 m!23255))

(declare-fun m!23257 () Bool)

(assert (=> b!17078 m!23257))

(check-sat (not b!17076) (not b!17078) (not start!3954))
(check-sat)
(get-model)

(declare-fun d!5546 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5546 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!428 (buf!791 b!162))) ((_ sign_extend 32) (currentByte!1963 b!162)) ((_ sign_extend 32) (currentBit!1958 b!162)) origOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!428 (buf!791 b!162))) ((_ sign_extend 32) (currentByte!1963 b!162)) ((_ sign_extend 32) (currentBit!1958 b!162))) origOffset!1))))

(declare-fun bs!1549 () Bool)

(assert (= bs!1549 d!5546))

(declare-fun m!23265 () Bool)

(assert (=> bs!1549 m!23265))

(assert (=> b!17076 d!5546))

(declare-fun d!5548 () Bool)

(assert (=> d!5548 (= (array_inv!417 (buf!791 b!162)) (bvsge (size!428 (buf!791 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!17078 d!5548))

(declare-fun d!5550 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5550 (= (inv!12 b!162) (invariant!0 (currentBit!1958 b!162) (currentByte!1963 b!162) (size!428 (buf!791 b!162))))))

(declare-fun bs!1550 () Bool)

(assert (= bs!1550 d!5550))

(declare-fun m!23267 () Bool)

(assert (=> bs!1550 m!23267))

(assert (=> start!3954 d!5550))

(check-sat (not d!5550) (not d!5546))
(check-sat)
(get-model)

(declare-fun d!5560 () Bool)

(assert (=> d!5560 (= (invariant!0 (currentBit!1958 b!162) (currentByte!1963 b!162) (size!428 (buf!791 b!162))) (and (bvsge (currentBit!1958 b!162) #b00000000000000000000000000000000) (bvslt (currentBit!1958 b!162) #b00000000000000000000000000001000) (bvsge (currentByte!1963 b!162) #b00000000000000000000000000000000) (or (bvslt (currentByte!1963 b!162) (size!428 (buf!791 b!162))) (and (= (currentBit!1958 b!162) #b00000000000000000000000000000000) (= (currentByte!1963 b!162) (size!428 (buf!791 b!162)))))))))

(assert (=> d!5550 d!5560))

(declare-fun d!5566 () Bool)

(assert (=> d!5566 (= (remainingBits!0 ((_ sign_extend 32) (size!428 (buf!791 b!162))) ((_ sign_extend 32) (currentByte!1963 b!162)) ((_ sign_extend 32) (currentBit!1958 b!162))) (bvsub (bvmul ((_ sign_extend 32) (size!428 (buf!791 b!162))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1963 b!162)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1958 b!162)))))))

(assert (=> d!5546 d!5566))

(check-sat)
