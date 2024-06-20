; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54890 () Bool)

(assert start!54890)

(declare-fun b!256798 () Bool)

(declare-fun e!178010 () Bool)

(declare-datatypes ((array!13900 0))(
  ( (array!13901 (arr!7086 (Array (_ BitVec 32) (_ BitVec 8))) (size!6099 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11120 0))(
  ( (BitStream!11121 (buf!6621 array!13900) (currentByte!12115 (_ BitVec 32)) (currentBit!12110 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11120)

(declare-fun array_inv!5840 (array!13900) Bool)

(assert (=> b!256798 (= e!178010 (array_inv!5840 (buf!6621 thiss!1754)))))

(declare-fun res!215226 () Bool)

(declare-fun e!178011 () Bool)

(assert (=> start!54890 (=> (not res!215226) (not e!178011))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!54890 (= res!215226 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54890 e!178011))

(assert (=> start!54890 true))

(declare-fun inv!12 (BitStream!11120) Bool)

(assert (=> start!54890 (and (inv!12 thiss!1754) e!178010)))

(declare-fun b!256795 () Bool)

(declare-fun res!215227 () Bool)

(assert (=> b!256795 (=> (not res!215227) (not e!178011))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256795 (= res!215227 (validate_offset_bits!1 ((_ sign_extend 32) (size!6099 (buf!6621 thiss!1754))) ((_ sign_extend 32) (currentByte!12115 thiss!1754)) ((_ sign_extend 32) (currentBit!12110 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256796 () Bool)

(declare-fun res!215225 () Bool)

(assert (=> b!256796 (=> (not res!215225) (not e!178011))))

(assert (=> b!256796 (= res!215225 (= from!526 nBits!535))))

(declare-fun b!256797 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256797 (= e!178011 (not (invariant!0 (currentBit!12110 thiss!1754) (currentByte!12115 thiss!1754) (size!6099 (buf!6621 thiss!1754)))))))

(assert (= (and start!54890 res!215226) b!256795))

(assert (= (and b!256795 res!215227) b!256796))

(assert (= (and b!256796 res!215225) b!256797))

(assert (= start!54890 b!256798))

(declare-fun m!386385 () Bool)

(assert (=> b!256798 m!386385))

(declare-fun m!386387 () Bool)

(assert (=> start!54890 m!386387))

(declare-fun m!386389 () Bool)

(assert (=> b!256795 m!386389))

(declare-fun m!386391 () Bool)

(assert (=> b!256797 m!386391))

(push 1)

(assert (not b!256797))

(assert (not b!256798))

(assert (not b!256795))

(assert (not start!54890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86146 () Bool)

(assert (=> d!86146 (= (invariant!0 (currentBit!12110 thiss!1754) (currentByte!12115 thiss!1754) (size!6099 (buf!6621 thiss!1754))) (and (bvsge (currentBit!12110 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12110 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12115 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12115 thiss!1754) (size!6099 (buf!6621 thiss!1754))) (and (= (currentBit!12110 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12115 thiss!1754) (size!6099 (buf!6621 thiss!1754)))))))))

(assert (=> b!256797 d!86146))

(declare-fun d!86152 () Bool)

(assert (=> d!86152 (= (array_inv!5840 (buf!6621 thiss!1754)) (bvsge (size!6099 (buf!6621 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256798 d!86152))

(declare-fun d!86154 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86154 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6099 (buf!6621 thiss!1754))) ((_ sign_extend 32) (currentByte!12115 thiss!1754)) ((_ sign_extend 32) (currentBit!12110 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6099 (buf!6621 thiss!1754))) ((_ sign_extend 32) (currentByte!12115 thiss!1754)) ((_ sign_extend 32) (currentBit!12110 thiss!1754))) (bvsub nBits!535 from!526)))))

