; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55546 () Bool)

(assert start!55546)

(declare-fun res!216675 () Bool)

(declare-fun e!179405 () Bool)

(assert (=> start!55546 (=> (not res!216675) (not e!179405))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55546 (= res!216675 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55546 e!179405))

(assert (=> start!55546 true))

(declare-datatypes ((array!14085 0))(
  ( (array!14086 (arr!7159 (Array (_ BitVec 32) (_ BitVec 8))) (size!6172 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11266 0))(
  ( (BitStream!11267 (buf!6694 array!14085) (currentByte!12299 (_ BitVec 32)) (currentBit!12294 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11266)

(declare-fun e!179406 () Bool)

(declare-fun inv!12 (BitStream!11266) Bool)

(assert (=> start!55546 (and (inv!12 thiss!1754) e!179406)))

(declare-fun lt!400373 () (_ BitVec 64))

(declare-fun lt!400372 () (_ BitVec 64))

(declare-fun b!258657 () Bool)

(assert (=> b!258657 (= e!179405 (and (= lt!400373 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400373 (bvand (bvadd lt!400372 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258657 (= lt!400373 (bvand lt!400372 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258657 (= lt!400372 (bitIndex!0 (size!6172 (buf!6694 thiss!1754)) (currentByte!12299 thiss!1754) (currentBit!12294 thiss!1754)))))

(declare-fun b!258658 () Bool)

(declare-fun array_inv!5913 (array!14085) Bool)

(assert (=> b!258658 (= e!179406 (array_inv!5913 (buf!6694 thiss!1754)))))

(declare-fun b!258655 () Bool)

(declare-fun res!216676 () Bool)

(assert (=> b!258655 (=> (not res!216676) (not e!179405))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258655 (= res!216676 (validate_offset_bits!1 ((_ sign_extend 32) (size!6172 (buf!6694 thiss!1754))) ((_ sign_extend 32) (currentByte!12299 thiss!1754)) ((_ sign_extend 32) (currentBit!12294 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258656 () Bool)

(declare-fun res!216674 () Bool)

(assert (=> b!258656 (=> (not res!216674) (not e!179405))))

(assert (=> b!258656 (= res!216674 (= from!526 nBits!535))))

(assert (= (and start!55546 res!216675) b!258655))

(assert (= (and b!258655 res!216676) b!258656))

(assert (= (and b!258656 res!216674) b!258657))

(assert (= start!55546 b!258658))

(declare-fun m!388067 () Bool)

(assert (=> start!55546 m!388067))

(declare-fun m!388069 () Bool)

(assert (=> b!258657 m!388069))

(declare-fun m!388071 () Bool)

(assert (=> b!258658 m!388071))

(declare-fun m!388073 () Bool)

(assert (=> b!258655 m!388073))

(push 1)

(assert (not b!258658))

(assert (not b!258657))

(assert (not start!55546))

(assert (not b!258655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86810 () Bool)

(assert (=> d!86810 (= (array_inv!5913 (buf!6694 thiss!1754)) (bvsge (size!6172 (buf!6694 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258658 d!86810))

(declare-fun d!86814 () Bool)

(declare-fun e!179433 () Bool)

(assert (=> d!86814 e!179433))

(declare-fun res!216709 () Bool)

(assert (=> d!86814 (=> (not res!216709) (not e!179433))))

(declare-fun lt!400435 () (_ BitVec 64))

(declare-fun lt!400439 () (_ BitVec 64))

(declare-fun lt!400430 () (_ BitVec 64))

(assert (=> d!86814 (= res!216709 (= lt!400430 (bvsub lt!400435 lt!400439)))))

(assert (=> d!86814 (or (= (bvand lt!400435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400439 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400435 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400435 lt!400439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86814 (= lt!400439 (remainingBits!0 ((_ sign_extend 32) (size!6172 (buf!6694 thiss!1754))) ((_ sign_extend 32) (currentByte!12299 thiss!1754)) ((_ sign_extend 32) (currentBit!12294 thiss!1754))))))

(declare-fun lt!400437 () (_ BitVec 64))

(declare-fun lt!400431 () (_ BitVec 64))

(assert (=> d!86814 (= lt!400435 (bvmul lt!400437 lt!400431))))

(assert (=> d!86814 (or (= lt!400437 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400431 (bvsdiv (bvmul lt!400437 lt!400431) lt!400437)))))

(assert (=> d!86814 (= lt!400431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86814 (= lt!400437 ((_ sign_extend 32) (size!6172 (buf!6694 thiss!1754))))))

(assert (=> d!86814 (= lt!400430 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12299 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12294 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86814 (invariant!0 (currentBit!12294 thiss!1754) (currentByte!12299 thiss!1754) (size!6172 (buf!6694 thiss!1754)))))

(assert (=> d!86814 (= (bitIndex!0 (size!6172 (buf!6694 thiss!1754)) (currentByte!12299 thiss!1754) (currentBit!12294 thiss!1754)) lt!400430)))

(declare-fun b!258697 () Bool)

(declare-fun res!216712 () Bool)

(assert (=> b!258697 (=> (not res!216712) (not e!179433))))

(assert (=> b!258697 (= res!216712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400430))))

(declare-fun b!258699 () Bool)

(declare-fun lt!400433 () (_ BitVec 64))

(assert (=> b!258699 (= e!179433 (bvsle lt!400430 (bvmul lt!400433 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258699 (or (= lt!400433 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400433 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400433)))))

(assert (=> b!258699 (= lt!400433 ((_ sign_extend 32) (size!6172 (buf!6694 thiss!1754))))))

(assert (= (and d!86814 res!216709) b!258697))

(assert (= (and b!258697 res!216712) b!258699))

(declare-fun m!388099 () Bool)

(assert (=> d!86814 m!388099))

(declare-fun m!388101 () Bool)

(assert (=> d!86814 m!388101))

(assert (=> b!258657 d!86814))

(declare-fun d!86824 () Bool)

(assert (=> d!86824 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12294 thiss!1754) (currentByte!12299 thiss!1754) (size!6172 (buf!6694 thiss!1754))))))

(declare-fun bs!21970 () Bool)

(assert (= bs!21970 d!86824))

(assert (=> bs!21970 m!388101))

(assert (=> start!55546 d!86824))

(declare-fun d!86826 () Bool)

(assert (=> d!86826 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6172 (buf!6694 thiss!1754))) ((_ sign_extend 32) (currentByte!12299 thiss!1754)) ((_ sign_extend 32) (currentBit!12294 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6172 (buf!6694 thiss!1754))) ((_ sign_extend 32) (currentByte!12299 thiss!1754)) ((_ sign_extend 32) (currentBit!12294 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21971 () Bool)

(assert (= bs!21971 d!86826))

(assert (=> bs!21971 m!388099))

(assert (=> b!258655 d!86826))

(push 1)

(assert (not d!86814))

(assert (not d!86824))

(assert (not d!86826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

