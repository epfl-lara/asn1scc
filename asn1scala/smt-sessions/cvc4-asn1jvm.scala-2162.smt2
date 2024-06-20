; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54860 () Bool)

(assert start!54860)

(declare-fun b!256762 () Bool)

(declare-fun e!177985 () Bool)

(declare-datatypes ((array!13891 0))(
  ( (array!13892 (arr!7083 (Array (_ BitVec 32) (_ BitVec 8))) (size!6096 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11114 0))(
  ( (BitStream!11115 (buf!6618 array!13891) (currentByte!12106 (_ BitVec 32)) (currentBit!12101 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11114)

(declare-fun array_inv!5837 (array!13891) Bool)

(assert (=> b!256762 (= e!177985 (array_inv!5837 (buf!6618 thiss!1754)))))

(declare-fun res!215198 () Bool)

(declare-fun e!177984 () Bool)

(assert (=> start!54860 (=> (not res!215198) (not e!177984))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!54860 (= res!215198 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54860 e!177984))

(assert (=> start!54860 true))

(declare-fun inv!12 (BitStream!11114) Bool)

(assert (=> start!54860 (and (inv!12 thiss!1754) e!177985)))

(declare-fun b!256760 () Bool)

(declare-fun res!215200 () Bool)

(assert (=> b!256760 (=> (not res!215200) (not e!177984))))

(assert (=> b!256760 (= res!215200 (= from!526 nBits!535))))

(declare-fun b!256759 () Bool)

(declare-fun res!215199 () Bool)

(assert (=> b!256759 (=> (not res!215199) (not e!177984))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256759 (= res!215199 (validate_offset_bits!1 ((_ sign_extend 32) (size!6096 (buf!6618 thiss!1754))) ((_ sign_extend 32) (currentByte!12106 thiss!1754)) ((_ sign_extend 32) (currentBit!12101 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256761 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256761 (= e!177984 (not (invariant!0 (currentBit!12101 thiss!1754) (currentByte!12106 thiss!1754) (size!6096 (buf!6618 thiss!1754)))))))

(assert (= (and start!54860 res!215198) b!256759))

(assert (= (and b!256759 res!215199) b!256760))

(assert (= (and b!256760 res!215200) b!256761))

(assert (= start!54860 b!256762))

(declare-fun m!386355 () Bool)

(assert (=> b!256762 m!386355))

(declare-fun m!386357 () Bool)

(assert (=> start!54860 m!386357))

(declare-fun m!386359 () Bool)

(assert (=> b!256759 m!386359))

(declare-fun m!386361 () Bool)

(assert (=> b!256761 m!386361))

(push 1)

(assert (not b!256762))

(assert (not start!54860))

(assert (not b!256759))

(assert (not b!256761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86114 () Bool)

(assert (=> d!86114 (= (array_inv!5837 (buf!6618 thiss!1754)) (bvsge (size!6096 (buf!6618 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256762 d!86114))

(declare-fun d!86120 () Bool)

(assert (=> d!86120 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12101 thiss!1754) (currentByte!12106 thiss!1754) (size!6096 (buf!6618 thiss!1754))))))

(declare-fun bs!21767 () Bool)

(assert (= bs!21767 d!86120))

(assert (=> bs!21767 m!386361))

(assert (=> start!54860 d!86120))

(declare-fun d!86124 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86124 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6096 (buf!6618 thiss!1754))) ((_ sign_extend 32) (currentByte!12106 thiss!1754)) ((_ sign_extend 32) (currentBit!12101 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6096 (buf!6618 thiss!1754))) ((_ sign_extend 32) (currentByte!12106 thiss!1754)) ((_ sign_extend 32) (currentBit!12101 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21769 () Bool)

(assert (= bs!21769 d!86124))

(declare-fun m!386365 () Bool)

(assert (=> bs!21769 m!386365))

(assert (=> b!256759 d!86124))

(declare-fun d!86130 () Bool)

(assert (=> d!86130 (= (invariant!0 (currentBit!12101 thiss!1754) (currentByte!12106 thiss!1754) (size!6096 (buf!6618 thiss!1754))) (and (bvsge (currentBit!12101 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12101 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12106 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12106 thiss!1754) (size!6096 (buf!6618 thiss!1754))) (and (= (currentBit!12101 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12106 thiss!1754) (size!6096 (buf!6618 thiss!1754)))))))))

