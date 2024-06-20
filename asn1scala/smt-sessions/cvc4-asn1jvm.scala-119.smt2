; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2778 () Bool)

(assert start!2778)

(declare-fun res!12472 () Bool)

(declare-fun e!8016 () Bool)

(assert (=> start!2778 (=> (not res!12472) (not e!8016))))

(declare-datatypes ((array!736 0))(
  ( (array!737 (arr!750 (Array (_ BitVec 32) (_ BitVec 8))) (size!321 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!602 0))(
  ( (BitStream!603 (buf!672 array!736) (currentByte!1759 (_ BitVec 32)) (currentBit!1754 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!602)

(assert (=> start!2778 (= res!12472 (and (bvsle ((_ sign_extend 32) (size!321 (buf!672 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1759 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1754 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!321 (buf!672 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1759 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1754 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!2778 e!8016))

(declare-fun e!8017 () Bool)

(declare-fun inv!12 (BitStream!602) Bool)

(assert (=> start!2778 (and (inv!12 thiss!957) e!8017)))

(declare-fun b!13145 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13145 (= e!8016 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1754 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1759 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!321 (buf!672 thiss!957)))))))))

(declare-fun b!13146 () Bool)

(declare-fun array_inv!310 (array!736) Bool)

(assert (=> b!13146 (= e!8017 (array_inv!310 (buf!672 thiss!957)))))

(assert (= (and start!2778 res!12472) b!13145))

(assert (= start!2778 b!13146))

(declare-fun m!19805 () Bool)

(assert (=> start!2778 m!19805))

(declare-fun m!19807 () Bool)

(assert (=> b!13145 m!19807))

(declare-fun m!19809 () Bool)

(assert (=> b!13146 m!19809))

(push 1)

(assert (not b!13145))

(assert (not start!2778))

(assert (not b!13146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4210 () Bool)

(assert (=> d!4210 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1754 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1759 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!321 (buf!672 thiss!957))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1754 thiss!957))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1754 thiss!957))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1759 thiss!957))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1759 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!321 (buf!672 thiss!957))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1754 thiss!957))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1759 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!321 (buf!672 thiss!957)))))))))))

(assert (=> b!13145 d!4210))

(declare-fun d!4216 () Bool)

(assert (=> d!4216 (= (inv!12 thiss!957) (invariant!0 (currentBit!1754 thiss!957) (currentByte!1759 thiss!957) (size!321 (buf!672 thiss!957))))))

(declare-fun bs!1188 () Bool)

(assert (= bs!1188 d!4216))

(declare-fun m!19813 () Bool)

(assert (=> bs!1188 m!19813))

(assert (=> start!2778 d!4216))

(declare-fun d!4220 () Bool)

(assert (=> d!4220 (= (array_inv!310 (buf!672 thiss!957)) (bvsge (size!321 (buf!672 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13146 d!4220))

(push 1)

