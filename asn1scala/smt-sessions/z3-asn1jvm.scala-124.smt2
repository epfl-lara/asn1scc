; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3040 () Bool)

(assert start!3040)

(declare-fun res!13197 () Bool)

(declare-fun e!8551 () Bool)

(assert (=> start!3040 (=> (not res!13197) (not e!8551))))

(declare-datatypes ((array!779 0))(
  ( (array!780 (arr!764 (Array (_ BitVec 32) (_ BitVec 8))) (size!335 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!630 0))(
  ( (BitStream!631 (buf!686 array!779) (currentByte!1812 (_ BitVec 32)) (currentBit!1807 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!630)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!3040 (= res!13197 (validate_offset_bit!0 ((_ sign_extend 32) (size!335 (buf!686 thiss!957))) ((_ sign_extend 32) (currentByte!1812 thiss!957)) ((_ sign_extend 32) (currentBit!1807 thiss!957))))))

(assert (=> start!3040 e!8551))

(declare-fun e!8552 () Bool)

(declare-fun inv!12 (BitStream!630) Bool)

(assert (=> start!3040 (and (inv!12 thiss!957) e!8552)))

(declare-fun b!13909 () Bool)

(declare-fun res!13199 () Bool)

(declare-fun e!8550 () Bool)

(assert (=> b!13909 (=> res!13199 e!8550)))

(declare-datatypes ((Unit!1135 0))(
  ( (Unit!1136) )
))
(declare-datatypes ((tuple2!1638 0))(
  ( (tuple2!1639 (_1!874 Unit!1135) (_2!874 BitStream!630)) )
))
(declare-fun lt!21544 () tuple2!1638)

(declare-fun isPrefixOf!0 (BitStream!630 BitStream!630) Bool)

(assert (=> b!13909 (= res!13199 (not (isPrefixOf!0 thiss!957 (_2!874 lt!21544))))))

(declare-fun b!13910 () Bool)

(declare-fun res!13195 () Bool)

(assert (=> b!13910 (=> res!13195 e!8550)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13910 (= res!13195 (not (= (bitIndex!0 (size!335 (buf!686 (_2!874 lt!21544))) (currentByte!1812 (_2!874 lt!21544)) (currentBit!1807 (_2!874 lt!21544))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!335 (buf!686 thiss!957)) (currentByte!1812 thiss!957) (currentBit!1807 thiss!957))))))))

(declare-fun b!13911 () Bool)

(declare-fun e!8548 () Bool)

(declare-datatypes ((tuple2!1640 0))(
  ( (tuple2!1641 (_1!875 BitStream!630) (_2!875 Bool)) )
))
(declare-fun lt!21548 () tuple2!1640)

(declare-fun lt!21546 () (_ BitVec 64))

(assert (=> b!13911 (= e!8548 (= (bitIndex!0 (size!335 (buf!686 (_1!875 lt!21548))) (currentByte!1812 (_1!875 lt!21548)) (currentBit!1807 (_1!875 lt!21548))) lt!21546))))

(declare-fun b!13912 () Bool)

(declare-fun array_inv!324 (array!779) Bool)

(assert (=> b!13912 (= e!8552 (array_inv!324 (buf!686 thiss!957)))))

(declare-fun b!13913 () Bool)

(declare-fun lt!21547 () BitStream!630)

(assert (=> b!13913 (= e!8550 (validate_offset_bit!0 ((_ sign_extend 32) (size!335 (buf!686 lt!21547))) ((_ sign_extend 32) (currentByte!1812 lt!21547)) ((_ sign_extend 32) (currentBit!1807 lt!21547))))))

(declare-fun readerFrom!0 (BitStream!630 (_ BitVec 32) (_ BitVec 32)) BitStream!630)

(assert (=> b!13913 (= lt!21547 (readerFrom!0 (_2!874 lt!21544) (currentBit!1807 thiss!957) (currentByte!1812 thiss!957)))))

(declare-fun b!13914 () Bool)

(declare-fun res!13196 () Bool)

(declare-fun e!8549 () Bool)

(assert (=> b!13914 (=> (not res!13196) (not e!8549))))

(assert (=> b!13914 (= res!13196 (isPrefixOf!0 thiss!957 (_2!874 lt!21544)))))

(declare-fun b!13915 () Bool)

(assert (=> b!13915 (= e!8551 (not e!8550))))

(declare-fun res!13201 () Bool)

(assert (=> b!13915 (=> res!13201 e!8550)))

(assert (=> b!13915 (= res!13201 (not (= (size!335 (buf!686 (_2!874 lt!21544))) (size!335 (buf!686 thiss!957)))))))

(declare-fun e!8546 () Bool)

(assert (=> b!13915 e!8546))

(declare-fun res!13200 () Bool)

(assert (=> b!13915 (=> (not res!13200) (not e!8546))))

(assert (=> b!13915 (= res!13200 (= (size!335 (buf!686 thiss!957)) (size!335 (buf!686 (_2!874 lt!21544)))))))

(declare-fun appendBit!0 (BitStream!630 Bool) tuple2!1638)

(assert (=> b!13915 (= lt!21544 (appendBit!0 thiss!957 false))))

(declare-fun b!13916 () Bool)

(assert (=> b!13916 (= e!8546 e!8549)))

(declare-fun res!13194 () Bool)

(assert (=> b!13916 (=> (not res!13194) (not e!8549))))

(declare-fun lt!21545 () (_ BitVec 64))

(assert (=> b!13916 (= res!13194 (= lt!21546 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21545)))))

(assert (=> b!13916 (= lt!21546 (bitIndex!0 (size!335 (buf!686 (_2!874 lt!21544))) (currentByte!1812 (_2!874 lt!21544)) (currentBit!1807 (_2!874 lt!21544))))))

(assert (=> b!13916 (= lt!21545 (bitIndex!0 (size!335 (buf!686 thiss!957)) (currentByte!1812 thiss!957) (currentBit!1807 thiss!957)))))

(declare-fun b!13917 () Bool)

(assert (=> b!13917 (= e!8549 e!8548)))

(declare-fun res!13198 () Bool)

(assert (=> b!13917 (=> (not res!13198) (not e!8548))))

(assert (=> b!13917 (= res!13198 (and (not (_2!875 lt!21548)) (= (_1!875 lt!21548) (_2!874 lt!21544))))))

(declare-fun readBitPure!0 (BitStream!630) tuple2!1640)

(assert (=> b!13917 (= lt!21548 (readBitPure!0 (readerFrom!0 (_2!874 lt!21544) (currentBit!1807 thiss!957) (currentByte!1812 thiss!957))))))

(assert (= (and start!3040 res!13197) b!13915))

(assert (= (and b!13915 res!13200) b!13916))

(assert (= (and b!13916 res!13194) b!13914))

(assert (= (and b!13914 res!13196) b!13917))

(assert (= (and b!13917 res!13198) b!13911))

(assert (= (and b!13915 (not res!13201)) b!13910))

(assert (= (and b!13910 (not res!13195)) b!13909))

(assert (= (and b!13909 (not res!13199)) b!13913))

(assert (= start!3040 b!13912))

(declare-fun m!20437 () Bool)

(assert (=> b!13914 m!20437))

(declare-fun m!20439 () Bool)

(assert (=> b!13916 m!20439))

(declare-fun m!20441 () Bool)

(assert (=> b!13916 m!20441))

(declare-fun m!20443 () Bool)

(assert (=> b!13917 m!20443))

(assert (=> b!13917 m!20443))

(declare-fun m!20445 () Bool)

(assert (=> b!13917 m!20445))

(declare-fun m!20447 () Bool)

(assert (=> b!13912 m!20447))

(declare-fun m!20449 () Bool)

(assert (=> b!13911 m!20449))

(assert (=> b!13909 m!20437))

(assert (=> b!13910 m!20439))

(assert (=> b!13910 m!20441))

(declare-fun m!20451 () Bool)

(assert (=> b!13915 m!20451))

(declare-fun m!20453 () Bool)

(assert (=> start!3040 m!20453))

(declare-fun m!20455 () Bool)

(assert (=> start!3040 m!20455))

(declare-fun m!20457 () Bool)

(assert (=> b!13913 m!20457))

(assert (=> b!13913 m!20443))

(check-sat (not b!13916) (not start!3040) (not b!13917) (not b!13910) (not b!13914) (not b!13909) (not b!13911) (not b!13915) (not b!13913) (not b!13912))
(check-sat)
(get-model)

(declare-fun d!4506 () Bool)

(declare-fun res!13233 () Bool)

(declare-fun e!8579 () Bool)

(assert (=> d!4506 (=> (not res!13233) (not e!8579))))

(assert (=> d!4506 (= res!13233 (= (size!335 (buf!686 thiss!957)) (size!335 (buf!686 (_2!874 lt!21544)))))))

(assert (=> d!4506 (= (isPrefixOf!0 thiss!957 (_2!874 lt!21544)) e!8579)))

(declare-fun b!13951 () Bool)

(declare-fun res!13234 () Bool)

(assert (=> b!13951 (=> (not res!13234) (not e!8579))))

(assert (=> b!13951 (= res!13234 (bvsle (bitIndex!0 (size!335 (buf!686 thiss!957)) (currentByte!1812 thiss!957) (currentBit!1807 thiss!957)) (bitIndex!0 (size!335 (buf!686 (_2!874 lt!21544))) (currentByte!1812 (_2!874 lt!21544)) (currentBit!1807 (_2!874 lt!21544)))))))

(declare-fun b!13952 () Bool)

(declare-fun e!8578 () Bool)

(assert (=> b!13952 (= e!8579 e!8578)))

(declare-fun res!13232 () Bool)

(assert (=> b!13952 (=> res!13232 e!8578)))

(assert (=> b!13952 (= res!13232 (= (size!335 (buf!686 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13953 () Bool)

(declare-fun arrayBitRangesEq!0 (array!779 array!779 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13953 (= e!8578 (arrayBitRangesEq!0 (buf!686 thiss!957) (buf!686 (_2!874 lt!21544)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!335 (buf!686 thiss!957)) (currentByte!1812 thiss!957) (currentBit!1807 thiss!957))))))

(assert (= (and d!4506 res!13233) b!13951))

(assert (= (and b!13951 res!13234) b!13952))

(assert (= (and b!13952 (not res!13232)) b!13953))

(assert (=> b!13951 m!20441))

(assert (=> b!13951 m!20439))

(assert (=> b!13953 m!20441))

(assert (=> b!13953 m!20441))

(declare-fun m!20481 () Bool)

(assert (=> b!13953 m!20481))

(assert (=> b!13914 d!4506))

(assert (=> b!13909 d!4506))

(declare-fun d!4508 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4508 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!335 (buf!686 lt!21547))) ((_ sign_extend 32) (currentByte!1812 lt!21547)) ((_ sign_extend 32) (currentBit!1807 lt!21547))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!335 (buf!686 lt!21547))) ((_ sign_extend 32) (currentByte!1812 lt!21547)) ((_ sign_extend 32) (currentBit!1807 lt!21547))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1240 () Bool)

(assert (= bs!1240 d!4508))

(declare-fun m!20483 () Bool)

(assert (=> bs!1240 m!20483))

(assert (=> b!13913 d!4508))

(declare-fun d!4512 () Bool)

(declare-fun e!8582 () Bool)

(assert (=> d!4512 e!8582))

(declare-fun res!13238 () Bool)

(assert (=> d!4512 (=> (not res!13238) (not e!8582))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4512 (= res!13238 (invariant!0 (currentBit!1807 (_2!874 lt!21544)) (currentByte!1812 (_2!874 lt!21544)) (size!335 (buf!686 (_2!874 lt!21544)))))))

(assert (=> d!4512 (= (readerFrom!0 (_2!874 lt!21544) (currentBit!1807 thiss!957) (currentByte!1812 thiss!957)) (BitStream!631 (buf!686 (_2!874 lt!21544)) (currentByte!1812 thiss!957) (currentBit!1807 thiss!957)))))

(declare-fun b!13956 () Bool)

(assert (=> b!13956 (= e!8582 (invariant!0 (currentBit!1807 thiss!957) (currentByte!1812 thiss!957) (size!335 (buf!686 (_2!874 lt!21544)))))))

(assert (= (and d!4512 res!13238) b!13956))

(declare-fun m!20485 () Bool)

(assert (=> d!4512 m!20485))

(declare-fun m!20487 () Bool)

(assert (=> b!13956 m!20487))

(assert (=> b!13913 d!4512))

(declare-fun d!4514 () Bool)

(declare-fun e!8588 () Bool)

(assert (=> d!4514 e!8588))

(declare-fun res!13248 () Bool)

(assert (=> d!4514 (=> (not res!13248) (not e!8588))))

(declare-fun lt!21581 () (_ BitVec 64))

(declare-fun lt!21579 () (_ BitVec 64))

(declare-fun lt!21584 () (_ BitVec 64))

(assert (=> d!4514 (= res!13248 (= lt!21584 (bvsub lt!21581 lt!21579)))))

(assert (=> d!4514 (or (= (bvand lt!21581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21581 lt!21579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4514 (= lt!21579 (remainingBits!0 ((_ sign_extend 32) (size!335 (buf!686 (_1!875 lt!21548)))) ((_ sign_extend 32) (currentByte!1812 (_1!875 lt!21548))) ((_ sign_extend 32) (currentBit!1807 (_1!875 lt!21548)))))))

(declare-fun lt!21583 () (_ BitVec 64))

(declare-fun lt!21582 () (_ BitVec 64))

(assert (=> d!4514 (= lt!21581 (bvmul lt!21583 lt!21582))))

(assert (=> d!4514 (or (= lt!21583 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21582 (bvsdiv (bvmul lt!21583 lt!21582) lt!21583)))))

(assert (=> d!4514 (= lt!21582 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4514 (= lt!21583 ((_ sign_extend 32) (size!335 (buf!686 (_1!875 lt!21548)))))))

(assert (=> d!4514 (= lt!21584 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1812 (_1!875 lt!21548))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1807 (_1!875 lt!21548)))))))

(assert (=> d!4514 (invariant!0 (currentBit!1807 (_1!875 lt!21548)) (currentByte!1812 (_1!875 lt!21548)) (size!335 (buf!686 (_1!875 lt!21548))))))

(assert (=> d!4514 (= (bitIndex!0 (size!335 (buf!686 (_1!875 lt!21548))) (currentByte!1812 (_1!875 lt!21548)) (currentBit!1807 (_1!875 lt!21548))) lt!21584)))

(declare-fun b!13964 () Bool)

(declare-fun res!13247 () Bool)

(assert (=> b!13964 (=> (not res!13247) (not e!8588))))

(assert (=> b!13964 (= res!13247 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21584))))

(declare-fun b!13965 () Bool)

(declare-fun lt!21580 () (_ BitVec 64))

(assert (=> b!13965 (= e!8588 (bvsle lt!21584 (bvmul lt!21580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13965 (or (= lt!21580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21580)))))

(assert (=> b!13965 (= lt!21580 ((_ sign_extend 32) (size!335 (buf!686 (_1!875 lt!21548)))))))

(assert (= (and d!4514 res!13248) b!13964))

(assert (= (and b!13964 res!13247) b!13965))

(declare-fun m!20495 () Bool)

(assert (=> d!4514 m!20495))

(declare-fun m!20497 () Bool)

(assert (=> d!4514 m!20497))

(assert (=> b!13911 d!4514))

(declare-fun d!4522 () Bool)

(assert (=> d!4522 (= (array_inv!324 (buf!686 thiss!957)) (bvsge (size!335 (buf!686 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13912 d!4522))

(declare-fun d!4524 () Bool)

(declare-datatypes ((tuple2!1648 0))(
  ( (tuple2!1649 (_1!879 Bool) (_2!879 BitStream!630)) )
))
(declare-fun lt!21587 () tuple2!1648)

(declare-fun readBit!0 (BitStream!630) tuple2!1648)

(assert (=> d!4524 (= lt!21587 (readBit!0 (readerFrom!0 (_2!874 lt!21544) (currentBit!1807 thiss!957) (currentByte!1812 thiss!957))))))

(assert (=> d!4524 (= (readBitPure!0 (readerFrom!0 (_2!874 lt!21544) (currentBit!1807 thiss!957) (currentByte!1812 thiss!957))) (tuple2!1641 (_2!879 lt!21587) (_1!879 lt!21587)))))

(declare-fun bs!1242 () Bool)

(assert (= bs!1242 d!4524))

(assert (=> bs!1242 m!20443))

(declare-fun m!20499 () Bool)

(assert (=> bs!1242 m!20499))

(assert (=> b!13917 d!4524))

(assert (=> b!13917 d!4512))

(declare-fun d!4526 () Bool)

(declare-fun e!8589 () Bool)

(assert (=> d!4526 e!8589))

(declare-fun res!13250 () Bool)

(assert (=> d!4526 (=> (not res!13250) (not e!8589))))

(declare-fun lt!21588 () (_ BitVec 64))

(declare-fun lt!21593 () (_ BitVec 64))

(declare-fun lt!21590 () (_ BitVec 64))

(assert (=> d!4526 (= res!13250 (= lt!21593 (bvsub lt!21590 lt!21588)))))

(assert (=> d!4526 (or (= (bvand lt!21590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21588 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21590 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21590 lt!21588) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4526 (= lt!21588 (remainingBits!0 ((_ sign_extend 32) (size!335 (buf!686 (_2!874 lt!21544)))) ((_ sign_extend 32) (currentByte!1812 (_2!874 lt!21544))) ((_ sign_extend 32) (currentBit!1807 (_2!874 lt!21544)))))))

(declare-fun lt!21592 () (_ BitVec 64))

(declare-fun lt!21591 () (_ BitVec 64))

(assert (=> d!4526 (= lt!21590 (bvmul lt!21592 lt!21591))))

(assert (=> d!4526 (or (= lt!21592 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21591 (bvsdiv (bvmul lt!21592 lt!21591) lt!21592)))))

(assert (=> d!4526 (= lt!21591 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4526 (= lt!21592 ((_ sign_extend 32) (size!335 (buf!686 (_2!874 lt!21544)))))))

(assert (=> d!4526 (= lt!21593 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1812 (_2!874 lt!21544))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1807 (_2!874 lt!21544)))))))

(assert (=> d!4526 (invariant!0 (currentBit!1807 (_2!874 lt!21544)) (currentByte!1812 (_2!874 lt!21544)) (size!335 (buf!686 (_2!874 lt!21544))))))

(assert (=> d!4526 (= (bitIndex!0 (size!335 (buf!686 (_2!874 lt!21544))) (currentByte!1812 (_2!874 lt!21544)) (currentBit!1807 (_2!874 lt!21544))) lt!21593)))

(declare-fun b!13966 () Bool)

(declare-fun res!13249 () Bool)

(assert (=> b!13966 (=> (not res!13249) (not e!8589))))

(assert (=> b!13966 (= res!13249 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21593))))

(declare-fun b!13967 () Bool)

(declare-fun lt!21589 () (_ BitVec 64))

(assert (=> b!13967 (= e!8589 (bvsle lt!21593 (bvmul lt!21589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13967 (or (= lt!21589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21589)))))

(assert (=> b!13967 (= lt!21589 ((_ sign_extend 32) (size!335 (buf!686 (_2!874 lt!21544)))))))

(assert (= (and d!4526 res!13250) b!13966))

(assert (= (and b!13966 res!13249) b!13967))

(declare-fun m!20501 () Bool)

(assert (=> d!4526 m!20501))

(assert (=> d!4526 m!20485))

(assert (=> b!13910 d!4526))

(declare-fun d!4528 () Bool)

(declare-fun e!8590 () Bool)

(assert (=> d!4528 e!8590))

(declare-fun res!13252 () Bool)

(assert (=> d!4528 (=> (not res!13252) (not e!8590))))

(declare-fun lt!21596 () (_ BitVec 64))

(declare-fun lt!21599 () (_ BitVec 64))

(declare-fun lt!21594 () (_ BitVec 64))

(assert (=> d!4528 (= res!13252 (= lt!21599 (bvsub lt!21596 lt!21594)))))

(assert (=> d!4528 (or (= (bvand lt!21596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21594 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21596 lt!21594) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4528 (= lt!21594 (remainingBits!0 ((_ sign_extend 32) (size!335 (buf!686 thiss!957))) ((_ sign_extend 32) (currentByte!1812 thiss!957)) ((_ sign_extend 32) (currentBit!1807 thiss!957))))))

(declare-fun lt!21598 () (_ BitVec 64))

(declare-fun lt!21597 () (_ BitVec 64))

(assert (=> d!4528 (= lt!21596 (bvmul lt!21598 lt!21597))))

(assert (=> d!4528 (or (= lt!21598 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21597 (bvsdiv (bvmul lt!21598 lt!21597) lt!21598)))))

(assert (=> d!4528 (= lt!21597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4528 (= lt!21598 ((_ sign_extend 32) (size!335 (buf!686 thiss!957))))))

(assert (=> d!4528 (= lt!21599 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1812 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1807 thiss!957))))))

(assert (=> d!4528 (invariant!0 (currentBit!1807 thiss!957) (currentByte!1812 thiss!957) (size!335 (buf!686 thiss!957)))))

(assert (=> d!4528 (= (bitIndex!0 (size!335 (buf!686 thiss!957)) (currentByte!1812 thiss!957) (currentBit!1807 thiss!957)) lt!21599)))

(declare-fun b!13968 () Bool)

(declare-fun res!13251 () Bool)

(assert (=> b!13968 (=> (not res!13251) (not e!8590))))

(assert (=> b!13968 (= res!13251 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21599))))

(declare-fun b!13969 () Bool)

(declare-fun lt!21595 () (_ BitVec 64))

(assert (=> b!13969 (= e!8590 (bvsle lt!21599 (bvmul lt!21595 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13969 (or (= lt!21595 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21595 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21595)))))

(assert (=> b!13969 (= lt!21595 ((_ sign_extend 32) (size!335 (buf!686 thiss!957))))))

(assert (= (and d!4528 res!13252) b!13968))

(assert (= (and b!13968 res!13251) b!13969))

(declare-fun m!20503 () Bool)

(assert (=> d!4528 m!20503))

(declare-fun m!20505 () Bool)

(assert (=> d!4528 m!20505))

(assert (=> b!13910 d!4528))

(declare-fun d!4530 () Bool)

(assert (=> d!4530 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!335 (buf!686 thiss!957))) ((_ sign_extend 32) (currentByte!1812 thiss!957)) ((_ sign_extend 32) (currentBit!1807 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!335 (buf!686 thiss!957))) ((_ sign_extend 32) (currentByte!1812 thiss!957)) ((_ sign_extend 32) (currentBit!1807 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1243 () Bool)

(assert (= bs!1243 d!4530))

(assert (=> bs!1243 m!20503))

(assert (=> start!3040 d!4530))

(declare-fun d!4532 () Bool)

(assert (=> d!4532 (= (inv!12 thiss!957) (invariant!0 (currentBit!1807 thiss!957) (currentByte!1812 thiss!957) (size!335 (buf!686 thiss!957))))))

(declare-fun bs!1244 () Bool)

(assert (= bs!1244 d!4532))

(assert (=> bs!1244 m!20505))

(assert (=> start!3040 d!4532))

(declare-fun b!14009 () Bool)

(declare-fun e!8610 () Bool)

(declare-fun lt!21664 () tuple2!1640)

(declare-fun lt!21663 () tuple2!1638)

(assert (=> b!14009 (= e!8610 (= (bitIndex!0 (size!335 (buf!686 (_1!875 lt!21664))) (currentByte!1812 (_1!875 lt!21664)) (currentBit!1807 (_1!875 lt!21664))) (bitIndex!0 (size!335 (buf!686 (_2!874 lt!21663))) (currentByte!1812 (_2!874 lt!21663)) (currentBit!1807 (_2!874 lt!21663)))))))

(declare-fun b!14008 () Bool)

(declare-fun e!8611 () Bool)

(assert (=> b!14008 (= e!8611 e!8610)))

(declare-fun res!13290 () Bool)

(assert (=> b!14008 (=> (not res!13290) (not e!8610))))

(assert (=> b!14008 (= res!13290 (and (= (_2!875 lt!21664) false) (= (_1!875 lt!21664) (_2!874 lt!21663))))))

(assert (=> b!14008 (= lt!21664 (readBitPure!0 (readerFrom!0 (_2!874 lt!21663) (currentBit!1807 thiss!957) (currentByte!1812 thiss!957))))))

(declare-fun d!4534 () Bool)

(assert (=> d!4534 e!8611))

(declare-fun res!13291 () Bool)

(assert (=> d!4534 (=> (not res!13291) (not e!8611))))

(assert (=> d!4534 (= res!13291 (= (size!335 (buf!686 thiss!957)) (size!335 (buf!686 (_2!874 lt!21663)))))))

(declare-fun choose!16 (BitStream!630 Bool) tuple2!1638)

(assert (=> d!4534 (= lt!21663 (choose!16 thiss!957 false))))

(assert (=> d!4534 (validate_offset_bit!0 ((_ sign_extend 32) (size!335 (buf!686 thiss!957))) ((_ sign_extend 32) (currentByte!1812 thiss!957)) ((_ sign_extend 32) (currentBit!1807 thiss!957)))))

(assert (=> d!4534 (= (appendBit!0 thiss!957 false) lt!21663)))

(declare-fun b!14007 () Bool)

(declare-fun res!13289 () Bool)

(assert (=> b!14007 (=> (not res!13289) (not e!8611))))

(assert (=> b!14007 (= res!13289 (isPrefixOf!0 thiss!957 (_2!874 lt!21663)))))

(declare-fun b!14006 () Bool)

(declare-fun res!13288 () Bool)

(assert (=> b!14006 (=> (not res!13288) (not e!8611))))

(declare-fun lt!21662 () (_ BitVec 64))

(declare-fun lt!21665 () (_ BitVec 64))

(assert (=> b!14006 (= res!13288 (= (bitIndex!0 (size!335 (buf!686 (_2!874 lt!21663))) (currentByte!1812 (_2!874 lt!21663)) (currentBit!1807 (_2!874 lt!21663))) (bvadd lt!21665 lt!21662)))))

(assert (=> b!14006 (or (not (= (bvand lt!21665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21662 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21665 lt!21662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14006 (= lt!21662 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!14006 (= lt!21665 (bitIndex!0 (size!335 (buf!686 thiss!957)) (currentByte!1812 thiss!957) (currentBit!1807 thiss!957)))))

(assert (= (and d!4534 res!13291) b!14006))

(assert (= (and b!14006 res!13288) b!14007))

(assert (= (and b!14007 res!13289) b!14008))

(assert (= (and b!14008 res!13290) b!14009))

(declare-fun m!20529 () Bool)

(assert (=> d!4534 m!20529))

(assert (=> d!4534 m!20453))

(declare-fun m!20531 () Bool)

(assert (=> b!14009 m!20531))

(declare-fun m!20533 () Bool)

(assert (=> b!14009 m!20533))

(assert (=> b!14006 m!20533))

(assert (=> b!14006 m!20441))

(declare-fun m!20535 () Bool)

(assert (=> b!14007 m!20535))

(declare-fun m!20537 () Bool)

(assert (=> b!14008 m!20537))

(assert (=> b!14008 m!20537))

(declare-fun m!20539 () Bool)

(assert (=> b!14008 m!20539))

(assert (=> b!13915 d!4534))

(assert (=> b!13916 d!4526))

(assert (=> b!13916 d!4528))

(check-sat (not d!4530) (not b!14009) (not b!14008) (not b!13953) (not d!4532) (not d!4508) (not b!14007) (not d!4512) (not d!4514) (not d!4534) (not b!14006) (not b!13956) (not d!4526) (not d!4528) (not d!4524) (not b!13951))
(check-sat)
