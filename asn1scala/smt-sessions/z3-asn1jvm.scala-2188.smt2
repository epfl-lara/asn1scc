; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55518 () Bool)

(assert start!55518)

(declare-fun b!258613 () Bool)

(declare-fun res!216639 () Bool)

(declare-fun e!179379 () Bool)

(assert (=> b!258613 (=> (not res!216639) (not e!179379))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14078 0))(
  ( (array!14079 (arr!7157 (Array (_ BitVec 32) (_ BitVec 8))) (size!6170 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11262 0))(
  ( (BitStream!11263 (buf!6692 array!14078) (currentByte!12291 (_ BitVec 32)) (currentBit!12286 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11262)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258613 (= res!216639 (validate_offset_bits!1 ((_ sign_extend 32) (size!6170 (buf!6692 thiss!1754))) ((_ sign_extend 32) (currentByte!12291 thiss!1754)) ((_ sign_extend 32) (currentBit!12286 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258614 () Bool)

(declare-fun res!216638 () Bool)

(assert (=> b!258614 (=> (not res!216638) (not e!179379))))

(assert (=> b!258614 (= res!216638 (= from!526 nBits!535))))

(declare-fun res!216640 () Bool)

(assert (=> start!55518 (=> (not res!216640) (not e!179379))))

(assert (=> start!55518 (= res!216640 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55518 e!179379))

(assert (=> start!55518 true))

(declare-fun e!179378 () Bool)

(declare-fun inv!12 (BitStream!11262) Bool)

(assert (=> start!55518 (and (inv!12 thiss!1754) e!179378)))

(declare-fun lt!400306 () (_ BitVec 64))

(declare-fun lt!400307 () (_ BitVec 64))

(declare-fun b!258615 () Bool)

(assert (=> b!258615 (= e!179379 (and (not (= lt!400306 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400306 (bvand (bvsub lt!400307 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258615 (= lt!400306 (bvand lt!400307 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258615 (= lt!400307 (bvadd (bitIndex!0 (size!6170 (buf!6692 thiss!1754)) (currentByte!12291 thiss!1754) (currentBit!12286 thiss!1754)) nBits!535))))

(declare-fun b!258616 () Bool)

(declare-fun array_inv!5911 (array!14078) Bool)

(assert (=> b!258616 (= e!179378 (array_inv!5911 (buf!6692 thiss!1754)))))

(assert (= (and start!55518 res!216640) b!258613))

(assert (= (and b!258613 res!216639) b!258614))

(assert (= (and b!258614 res!216638) b!258615))

(assert (= start!55518 b!258616))

(declare-fun m!388039 () Bool)

(assert (=> b!258613 m!388039))

(declare-fun m!388041 () Bool)

(assert (=> start!55518 m!388041))

(declare-fun m!388043 () Bool)

(assert (=> b!258615 m!388043))

(declare-fun m!388045 () Bool)

(assert (=> b!258616 m!388045))

(check-sat (not b!258616) (not b!258615) (not start!55518) (not b!258613))
(check-sat)
(get-model)

(declare-fun d!86790 () Bool)

(assert (=> d!86790 (= (array_inv!5911 (buf!6692 thiss!1754)) (bvsge (size!6170 (buf!6692 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258616 d!86790))

(declare-fun d!86792 () Bool)

(declare-fun e!179398 () Bool)

(assert (=> d!86792 e!179398))

(declare-fun res!216667 () Bool)

(assert (=> d!86792 (=> (not res!216667) (not e!179398))))

(declare-fun lt!400364 () (_ BitVec 64))

(declare-fun lt!400365 () (_ BitVec 64))

(declare-fun lt!400367 () (_ BitVec 64))

(assert (=> d!86792 (= res!216667 (= lt!400365 (bvsub lt!400367 lt!400364)))))

(assert (=> d!86792 (or (= (bvand lt!400367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400364 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400367 lt!400364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86792 (= lt!400364 (remainingBits!0 ((_ sign_extend 32) (size!6170 (buf!6692 thiss!1754))) ((_ sign_extend 32) (currentByte!12291 thiss!1754)) ((_ sign_extend 32) (currentBit!12286 thiss!1754))))))

(declare-fun lt!400362 () (_ BitVec 64))

(declare-fun lt!400363 () (_ BitVec 64))

(assert (=> d!86792 (= lt!400367 (bvmul lt!400362 lt!400363))))

(assert (=> d!86792 (or (= lt!400362 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400363 (bvsdiv (bvmul lt!400362 lt!400363) lt!400362)))))

(assert (=> d!86792 (= lt!400363 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86792 (= lt!400362 ((_ sign_extend 32) (size!6170 (buf!6692 thiss!1754))))))

(assert (=> d!86792 (= lt!400365 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12291 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12286 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86792 (invariant!0 (currentBit!12286 thiss!1754) (currentByte!12291 thiss!1754) (size!6170 (buf!6692 thiss!1754)))))

(assert (=> d!86792 (= (bitIndex!0 (size!6170 (buf!6692 thiss!1754)) (currentByte!12291 thiss!1754) (currentBit!12286 thiss!1754)) lt!400365)))

(declare-fun b!258645 () Bool)

(declare-fun res!216666 () Bool)

(assert (=> b!258645 (=> (not res!216666) (not e!179398))))

(assert (=> b!258645 (= res!216666 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400365))))

(declare-fun b!258646 () Bool)

(declare-fun lt!400366 () (_ BitVec 64))

(assert (=> b!258646 (= e!179398 (bvsle lt!400365 (bvmul lt!400366 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258646 (or (= lt!400366 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400366 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400366)))))

(assert (=> b!258646 (= lt!400366 ((_ sign_extend 32) (size!6170 (buf!6692 thiss!1754))))))

(assert (= (and d!86792 res!216667) b!258645))

(assert (= (and b!258645 res!216666) b!258646))

(declare-fun m!388063 () Bool)

(assert (=> d!86792 m!388063))

(declare-fun m!388065 () Bool)

(assert (=> d!86792 m!388065))

(assert (=> b!258615 d!86792))

(declare-fun d!86798 () Bool)

(assert (=> d!86798 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12286 thiss!1754) (currentByte!12291 thiss!1754) (size!6170 (buf!6692 thiss!1754))))))

(declare-fun bs!21961 () Bool)

(assert (= bs!21961 d!86798))

(assert (=> bs!21961 m!388065))

(assert (=> start!55518 d!86798))

(declare-fun d!86800 () Bool)

(assert (=> d!86800 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6170 (buf!6692 thiss!1754))) ((_ sign_extend 32) (currentByte!12291 thiss!1754)) ((_ sign_extend 32) (currentBit!12286 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6170 (buf!6692 thiss!1754))) ((_ sign_extend 32) (currentByte!12291 thiss!1754)) ((_ sign_extend 32) (currentBit!12286 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21962 () Bool)

(assert (= bs!21962 d!86800))

(assert (=> bs!21962 m!388063))

(assert (=> b!258613 d!86800))

(check-sat (not d!86792) (not d!86798) (not d!86800))
