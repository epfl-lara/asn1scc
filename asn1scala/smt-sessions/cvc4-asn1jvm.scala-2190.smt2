; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55580 () Bool)

(assert start!55580)

(declare-fun b!258736 () Bool)

(declare-fun e!179460 () Bool)

(declare-datatypes ((array!14098 0))(
  ( (array!14099 (arr!7164 (Array (_ BitVec 32) (_ BitVec 8))) (size!6177 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11276 0))(
  ( (BitStream!11277 (buf!6699 array!14098) (currentByte!12310 (_ BitVec 32)) (currentBit!12305 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11276)

(declare-fun array_inv!5918 (array!14098) Bool)

(assert (=> b!258736 (= e!179460 (array_inv!5918 (buf!6699 thiss!1754)))))

(declare-fun lt!400456 () (_ BitVec 64))

(declare-fun b!258735 () Bool)

(declare-fun e!179461 () Bool)

(declare-fun lt!400457 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> b!258735 (= e!179461 (and (not (= lt!400457 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400457 (bvand (bvsub lt!400456 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258735 (= lt!400457 (bvand lt!400456 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258735 (= lt!400456 (bvadd (bitIndex!0 (size!6177 (buf!6699 thiss!1754)) (currentByte!12310 thiss!1754) (currentBit!12305 thiss!1754)) nBits!535))))

(declare-fun res!216737 () Bool)

(assert (=> start!55580 (=> (not res!216737) (not e!179461))))

(assert (=> start!55580 (= res!216737 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55580 e!179461))

(assert (=> start!55580 true))

(declare-fun inv!12 (BitStream!11276) Bool)

(assert (=> start!55580 (and (inv!12 thiss!1754) e!179460)))

(declare-fun b!258734 () Bool)

(declare-fun res!216739 () Bool)

(assert (=> b!258734 (=> (not res!216739) (not e!179461))))

(assert (=> b!258734 (= res!216739 (= from!526 nBits!535))))

(declare-fun b!258733 () Bool)

(declare-fun res!216738 () Bool)

(assert (=> b!258733 (=> (not res!216738) (not e!179461))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258733 (= res!216738 (validate_offset_bits!1 ((_ sign_extend 32) (size!6177 (buf!6699 thiss!1754))) ((_ sign_extend 32) (currentByte!12310 thiss!1754)) ((_ sign_extend 32) (currentBit!12305 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55580 res!216737) b!258733))

(assert (= (and b!258733 res!216738) b!258734))

(assert (= (and b!258734 res!216739) b!258735))

(assert (= start!55580 b!258736))

(declare-fun m!388119 () Bool)

(assert (=> b!258736 m!388119))

(declare-fun m!388121 () Bool)

(assert (=> b!258735 m!388121))

(declare-fun m!388123 () Bool)

(assert (=> start!55580 m!388123))

(declare-fun m!388125 () Bool)

(assert (=> b!258733 m!388125))

(push 1)

(assert (not b!258736))

(assert (not b!258735))

(assert (not start!55580))

(assert (not b!258733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86840 () Bool)

(assert (=> d!86840 (= (array_inv!5918 (buf!6699 thiss!1754)) (bvsge (size!6177 (buf!6699 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258736 d!86840))

(declare-fun d!86842 () Bool)

(declare-fun e!179470 () Bool)

(assert (=> d!86842 e!179470))

(declare-fun res!216756 () Bool)

(assert (=> d!86842 (=> (not res!216756) (not e!179470))))

(declare-fun lt!400511 () (_ BitVec 64))

(declare-fun lt!400508 () (_ BitVec 64))

(declare-fun lt!400510 () (_ BitVec 64))

(assert (=> d!86842 (= res!216756 (= lt!400508 (bvsub lt!400510 lt!400511)))))

(assert (=> d!86842 (or (= (bvand lt!400510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400511 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400510 lt!400511) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86842 (= lt!400511 (remainingBits!0 ((_ sign_extend 32) (size!6177 (buf!6699 thiss!1754))) ((_ sign_extend 32) (currentByte!12310 thiss!1754)) ((_ sign_extend 32) (currentBit!12305 thiss!1754))))))

(declare-fun lt!400506 () (_ BitVec 64))

(declare-fun lt!400507 () (_ BitVec 64))

(assert (=> d!86842 (= lt!400510 (bvmul lt!400506 lt!400507))))

(assert (=> d!86842 (or (= lt!400506 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400507 (bvsdiv (bvmul lt!400506 lt!400507) lt!400506)))))

(assert (=> d!86842 (= lt!400507 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86842 (= lt!400506 ((_ sign_extend 32) (size!6177 (buf!6699 thiss!1754))))))

(assert (=> d!86842 (= lt!400508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12310 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12305 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86842 (invariant!0 (currentBit!12305 thiss!1754) (currentByte!12310 thiss!1754) (size!6177 (buf!6699 thiss!1754)))))

(assert (=> d!86842 (= (bitIndex!0 (size!6177 (buf!6699 thiss!1754)) (currentByte!12310 thiss!1754) (currentBit!12305 thiss!1754)) lt!400508)))

(declare-fun b!258753 () Bool)

(declare-fun res!216757 () Bool)

(assert (=> b!258753 (=> (not res!216757) (not e!179470))))

(assert (=> b!258753 (= res!216757 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400508))))

(declare-fun b!258754 () Bool)

(declare-fun lt!400509 () (_ BitVec 64))

(assert (=> b!258754 (= e!179470 (bvsle lt!400508 (bvmul lt!400509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258754 (or (= lt!400509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400509)))))

(assert (=> b!258754 (= lt!400509 ((_ sign_extend 32) (size!6177 (buf!6699 thiss!1754))))))

(assert (= (and d!86842 res!216756) b!258753))

(assert (= (and b!258753 res!216757) b!258754))

(declare-fun m!388135 () Bool)

(assert (=> d!86842 m!388135))

(declare-fun m!388137 () Bool)

(assert (=> d!86842 m!388137))

(assert (=> b!258735 d!86842))

(declare-fun d!86850 () Bool)

(assert (=> d!86850 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12305 thiss!1754) (currentByte!12310 thiss!1754) (size!6177 (buf!6699 thiss!1754))))))

(declare-fun bs!21979 () Bool)

(assert (= bs!21979 d!86850))

(assert (=> bs!21979 m!388137))

(assert (=> start!55580 d!86850))

(declare-fun d!86852 () Bool)

(assert (=> d!86852 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6177 (buf!6699 thiss!1754))) ((_ sign_extend 32) (currentByte!12310 thiss!1754)) ((_ sign_extend 32) (currentBit!12305 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6177 (buf!6699 thiss!1754))) ((_ sign_extend 32) (currentByte!12310 thiss!1754)) ((_ sign_extend 32) (currentBit!12305 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21980 () Bool)

(assert (= bs!21980 d!86852))

(assert (=> bs!21980 m!388135))

(assert (=> b!258733 d!86852))

(push 1)

(assert (not d!86850))

(assert (not d!86852))

(assert (not d!86842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

