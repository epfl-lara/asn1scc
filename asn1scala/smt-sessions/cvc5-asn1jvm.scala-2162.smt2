; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54856 () Bool)

(assert start!54856)

(declare-fun res!215180 () Bool)

(declare-fun e!177965 () Bool)

(assert (=> start!54856 (=> (not res!215180) (not e!177965))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!54856 (= res!215180 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54856 e!177965))

(assert (=> start!54856 true))

(declare-datatypes ((array!13887 0))(
  ( (array!13888 (arr!7081 (Array (_ BitVec 32) (_ BitVec 8))) (size!6094 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11110 0))(
  ( (BitStream!11111 (buf!6616 array!13887) (currentByte!12104 (_ BitVec 32)) (currentBit!12099 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11110)

(declare-fun e!177967 () Bool)

(declare-fun inv!12 (BitStream!11110) Bool)

(assert (=> start!54856 (and (inv!12 thiss!1754) e!177967)))

(declare-fun b!256736 () Bool)

(declare-fun res!215182 () Bool)

(assert (=> b!256736 (=> (not res!215182) (not e!177965))))

(assert (=> b!256736 (= res!215182 (= from!526 nBits!535))))

(declare-fun b!256737 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256737 (= e!177965 (not (invariant!0 (currentBit!12099 thiss!1754) (currentByte!12104 thiss!1754) (size!6094 (buf!6616 thiss!1754)))))))

(declare-fun b!256735 () Bool)

(declare-fun res!215181 () Bool)

(assert (=> b!256735 (=> (not res!215181) (not e!177965))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256735 (= res!215181 (validate_offset_bits!1 ((_ sign_extend 32) (size!6094 (buf!6616 thiss!1754))) ((_ sign_extend 32) (currentByte!12104 thiss!1754)) ((_ sign_extend 32) (currentBit!12099 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256738 () Bool)

(declare-fun array_inv!5835 (array!13887) Bool)

(assert (=> b!256738 (= e!177967 (array_inv!5835 (buf!6616 thiss!1754)))))

(assert (= (and start!54856 res!215180) b!256735))

(assert (= (and b!256735 res!215181) b!256736))

(assert (= (and b!256736 res!215182) b!256737))

(assert (= start!54856 b!256738))

(declare-fun m!386339 () Bool)

(assert (=> start!54856 m!386339))

(declare-fun m!386341 () Bool)

(assert (=> b!256737 m!386341))

(declare-fun m!386343 () Bool)

(assert (=> b!256735 m!386343))

(declare-fun m!386345 () Bool)

(assert (=> b!256738 m!386345))

(push 1)

(assert (not b!256737))

(assert (not b!256738))

(assert (not start!54856))

(assert (not b!256735))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86110 () Bool)

(assert (=> d!86110 (= (invariant!0 (currentBit!12099 thiss!1754) (currentByte!12104 thiss!1754) (size!6094 (buf!6616 thiss!1754))) (and (bvsge (currentBit!12099 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12099 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12104 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12104 thiss!1754) (size!6094 (buf!6616 thiss!1754))) (and (= (currentBit!12099 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12104 thiss!1754) (size!6094 (buf!6616 thiss!1754)))))))))

(assert (=> b!256737 d!86110))

(declare-fun d!86118 () Bool)

(assert (=> d!86118 (= (array_inv!5835 (buf!6616 thiss!1754)) (bvsge (size!6094 (buf!6616 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256738 d!86118))

(declare-fun d!86122 () Bool)

(assert (=> d!86122 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12099 thiss!1754) (currentByte!12104 thiss!1754) (size!6094 (buf!6616 thiss!1754))))))

(declare-fun bs!21768 () Bool)

(assert (= bs!21768 d!86122))

(assert (=> bs!21768 m!386341))

(assert (=> start!54856 d!86122))

(declare-fun d!86128 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86128 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6094 (buf!6616 thiss!1754))) ((_ sign_extend 32) (currentByte!12104 thiss!1754)) ((_ sign_extend 32) (currentBit!12099 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6094 (buf!6616 thiss!1754))) ((_ sign_extend 32) (currentByte!12104 thiss!1754)) ((_ sign_extend 32) (currentBit!12099 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21770 () Bool)

(assert (= bs!21770 d!86128))

(declare-fun m!386367 () Bool)

(assert (=> bs!21770 m!386367))

(assert (=> b!256735 d!86128))

(push 1)

(assert (not d!86122))

(assert (not d!86128))

