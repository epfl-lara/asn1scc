; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55548 () Bool)

(assert start!55548)

(declare-fun res!216684 () Bool)

(declare-fun e!179415 () Bool)

(assert (=> start!55548 (=> (not res!216684) (not e!179415))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55548 (= res!216684 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55548 e!179415))

(assert (=> start!55548 true))

(declare-datatypes ((array!14087 0))(
  ( (array!14088 (arr!7160 (Array (_ BitVec 32) (_ BitVec 8))) (size!6173 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11268 0))(
  ( (BitStream!11269 (buf!6695 array!14087) (currentByte!12300 (_ BitVec 32)) (currentBit!12295 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11268)

(declare-fun e!179416 () Bool)

(declare-fun inv!12 (BitStream!11268) Bool)

(assert (=> start!55548 (and (inv!12 thiss!1754) e!179416)))

(declare-fun b!258669 () Bool)

(declare-fun lt!400378 () (_ BitVec 64))

(declare-fun lt!400379 () (_ BitVec 64))

(assert (=> b!258669 (= e!179415 (and (= lt!400379 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400379 (bvand (bvadd lt!400378 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258669 (= lt!400379 (bvand lt!400378 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258669 (= lt!400378 (bitIndex!0 (size!6173 (buf!6695 thiss!1754)) (currentByte!12300 thiss!1754) (currentBit!12295 thiss!1754)))))

(declare-fun b!258670 () Bool)

(declare-fun array_inv!5914 (array!14087) Bool)

(assert (=> b!258670 (= e!179416 (array_inv!5914 (buf!6695 thiss!1754)))))

(declare-fun b!258668 () Bool)

(declare-fun res!216683 () Bool)

(assert (=> b!258668 (=> (not res!216683) (not e!179415))))

(assert (=> b!258668 (= res!216683 (= from!526 nBits!535))))

(declare-fun b!258667 () Bool)

(declare-fun res!216685 () Bool)

(assert (=> b!258667 (=> (not res!216685) (not e!179415))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258667 (= res!216685 (validate_offset_bits!1 ((_ sign_extend 32) (size!6173 (buf!6695 thiss!1754))) ((_ sign_extend 32) (currentByte!12300 thiss!1754)) ((_ sign_extend 32) (currentBit!12295 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55548 res!216684) b!258667))

(assert (= (and b!258667 res!216685) b!258668))

(assert (= (and b!258668 res!216683) b!258669))

(assert (= start!55548 b!258670))

(declare-fun m!388075 () Bool)

(assert (=> start!55548 m!388075))

(declare-fun m!388077 () Bool)

(assert (=> b!258669 m!388077))

(declare-fun m!388079 () Bool)

(assert (=> b!258670 m!388079))

(declare-fun m!388081 () Bool)

(assert (=> b!258667 m!388081))

(check-sat (not start!55548) (not b!258667) (not b!258670) (not b!258669))
(check-sat)
(get-model)

(declare-fun d!86804 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86804 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12295 thiss!1754) (currentByte!12300 thiss!1754) (size!6173 (buf!6695 thiss!1754))))))

(declare-fun bs!21966 () Bool)

(assert (= bs!21966 d!86804))

(declare-fun m!388091 () Bool)

(assert (=> bs!21966 m!388091))

(assert (=> start!55548 d!86804))

(declare-fun d!86806 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86806 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6173 (buf!6695 thiss!1754))) ((_ sign_extend 32) (currentByte!12300 thiss!1754)) ((_ sign_extend 32) (currentBit!12295 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6173 (buf!6695 thiss!1754))) ((_ sign_extend 32) (currentByte!12300 thiss!1754)) ((_ sign_extend 32) (currentBit!12295 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21967 () Bool)

(assert (= bs!21967 d!86806))

(declare-fun m!388093 () Bool)

(assert (=> bs!21967 m!388093))

(assert (=> b!258667 d!86806))

(declare-fun d!86808 () Bool)

(assert (=> d!86808 (= (array_inv!5914 (buf!6695 thiss!1754)) (bvsge (size!6173 (buf!6695 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258670 d!86808))

(declare-fun d!86812 () Bool)

(declare-fun e!179434 () Bool)

(assert (=> d!86812 e!179434))

(declare-fun res!216711 () Bool)

(assert (=> d!86812 (=> (not res!216711) (not e!179434))))

(declare-fun lt!400436 () (_ BitVec 64))

(declare-fun lt!400428 () (_ BitVec 64))

(declare-fun lt!400438 () (_ BitVec 64))

(assert (=> d!86812 (= res!216711 (= lt!400436 (bvsub lt!400438 lt!400428)))))

(assert (=> d!86812 (or (= (bvand lt!400438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400428 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400438 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400438 lt!400428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86812 (= lt!400428 (remainingBits!0 ((_ sign_extend 32) (size!6173 (buf!6695 thiss!1754))) ((_ sign_extend 32) (currentByte!12300 thiss!1754)) ((_ sign_extend 32) (currentBit!12295 thiss!1754))))))

(declare-fun lt!400429 () (_ BitVec 64))

(declare-fun lt!400432 () (_ BitVec 64))

(assert (=> d!86812 (= lt!400438 (bvmul lt!400429 lt!400432))))

(assert (=> d!86812 (or (= lt!400429 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400432 (bvsdiv (bvmul lt!400429 lt!400432) lt!400429)))))

(assert (=> d!86812 (= lt!400432 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86812 (= lt!400429 ((_ sign_extend 32) (size!6173 (buf!6695 thiss!1754))))))

(assert (=> d!86812 (= lt!400436 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12300 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12295 thiss!1754))))))

(assert (=> d!86812 (invariant!0 (currentBit!12295 thiss!1754) (currentByte!12300 thiss!1754) (size!6173 (buf!6695 thiss!1754)))))

(assert (=> d!86812 (= (bitIndex!0 (size!6173 (buf!6695 thiss!1754)) (currentByte!12300 thiss!1754) (currentBit!12295 thiss!1754)) lt!400436)))

(declare-fun b!258698 () Bool)

(declare-fun res!216710 () Bool)

(assert (=> b!258698 (=> (not res!216710) (not e!179434))))

(assert (=> b!258698 (= res!216710 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400436))))

(declare-fun b!258700 () Bool)

(declare-fun lt!400434 () (_ BitVec 64))

(assert (=> b!258700 (= e!179434 (bvsle lt!400436 (bvmul lt!400434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258700 (or (= lt!400434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400434)))))

(assert (=> b!258700 (= lt!400434 ((_ sign_extend 32) (size!6173 (buf!6695 thiss!1754))))))

(assert (= (and d!86812 res!216711) b!258698))

(assert (= (and b!258698 res!216710) b!258700))

(assert (=> d!86812 m!388093))

(assert (=> d!86812 m!388091))

(assert (=> b!258669 d!86812))

(check-sat (not d!86804) (not d!86812) (not d!86806))
