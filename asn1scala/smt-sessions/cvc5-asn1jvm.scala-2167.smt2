; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54994 () Bool)

(assert start!54994)

(declare-fun b!256951 () Bool)

(declare-fun res!215353 () Bool)

(declare-fun e!178119 () Bool)

(assert (=> b!256951 (=> (not res!215353) (not e!178119))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13929 0))(
  ( (array!13930 (arr!7096 (Array (_ BitVec 32) (_ BitVec 8))) (size!6109 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11140 0))(
  ( (BitStream!11141 (buf!6631 array!13929) (currentByte!12149 (_ BitVec 32)) (currentBit!12144 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11140)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256951 (= res!215353 (validate_offset_bits!1 ((_ sign_extend 32) (size!6109 (buf!6631 thiss!1754))) ((_ sign_extend 32) (currentByte!12149 thiss!1754)) ((_ sign_extend 32) (currentBit!12144 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256953 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256953 (= e!178119 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!6109 (buf!6631 thiss!1754))) ((_ sign_extend 32) (currentByte!12149 thiss!1754)) ((_ sign_extend 32) (currentBit!12144 thiss!1754)))))))

(declare-fun res!215351 () Bool)

(assert (=> start!54994 (=> (not res!215351) (not e!178119))))

(assert (=> start!54994 (= res!215351 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54994 e!178119))

(assert (=> start!54994 true))

(declare-fun e!178120 () Bool)

(declare-fun inv!12 (BitStream!11140) Bool)

(assert (=> start!54994 (and (inv!12 thiss!1754) e!178120)))

(declare-fun b!256954 () Bool)

(declare-fun array_inv!5850 (array!13929) Bool)

(assert (=> b!256954 (= e!178120 (array_inv!5850 (buf!6631 thiss!1754)))))

(declare-fun b!256952 () Bool)

(declare-fun res!215352 () Bool)

(assert (=> b!256952 (=> (not res!215352) (not e!178119))))

(assert (=> b!256952 (= res!215352 (not (= from!526 nBits!535)))))

(assert (= (and start!54994 res!215351) b!256951))

(assert (= (and b!256951 res!215353) b!256952))

(assert (= (and b!256952 res!215352) b!256953))

(assert (= start!54994 b!256954))

(declare-fun m!386495 () Bool)

(assert (=> b!256951 m!386495))

(declare-fun m!386497 () Bool)

(assert (=> b!256953 m!386497))

(declare-fun m!386499 () Bool)

(assert (=> start!54994 m!386499))

(declare-fun m!386501 () Bool)

(assert (=> b!256954 m!386501))

(push 1)

(assert (not b!256953))

(assert (not b!256954))

(assert (not start!54994))

(assert (not b!256951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86234 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86234 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6109 (buf!6631 thiss!1754))) ((_ sign_extend 32) (currentByte!12149 thiss!1754)) ((_ sign_extend 32) (currentBit!12144 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6109 (buf!6631 thiss!1754))) ((_ sign_extend 32) (currentByte!12149 thiss!1754)) ((_ sign_extend 32) (currentBit!12144 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21806 () Bool)

(assert (= bs!21806 d!86234))

(declare-fun m!386521 () Bool)

(assert (=> bs!21806 m!386521))

(assert (=> b!256953 d!86234))

(declare-fun d!86236 () Bool)

(assert (=> d!86236 (= (array_inv!5850 (buf!6631 thiss!1754)) (bvsge (size!6109 (buf!6631 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256954 d!86236))

(declare-fun d!86238 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86238 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12144 thiss!1754) (currentByte!12149 thiss!1754) (size!6109 (buf!6631 thiss!1754))))))

(declare-fun bs!21808 () Bool)

(assert (= bs!21808 d!86238))

(declare-fun m!386525 () Bool)

(assert (=> bs!21808 m!386525))

(assert (=> start!54994 d!86238))

(declare-fun d!86242 () Bool)

(assert (=> d!86242 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6109 (buf!6631 thiss!1754))) ((_ sign_extend 32) (currentByte!12149 thiss!1754)) ((_ sign_extend 32) (currentBit!12144 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6109 (buf!6631 thiss!1754))) ((_ sign_extend 32) (currentByte!12149 thiss!1754)) ((_ sign_extend 32) (currentBit!12144 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21810 () Bool)

(assert (= bs!21810 d!86242))

(assert (=> bs!21810 m!386521))

(assert (=> b!256951 d!86242))

(push 1)

(assert (not d!86234))

(assert (not d!86242))

(assert (not d!86238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

