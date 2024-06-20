; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46286 () Bool)

(assert start!46286)

(declare-fun b!222959 () Bool)

(declare-fun e!151694 () Bool)

(declare-datatypes ((array!10944 0))(
  ( (array!10945 (arr!5734 (Array (_ BitVec 32) (_ BitVec 8))) (size!4804 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8710 0))(
  ( (BitStream!8711 (buf!5348 array!10944) (currentByte!10018 (_ BitVec 32)) (currentBit!10013 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19028 0))(
  ( (tuple2!19029 (_1!10223 (_ BitVec 8)) (_2!10223 BitStream!8710)) )
))
(declare-fun lt!351503 () tuple2!19028)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!222959 (= e!151694 (not (invariant!0 (currentBit!10013 (_2!10223 lt!351503)) (currentByte!10018 (_2!10223 lt!351503)) (size!4804 (buf!5348 (_2!10223 lt!351503))))))))

(declare-fun arr!308 () array!10944)

(declare-datatypes ((Unit!16045 0))(
  ( (Unit!16046) )
))
(declare-datatypes ((tuple3!1134 0))(
  ( (tuple3!1135 (_1!10224 Unit!16045) (_2!10224 BitStream!8710) (_3!709 array!10944)) )
))
(declare-fun lt!351502 () tuple3!1134)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun readByteArrayLoop!0 (BitStream!8710 array!10944 (_ BitVec 32) (_ BitVec 32)) tuple3!1134)

(assert (=> b!222959 (= lt!351502 (readByteArrayLoop!0 (_2!10223 lt!351503) (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222959 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!351501 () Unit!16045)

(declare-fun thiss!1870 () BitStream!8710)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8710 BitStream!8710 (_ BitVec 64) (_ BitVec 32)) Unit!16045)

(assert (=> b!222959 (= lt!351501 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10223 lt!351503) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8710) tuple2!19028)

(assert (=> b!222959 (= lt!351503 (readByte!0 thiss!1870))))

(declare-fun b!222958 () Bool)

(declare-fun res!187175 () Bool)

(assert (=> b!222958 (=> (not res!187175) (not e!151694))))

(assert (=> b!222958 (= res!187175 (bvslt i!761 to!496))))

(declare-fun res!187176 () Bool)

(assert (=> start!46286 (=> (not res!187176) (not e!151694))))

(assert (=> start!46286 (= res!187176 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4804 arr!308))))))

(assert (=> start!46286 e!151694))

(assert (=> start!46286 true))

(declare-fun array_inv!4545 (array!10944) Bool)

(assert (=> start!46286 (array_inv!4545 arr!308)))

(declare-fun e!151692 () Bool)

(declare-fun inv!12 (BitStream!8710) Bool)

(assert (=> start!46286 (and (inv!12 thiss!1870) e!151692)))

(declare-fun b!222957 () Bool)

(declare-fun res!187174 () Bool)

(assert (=> b!222957 (=> (not res!187174) (not e!151694))))

(assert (=> b!222957 (= res!187174 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) ((_ sign_extend 32) (currentByte!10018 thiss!1870)) ((_ sign_extend 32) (currentBit!10013 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222960 () Bool)

(assert (=> b!222960 (= e!151692 (array_inv!4545 (buf!5348 thiss!1870)))))

(assert (= (and start!46286 res!187176) b!222957))

(assert (= (and b!222957 res!187174) b!222958))

(assert (= (and b!222958 res!187175) b!222959))

(assert (= start!46286 b!222960))

(declare-fun m!341209 () Bool)

(assert (=> b!222959 m!341209))

(declare-fun m!341211 () Bool)

(assert (=> b!222959 m!341211))

(declare-fun m!341213 () Bool)

(assert (=> b!222959 m!341213))

(declare-fun m!341215 () Bool)

(assert (=> b!222959 m!341215))

(declare-fun m!341217 () Bool)

(assert (=> b!222959 m!341217))

(declare-fun m!341219 () Bool)

(assert (=> b!222959 m!341219))

(declare-fun m!341221 () Bool)

(assert (=> start!46286 m!341221))

(declare-fun m!341223 () Bool)

(assert (=> start!46286 m!341223))

(declare-fun m!341225 () Bool)

(assert (=> b!222957 m!341225))

(declare-fun m!341227 () Bool)

(assert (=> b!222960 m!341227))

(push 1)

(assert (not b!222957))

(assert (not start!46286))

(assert (not b!222960))

(assert (not b!222959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75385 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75385 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) ((_ sign_extend 32) (currentByte!10018 thiss!1870)) ((_ sign_extend 32) (currentBit!10013 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) ((_ sign_extend 32) (currentByte!10018 thiss!1870)) ((_ sign_extend 32) (currentBit!10013 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18409 () Bool)

(assert (= bs!18409 d!75385))

(declare-fun m!341269 () Bool)

(assert (=> bs!18409 m!341269))

(assert (=> b!222957 d!75385))

(declare-fun d!75389 () Bool)

(assert (=> d!75389 (= (array_inv!4545 arr!308) (bvsge (size!4804 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46286 d!75389))

(declare-fun d!75391 () Bool)

(assert (=> d!75391 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10013 thiss!1870) (currentByte!10018 thiss!1870) (size!4804 (buf!5348 thiss!1870))))))

(declare-fun bs!18410 () Bool)

(assert (= bs!18410 d!75391))

(declare-fun m!341271 () Bool)

(assert (=> bs!18410 m!341271))

(assert (=> start!46286 d!75391))

(declare-fun d!75393 () Bool)

(assert (=> d!75393 (= (array_inv!4545 (buf!5348 thiss!1870)) (bvsge (size!4804 (buf!5348 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!222960 d!75393))

(declare-fun b!223010 () Bool)

(declare-fun lt!351668 () tuple3!1134)

(declare-fun e!151740 () Bool)

(declare-datatypes ((tuple2!19034 0))(
  ( (tuple2!19035 (_1!10229 BitStream!8710) (_2!10229 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8710) tuple2!19034)

(assert (=> b!223010 (= e!151740 (= (select (arr!5734 (_3!709 lt!351668)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10229 (readBytePure!0 (_2!10223 lt!351503)))))))

(assert (=> b!223010 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4804 (_3!709 lt!351668))))))

(declare-fun c!11067 () Bool)

(declare-fun call!3418 () Bool)

(declare-fun bm!3415 () Bool)

(declare-fun lt!351667 () tuple3!1134)

(declare-fun arrayRangesEq!704 (array!10944 array!10944 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!3415 (= call!3418 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (ite c!11067 (_3!709 lt!351667) (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) #b00000000000000000000000000000000 (ite c!11067 (bvadd #b00000000000000000000000000000001 i!761) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))))

(declare-fun d!75395 () Bool)

(assert (=> d!75395 e!151740))

(declare-fun res!187218 () Bool)

(assert (=> d!75395 (=> res!187218 e!151740)))

(assert (=> d!75395 (= res!187218 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!351680 () Bool)

(declare-fun e!151741 () Bool)

(assert (=> d!75395 (= lt!351680 e!151741)))

(declare-fun res!187220 () Bool)

(assert (=> d!75395 (=> (not res!187220) (not e!151741))))

(declare-fun lt!351675 () (_ BitVec 64))

(declare-fun lt!351663 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!75395 (= res!187220 (= (bvadd lt!351663 lt!351675) (bitIndex!0 (size!4804 (buf!5348 (_2!10224 lt!351668))) (currentByte!10018 (_2!10224 lt!351668)) (currentBit!10013 (_2!10224 lt!351668)))))))

(assert (=> d!75395 (or (not (= (bvand lt!351663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351663 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351663 lt!351675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!351658 () (_ BitVec 64))

(assert (=> d!75395 (= lt!351675 (bvmul lt!351658 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75395 (or (= lt!351658 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!351658 #b0000000000000000000000000000000000000000000000000000000000001000) lt!351658)))))

(assert (=> d!75395 (= lt!351658 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75395 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75395 (= lt!351663 (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351503))) (currentByte!10018 (_2!10223 lt!351503)) (currentBit!10013 (_2!10223 lt!351503))))))

(declare-fun e!151742 () tuple3!1134)

(assert (=> d!75395 (= lt!351668 e!151742)))

(assert (=> d!75395 (= c!11067 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75395 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))))))

(assert (=> d!75395 (= (readByteArrayLoop!0 (_2!10223 lt!351503) (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!351668)))

(declare-fun lt!351666 () Unit!16045)

(declare-fun b!223011 () Bool)

(assert (=> b!223011 (= e!151742 (tuple3!1135 lt!351666 (_2!10223 lt!351503) (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))

(declare-fun call!3420 () (_ BitVec 64))

(assert (=> b!223011 (= call!3420 call!3420)))

(declare-fun lt!351664 () Unit!16045)

(declare-fun Unit!16053 () Unit!16045)

(assert (=> b!223011 (= lt!351664 Unit!16053)))

(declare-fun lt!351656 () Unit!16045)

(declare-fun arrayRangesEqReflexiveLemma!56 (array!10944) Unit!16045)

(assert (=> b!223011 (= lt!351656 (arrayRangesEqReflexiveLemma!56 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))

(assert (=> b!223011 call!3418))

(declare-fun lt!351653 () Unit!16045)

(assert (=> b!223011 (= lt!351653 lt!351656)))

(declare-fun lt!351652 () array!10944)

(assert (=> b!223011 (= lt!351652 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))))

(declare-fun lt!351654 () array!10944)

(assert (=> b!223011 (= lt!351654 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))))

(declare-fun lt!351669 () (_ BitVec 32))

(assert (=> b!223011 (= lt!351669 #b00000000000000000000000000000000)))

(declare-fun lt!351662 () (_ BitVec 32))

(assert (=> b!223011 (= lt!351662 (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))

(declare-fun lt!351673 () (_ BitVec 32))

(assert (=> b!223011 (= lt!351673 #b00000000000000000000000000000000)))

(declare-fun lt!351659 () (_ BitVec 32))

(assert (=> b!223011 (= lt!351659 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!56 (array!10944 array!10944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16045)

(assert (=> b!223011 (= lt!351666 (arrayRangesEqSlicedLemma!56 lt!351652 lt!351654 lt!351669 lt!351662 lt!351673 lt!351659))))

(declare-fun call!3419 () Bool)

(assert (=> b!223011 call!3419))

(declare-fun b!223012 () Bool)

(declare-fun lt!351655 () Unit!16045)

(assert (=> b!223012 (= e!151742 (tuple3!1135 lt!351655 (_2!10224 lt!351667) (_3!709 lt!351667)))))

(declare-fun lt!351647 () tuple2!19028)

(assert (=> b!223012 (= lt!351647 (readByte!0 (_2!10223 lt!351503)))))

(declare-fun lt!351676 () array!10944)

(assert (=> b!223012 (= lt!351676 (array!10945 (store (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))))))

(declare-fun lt!351670 () (_ BitVec 64))

(assert (=> b!223012 (= lt!351670 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!351661 () (_ BitVec 32))

(assert (=> b!223012 (= lt!351661 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!351646 () Unit!16045)

(assert (=> b!223012 (= lt!351646 (validateOffsetBytesFromBitIndexLemma!0 (_2!10223 lt!351503) (_2!10223 lt!351647) lt!351670 lt!351661))))

(assert (=> b!223012 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351647)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351647))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351647))) (bvsub lt!351661 ((_ extract 31 0) (bvsdiv (bvadd lt!351670 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!351657 () Unit!16045)

(assert (=> b!223012 (= lt!351657 lt!351646)))

(assert (=> b!223012 (= lt!351667 (readByteArrayLoop!0 (_2!10223 lt!351647) lt!351676 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223012 (= call!3420 (bvadd (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351503))) (currentByte!10018 (_2!10223 lt!351503)) (currentBit!10013 (_2!10223 lt!351503))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!351672 () Unit!16045)

(declare-fun Unit!16056 () Unit!16045)

(assert (=> b!223012 (= lt!351672 Unit!16056)))

(assert (=> b!223012 (= (bvadd call!3420 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4804 (buf!5348 (_2!10224 lt!351667))) (currentByte!10018 (_2!10224 lt!351667)) (currentBit!10013 (_2!10224 lt!351667))))))

(declare-fun lt!351651 () Unit!16045)

(declare-fun Unit!16057 () Unit!16045)

(assert (=> b!223012 (= lt!351651 Unit!16057)))

(assert (=> b!223012 (= (bvadd (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351503))) (currentByte!10018 (_2!10223 lt!351503)) (currentBit!10013 (_2!10223 lt!351503))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4804 (buf!5348 (_2!10224 lt!351667))) (currentByte!10018 (_2!10224 lt!351667)) (currentBit!10013 (_2!10224 lt!351667))))))

(declare-fun lt!351649 () Unit!16045)

(declare-fun Unit!16058 () Unit!16045)

(assert (=> b!223012 (= lt!351649 Unit!16058)))

(assert (=> b!223012 (and (= (buf!5348 (_2!10223 lt!351503)) (buf!5348 (_2!10224 lt!351667))) (= (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (size!4804 (_3!709 lt!351667))))))

(declare-fun lt!351674 () Unit!16045)

(declare-fun Unit!16059 () Unit!16045)

(assert (=> b!223012 (= lt!351674 Unit!16059)))

(declare-fun lt!351678 () Unit!16045)

(declare-fun arrayUpdatedAtPrefixLemma!296 (array!10944 (_ BitVec 32) (_ BitVec 8)) Unit!16045)

(assert (=> b!223012 (= lt!351678 (arrayUpdatedAtPrefixLemma!296 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)))))

(assert (=> b!223012 call!3419))

(declare-fun lt!351671 () Unit!16045)

(assert (=> b!223012 (= lt!351671 lt!351678)))

(declare-fun lt!351677 () (_ BitVec 32))

(assert (=> b!223012 (= lt!351677 #b00000000000000000000000000000000)))

(declare-fun lt!351660 () Unit!16045)

(declare-fun arrayRangesEqTransitive!190 (array!10944 array!10944 array!10944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16045)

(assert (=> b!223012 (= lt!351660 (arrayRangesEqTransitive!190 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) lt!351676 (_3!709 lt!351667) lt!351677 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223012 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (_3!709 lt!351667) lt!351677 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!351648 () Unit!16045)

(assert (=> b!223012 (= lt!351648 lt!351660)))

(assert (=> b!223012 call!3418))

(declare-fun lt!351650 () Unit!16045)

(declare-fun Unit!16060 () Unit!16045)

(assert (=> b!223012 (= lt!351650 Unit!16060)))

(declare-fun lt!351679 () Unit!16045)

(declare-fun arrayRangesEqImpliesEq!65 (array!10944 array!10944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16045)

(assert (=> b!223012 (= lt!351679 (arrayRangesEqImpliesEq!65 lt!351676 (_3!709 lt!351667) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223012 (= (select (store (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5734 (_3!709 lt!351667)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!351645 () Unit!16045)

(assert (=> b!223012 (= lt!351645 lt!351679)))

(declare-fun lt!351665 () Bool)

(assert (=> b!223012 (= lt!351665 (= (select (arr!5734 (_3!709 lt!351667)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10223 lt!351647)))))

(declare-fun Unit!16061 () Unit!16045)

(assert (=> b!223012 (= lt!351655 Unit!16061)))

(assert (=> b!223012 lt!351665))

(declare-fun b!223013 () Bool)

(declare-fun res!187219 () Bool)

(assert (=> b!223013 (=> (not res!187219) (not e!151741))))

(assert (=> b!223013 (= res!187219 (and (= (buf!5348 (_2!10223 lt!351503)) (buf!5348 (_2!10224 lt!351668))) (= (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (size!4804 (_3!709 lt!351668)))))))

(declare-fun b!223014 () Bool)

(assert (=> b!223014 (= e!151741 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (_3!709 lt!351668) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3416 () Bool)

(assert (=> bm!3416 (= call!3419 (arrayRangesEq!704 (ite c!11067 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) lt!351652) (ite c!11067 (array!10945 (store (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))) lt!351654) (ite c!11067 #b00000000000000000000000000000000 lt!351673) (ite c!11067 (bvadd #b00000000000000000000000000000001 i!761) lt!351659)))))

(declare-fun bm!3417 () Bool)

(assert (=> bm!3417 (= call!3420 (bitIndex!0 (ite c!11067 (size!4804 (buf!5348 (_2!10223 lt!351647))) (size!4804 (buf!5348 (_2!10223 lt!351503)))) (ite c!11067 (currentByte!10018 (_2!10223 lt!351647)) (currentByte!10018 (_2!10223 lt!351503))) (ite c!11067 (currentBit!10013 (_2!10223 lt!351647)) (currentBit!10013 (_2!10223 lt!351503)))))))

(assert (= (and d!75395 c!11067) b!223012))

(assert (= (and d!75395 (not c!11067)) b!223011))

(assert (= (or b!223012 b!223011) bm!3416))

(assert (= (or b!223012 b!223011) bm!3415))

(assert (= (or b!223012 b!223011) bm!3417))

(assert (= (and d!75395 res!187220) b!223013))

(assert (= (and b!223013 res!187219) b!223014))

(assert (= (and d!75395 (not res!187218)) b!223010))

(declare-fun m!341301 () Bool)

(assert (=> b!223012 m!341301))

(declare-fun m!341303 () Bool)

(assert (=> b!223012 m!341303))

(declare-fun m!341305 () Bool)

(assert (=> b!223012 m!341305))

(declare-fun m!341307 () Bool)

(assert (=> b!223012 m!341307))

(declare-fun m!341309 () Bool)

(assert (=> b!223012 m!341309))

(declare-fun m!341311 () Bool)

(assert (=> b!223012 m!341311))

(declare-fun m!341313 () Bool)

(assert (=> b!223012 m!341313))

(declare-fun m!341315 () Bool)

(assert (=> b!223012 m!341315))

(declare-fun m!341317 () Bool)

(assert (=> b!223012 m!341317))

(declare-fun m!341319 () Bool)

(assert (=> b!223012 m!341319))

(declare-fun m!341321 () Bool)

(assert (=> b!223012 m!341321))

(declare-fun m!341323 () Bool)

(assert (=> b!223012 m!341323))

(declare-fun m!341325 () Bool)

(assert (=> b!223012 m!341325))

(declare-fun m!341327 () Bool)

(assert (=> bm!3415 m!341327))

(declare-fun m!341329 () Bool)

(assert (=> bm!3417 m!341329))

(declare-fun m!341331 () Bool)

(assert (=> d!75395 m!341331))

(assert (=> d!75395 m!341325))

(assert (=> bm!3416 m!341313))

(declare-fun m!341333 () Bool)

(assert (=> bm!3416 m!341333))

(declare-fun m!341335 () Bool)

(assert (=> b!223014 m!341335))

(declare-fun m!341337 () Bool)

(assert (=> b!223011 m!341337))

(declare-fun m!341339 () Bool)

(assert (=> b!223011 m!341339))

(declare-fun m!341341 () Bool)

(assert (=> b!223010 m!341341))

(declare-fun m!341343 () Bool)

(assert (=> b!223010 m!341343))

(assert (=> b!222959 d!75395))

(declare-fun d!75414 () Bool)

(assert (=> d!75414 (= (invariant!0 (currentBit!10013 (_2!10223 lt!351503)) (currentByte!10018 (_2!10223 lt!351503)) (size!4804 (buf!5348 (_2!10223 lt!351503)))) (and (bvsge (currentBit!10013 (_2!10223 lt!351503)) #b00000000000000000000000000000000) (bvslt (currentBit!10013 (_2!10223 lt!351503)) #b00000000000000000000000000001000) (bvsge (currentByte!10018 (_2!10223 lt!351503)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10018 (_2!10223 lt!351503)) (size!4804 (buf!5348 (_2!10223 lt!351503)))) (and (= (currentBit!10013 (_2!10223 lt!351503)) #b00000000000000000000000000000000) (= (currentByte!10018 (_2!10223 lt!351503)) (size!4804 (buf!5348 (_2!10223 lt!351503))))))))))

(assert (=> b!222959 d!75414))

(declare-fun d!75416 () Bool)

(declare-fun lt!351767 () (_ BitVec 8))

(declare-fun lt!351770 () (_ BitVec 8))

(assert (=> d!75416 (= lt!351767 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5734 (buf!5348 thiss!1870)) (currentByte!10018 thiss!1870))) ((_ sign_extend 24) lt!351770))))))

(assert (=> d!75416 (= lt!351770 ((_ extract 7 0) (currentBit!10013 thiss!1870)))))

(declare-fun e!151754 () Bool)

(assert (=> d!75416 e!151754))

(declare-fun res!187233 () Bool)

(assert (=> d!75416 (=> (not res!187233) (not e!151754))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75416 (= res!187233 (validate_offset_bits!1 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) ((_ sign_extend 32) (currentByte!10018 thiss!1870)) ((_ sign_extend 32) (currentBit!10013 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19038 0))(
  ( (tuple2!19039 (_1!10231 Unit!16045) (_2!10231 (_ BitVec 8))) )
))
(declare-fun Unit!16063 () Unit!16045)

(declare-fun Unit!16064 () Unit!16045)

(assert (=> d!75416 (= (readByte!0 thiss!1870) (tuple2!19029 (_2!10231 (ite (bvsgt ((_ sign_extend 24) lt!351770) #b00000000000000000000000000000000) (tuple2!19039 Unit!16063 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!351767) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5734 (buf!5348 thiss!1870)) (bvadd (currentByte!10018 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!351770)))))))) (tuple2!19039 Unit!16064 lt!351767))) (BitStream!8711 (buf!5348 thiss!1870) (bvadd (currentByte!10018 thiss!1870) #b00000000000000000000000000000001) (currentBit!10013 thiss!1870))))))

(declare-fun b!223029 () Bool)

(declare-fun e!151753 () Bool)

(assert (=> b!223029 (= e!151754 e!151753)))

(declare-fun res!187232 () Bool)

(assert (=> b!223029 (=> (not res!187232) (not e!151753))))

(declare-fun lt!351769 () tuple2!19028)

(assert (=> b!223029 (= res!187232 (= (buf!5348 (_2!10223 lt!351769)) (buf!5348 thiss!1870)))))

(declare-fun lt!351772 () (_ BitVec 8))

(declare-fun lt!351771 () (_ BitVec 8))

(declare-fun Unit!16065 () Unit!16045)

(declare-fun Unit!16066 () Unit!16045)

(assert (=> b!223029 (= lt!351769 (tuple2!19029 (_2!10231 (ite (bvsgt ((_ sign_extend 24) lt!351771) #b00000000000000000000000000000000) (tuple2!19039 Unit!16065 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!351772) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5734 (buf!5348 thiss!1870)) (bvadd (currentByte!10018 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!351771)))))))) (tuple2!19039 Unit!16066 lt!351772))) (BitStream!8711 (buf!5348 thiss!1870) (bvadd (currentByte!10018 thiss!1870) #b00000000000000000000000000000001) (currentBit!10013 thiss!1870))))))

(assert (=> b!223029 (= lt!351772 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5734 (buf!5348 thiss!1870)) (currentByte!10018 thiss!1870))) ((_ sign_extend 24) lt!351771))))))

(assert (=> b!223029 (= lt!351771 ((_ extract 7 0) (currentBit!10013 thiss!1870)))))

(declare-fun lt!351773 () (_ BitVec 64))

(declare-fun lt!351768 () (_ BitVec 64))

(declare-fun b!223030 () Bool)

(assert (=> b!223030 (= e!151753 (= (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351769))) (currentByte!10018 (_2!10223 lt!351769)) (currentBit!10013 (_2!10223 lt!351769))) (bvadd lt!351773 lt!351768)))))

(assert (=> b!223030 (or (not (= (bvand lt!351773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!351768 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351773 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351773 lt!351768) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223030 (= lt!351768 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223030 (= lt!351773 (bitIndex!0 (size!4804 (buf!5348 thiss!1870)) (currentByte!10018 thiss!1870) (currentBit!10013 thiss!1870)))))

(assert (= (and d!75416 res!187233) b!223029))

(assert (= (and b!223029 res!187232) b!223030))

(declare-fun m!341345 () Bool)

(assert (=> d!75416 m!341345))

(declare-fun m!341347 () Bool)

(assert (=> d!75416 m!341347))

(declare-fun m!341349 () Bool)

(assert (=> d!75416 m!341349))

(assert (=> b!223029 m!341349))

(assert (=> b!223029 m!341345))

(declare-fun m!341351 () Bool)

(assert (=> b!223030 m!341351))

(declare-fun m!341353 () Bool)

(assert (=> b!223030 m!341353))

(assert (=> b!222959 d!75416))

(declare-fun d!75418 () Bool)

(declare-fun e!151760 () Bool)

(assert (=> d!75418 e!151760))

(declare-fun res!187239 () Bool)

(assert (=> d!75418 (=> (not res!187239) (not e!151760))))

(assert (=> d!75418 (= res!187239 (and (or (let ((rhs!3617 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3617 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3617) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75419 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75419 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75419 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3616 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3616 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3616) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!351818 () Unit!16045)

(declare-fun choose!57 (BitStream!8710 BitStream!8710 (_ BitVec 64) (_ BitVec 32)) Unit!16045)

(assert (=> d!75418 (= lt!351818 (choose!57 thiss!1870 (_2!10223 lt!351503) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75418 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10223 lt!351503) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!351818)))

(declare-fun lt!351817 () (_ BitVec 32))

(declare-fun b!223038 () Bool)

(assert (=> b!223038 (= e!151760 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503))) (bvsub (bvsub to!496 i!761) lt!351817)))))

(assert (=> b!223038 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!351817 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!351817) #b10000000000000000000000000000000)))))

(declare-fun lt!351816 () (_ BitVec 64))

(assert (=> b!223038 (= lt!351817 ((_ extract 31 0) lt!351816))))

(assert (=> b!223038 (and (bvslt lt!351816 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!351816 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223038 (= lt!351816 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75418 res!187239) b!223038))

(declare-fun m!341403 () Bool)

(assert (=> d!75418 m!341403))

(declare-fun m!341405 () Bool)

(assert (=> b!223038 m!341405))

(assert (=> b!222959 d!75418))

(declare-fun d!75429 () Bool)

(assert (=> d!75429 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503))) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18415 () Bool)

(assert (= bs!18415 d!75429))

(declare-fun m!341407 () Bool)

(assert (=> bs!18415 m!341407))

(assert (=> b!222959 d!75429))

(push 1)

(assert (not bm!3416))

(assert (not d!75395))

(assert (not b!223011))

(assert (not b!223038))

(assert (not d!75391))

(assert (not b!223010))

(assert (not b!223014))

(assert (not b!223030))

(assert (not b!223012))

(assert (not d!75429))

(assert (not bm!3415))

(assert (not bm!3417))

(assert (not d!75416))

(assert (not d!75418))

(assert (not d!75385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75494 () Bool)

(declare-fun res!187293 () Bool)

(declare-fun e!151806 () Bool)

(assert (=> d!75494 (=> res!187293 e!151806)))

(assert (=> d!75494 (= res!187293 (= #b00000000000000000000000000000000 (ite c!11067 (bvadd #b00000000000000000000000000000001 i!761) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))))

(assert (=> d!75494 (= (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (ite c!11067 (_3!709 lt!351667) (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) #b00000000000000000000000000000000 (ite c!11067 (bvadd #b00000000000000000000000000000001 i!761) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))) e!151806)))

(declare-fun b!223100 () Bool)

(declare-fun e!151807 () Bool)

(assert (=> b!223100 (= e!151806 e!151807)))

(declare-fun res!187294 () Bool)

(assert (=> b!223100 (=> (not res!187294) (not e!151807))))

(assert (=> b!223100 (= res!187294 (= (select (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) #b00000000000000000000000000000000) (select (arr!5734 (ite c!11067 (_3!709 lt!351667) (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))) #b00000000000000000000000000000000)))))

(declare-fun b!223101 () Bool)

(assert (=> b!223101 (= e!151807 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (ite c!11067 (_3!709 lt!351667) (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11067 (bvadd #b00000000000000000000000000000001 i!761) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))))

(assert (= (and d!75494 (not res!187293)) b!223100))

(assert (= (and b!223100 res!187294) b!223101))

(declare-fun m!341577 () Bool)

(assert (=> b!223100 m!341577))

(declare-fun m!341579 () Bool)

(assert (=> b!223100 m!341579))

(declare-fun m!341581 () Bool)

(assert (=> b!223101 m!341581))

(assert (=> bm!3415 d!75494))

(declare-fun d!75496 () Bool)

(declare-fun lt!352050 () tuple2!19028)

(assert (=> d!75496 (= lt!352050 (readByte!0 (_2!10223 lt!351503)))))

(assert (=> d!75496 (= (readBytePure!0 (_2!10223 lt!351503)) (tuple2!19035 (_2!10223 lt!352050) (_1!10223 lt!352050)))))

(declare-fun bs!18427 () Bool)

(assert (= bs!18427 d!75496))

(assert (=> bs!18427 m!341319))

(assert (=> b!223010 d!75496))

(declare-fun d!75498 () Bool)

(declare-fun e!151810 () Bool)

(assert (=> d!75498 e!151810))

(declare-fun res!187299 () Bool)

(assert (=> d!75498 (=> (not res!187299) (not e!151810))))

(declare-fun lt!352068 () (_ BitVec 64))

(declare-fun lt!352067 () (_ BitVec 64))

(declare-fun lt!352065 () (_ BitVec 64))

(assert (=> d!75498 (= res!187299 (= lt!352067 (bvsub lt!352068 lt!352065)))))

(assert (=> d!75498 (or (= (bvand lt!352068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352065 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352068 lt!352065) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75498 (= lt!352065 (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351769)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351769))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351769)))))))

(declare-fun lt!352066 () (_ BitVec 64))

(declare-fun lt!352063 () (_ BitVec 64))

(assert (=> d!75498 (= lt!352068 (bvmul lt!352066 lt!352063))))

(assert (=> d!75498 (or (= lt!352066 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352063 (bvsdiv (bvmul lt!352066 lt!352063) lt!352066)))))

(assert (=> d!75498 (= lt!352063 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75498 (= lt!352066 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351769)))))))

(assert (=> d!75498 (= lt!352067 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351769))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351769)))))))

(assert (=> d!75498 (invariant!0 (currentBit!10013 (_2!10223 lt!351769)) (currentByte!10018 (_2!10223 lt!351769)) (size!4804 (buf!5348 (_2!10223 lt!351769))))))

(assert (=> d!75498 (= (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351769))) (currentByte!10018 (_2!10223 lt!351769)) (currentBit!10013 (_2!10223 lt!351769))) lt!352067)))

(declare-fun b!223106 () Bool)

(declare-fun res!187300 () Bool)

(assert (=> b!223106 (=> (not res!187300) (not e!151810))))

(assert (=> b!223106 (= res!187300 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352067))))

(declare-fun b!223107 () Bool)

(declare-fun lt!352064 () (_ BitVec 64))

(assert (=> b!223107 (= e!151810 (bvsle lt!352067 (bvmul lt!352064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223107 (or (= lt!352064 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352064 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352064)))))

(assert (=> b!223107 (= lt!352064 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351769)))))))

(assert (= (and d!75498 res!187299) b!223106))

(assert (= (and b!223106 res!187300) b!223107))

(declare-fun m!341583 () Bool)

(assert (=> d!75498 m!341583))

(declare-fun m!341585 () Bool)

(assert (=> d!75498 m!341585))

(assert (=> b!223030 d!75498))

(declare-fun d!75500 () Bool)

(declare-fun e!151811 () Bool)

(assert (=> d!75500 e!151811))

(declare-fun res!187301 () Bool)

(assert (=> d!75500 (=> (not res!187301) (not e!151811))))

(declare-fun lt!352073 () (_ BitVec 64))

(declare-fun lt!352074 () (_ BitVec 64))

(declare-fun lt!352071 () (_ BitVec 64))

(assert (=> d!75500 (= res!187301 (= lt!352073 (bvsub lt!352074 lt!352071)))))

(assert (=> d!75500 (or (= (bvand lt!352074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352071 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352074 lt!352071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75500 (= lt!352071 (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) ((_ sign_extend 32) (currentByte!10018 thiss!1870)) ((_ sign_extend 32) (currentBit!10013 thiss!1870))))))

(declare-fun lt!352072 () (_ BitVec 64))

(declare-fun lt!352069 () (_ BitVec 64))

(assert (=> d!75500 (= lt!352074 (bvmul lt!352072 lt!352069))))

(assert (=> d!75500 (or (= lt!352072 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352069 (bvsdiv (bvmul lt!352072 lt!352069) lt!352072)))))

(assert (=> d!75500 (= lt!352069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75500 (= lt!352072 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))))))

(assert (=> d!75500 (= lt!352073 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10018 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10013 thiss!1870))))))

(assert (=> d!75500 (invariant!0 (currentBit!10013 thiss!1870) (currentByte!10018 thiss!1870) (size!4804 (buf!5348 thiss!1870)))))

(assert (=> d!75500 (= (bitIndex!0 (size!4804 (buf!5348 thiss!1870)) (currentByte!10018 thiss!1870) (currentBit!10013 thiss!1870)) lt!352073)))

(declare-fun b!223108 () Bool)

(declare-fun res!187302 () Bool)

(assert (=> b!223108 (=> (not res!187302) (not e!151811))))

(assert (=> b!223108 (= res!187302 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352073))))

(declare-fun b!223109 () Bool)

(declare-fun lt!352070 () (_ BitVec 64))

(assert (=> b!223109 (= e!151811 (bvsle lt!352073 (bvmul lt!352070 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223109 (or (= lt!352070 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352070 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352070)))))

(assert (=> b!223109 (= lt!352070 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))))))

(assert (= (and d!75500 res!187301) b!223108))

(assert (= (and b!223108 res!187302) b!223109))

(assert (=> d!75500 m!341269))

(assert (=> d!75500 m!341271))

(assert (=> b!223030 d!75500))

(declare-fun d!75502 () Bool)

(declare-fun res!187303 () Bool)

(declare-fun e!151812 () Bool)

(assert (=> d!75502 (=> res!187303 e!151812)))

(assert (=> d!75502 (= res!187303 (= lt!351677 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!75502 (= (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (_3!709 lt!351667) lt!351677 (bvadd #b00000000000000000000000000000001 i!761)) e!151812)))

(declare-fun b!223110 () Bool)

(declare-fun e!151813 () Bool)

(assert (=> b!223110 (= e!151812 e!151813)))

(declare-fun res!187304 () Bool)

(assert (=> b!223110 (=> (not res!187304) (not e!151813))))

(assert (=> b!223110 (= res!187304 (= (select (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) lt!351677) (select (arr!5734 (_3!709 lt!351667)) lt!351677)))))

(declare-fun b!223111 () Bool)

(assert (=> b!223111 (= e!151813 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (_3!709 lt!351667) (bvadd lt!351677 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75502 (not res!187303)) b!223110))

(assert (= (and b!223110 res!187304) b!223111))

(declare-fun m!341587 () Bool)

(assert (=> b!223110 m!341587))

(declare-fun m!341589 () Bool)

(assert (=> b!223110 m!341589))

(declare-fun m!341591 () Bool)

(assert (=> b!223111 m!341591))

(assert (=> b!223012 d!75502))

(declare-fun d!75504 () Bool)

(declare-fun e!151814 () Bool)

(assert (=> d!75504 e!151814))

(declare-fun res!187305 () Bool)

(assert (=> d!75504 (=> (not res!187305) (not e!151814))))

(assert (=> d!75504 (= res!187305 (and (or (let ((rhs!3617 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand lt!351670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3617 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!351670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351670 rhs!3617) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75419 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75419 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd lt!351670 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75419 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3616 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand lt!351670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3616 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!351670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!351670 rhs!3616) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!352077 () Unit!16045)

(assert (=> d!75504 (= lt!352077 (choose!57 (_2!10223 lt!351503) (_2!10223 lt!351647) lt!351670 lt!351661))))

(assert (=> d!75504 (= (validateOffsetBytesFromBitIndexLemma!0 (_2!10223 lt!351503) (_2!10223 lt!351647) lt!351670 lt!351661) lt!352077)))

(declare-fun b!223112 () Bool)

(declare-fun lt!352076 () (_ BitVec 32))

(assert (=> b!223112 (= e!151814 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351647)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351647))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351647))) (bvsub lt!351661 lt!352076)))))

(assert (=> b!223112 (or (= (bvand lt!351661 #b10000000000000000000000000000000) (bvand lt!352076 #b10000000000000000000000000000000)) (= (bvand lt!351661 #b10000000000000000000000000000000) (bvand (bvsub lt!351661 lt!352076) #b10000000000000000000000000000000)))))

(declare-fun lt!352075 () (_ BitVec 64))

(assert (=> b!223112 (= lt!352076 ((_ extract 31 0) lt!352075))))

(assert (=> b!223112 (and (bvslt lt!352075 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!352075 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223112 (= lt!352075 (bvsdiv (bvadd lt!351670 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75504 res!187305) b!223112))

(declare-fun m!341593 () Bool)

(assert (=> d!75504 m!341593))

(declare-fun m!341595 () Bool)

(assert (=> b!223112 m!341595))

(assert (=> b!223012 d!75504))

(declare-fun d!75506 () Bool)

(declare-fun lt!352078 () (_ BitVec 8))

(declare-fun lt!352081 () (_ BitVec 8))

(assert (=> d!75506 (= lt!352078 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5734 (buf!5348 (_2!10223 lt!351503))) (currentByte!10018 (_2!10223 lt!351503)))) ((_ sign_extend 24) lt!352081))))))

(assert (=> d!75506 (= lt!352081 ((_ extract 7 0) (currentBit!10013 (_2!10223 lt!351503))))))

(declare-fun e!151816 () Bool)

(assert (=> d!75506 e!151816))

(declare-fun res!187307 () Bool)

(assert (=> d!75506 (=> (not res!187307) (not e!151816))))

(assert (=> d!75506 (= res!187307 (validate_offset_bits!1 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!16095 () Unit!16045)

(declare-fun Unit!16096 () Unit!16045)

(assert (=> d!75506 (= (readByte!0 (_2!10223 lt!351503)) (tuple2!19029 (_2!10231 (ite (bvsgt ((_ sign_extend 24) lt!352081) #b00000000000000000000000000000000) (tuple2!19039 Unit!16095 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352078) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5734 (buf!5348 (_2!10223 lt!351503))) (bvadd (currentByte!10018 (_2!10223 lt!351503)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352081)))))))) (tuple2!19039 Unit!16096 lt!352078))) (BitStream!8711 (buf!5348 (_2!10223 lt!351503)) (bvadd (currentByte!10018 (_2!10223 lt!351503)) #b00000000000000000000000000000001) (currentBit!10013 (_2!10223 lt!351503)))))))

(declare-fun b!223113 () Bool)

(declare-fun e!151815 () Bool)

(assert (=> b!223113 (= e!151816 e!151815)))

(declare-fun res!187306 () Bool)

(assert (=> b!223113 (=> (not res!187306) (not e!151815))))

(declare-fun lt!352080 () tuple2!19028)

(assert (=> b!223113 (= res!187306 (= (buf!5348 (_2!10223 lt!352080)) (buf!5348 (_2!10223 lt!351503))))))

(declare-fun lt!352082 () (_ BitVec 8))

(declare-fun lt!352083 () (_ BitVec 8))

(declare-fun Unit!16097 () Unit!16045)

(declare-fun Unit!16098 () Unit!16045)

(assert (=> b!223113 (= lt!352080 (tuple2!19029 (_2!10231 (ite (bvsgt ((_ sign_extend 24) lt!352082) #b00000000000000000000000000000000) (tuple2!19039 Unit!16097 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!352083) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5734 (buf!5348 (_2!10223 lt!351503))) (bvadd (currentByte!10018 (_2!10223 lt!351503)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!352082)))))))) (tuple2!19039 Unit!16098 lt!352083))) (BitStream!8711 (buf!5348 (_2!10223 lt!351503)) (bvadd (currentByte!10018 (_2!10223 lt!351503)) #b00000000000000000000000000000001) (currentBit!10013 (_2!10223 lt!351503)))))))

(assert (=> b!223113 (= lt!352083 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5734 (buf!5348 (_2!10223 lt!351503))) (currentByte!10018 (_2!10223 lt!351503)))) ((_ sign_extend 24) lt!352082))))))

(assert (=> b!223113 (= lt!352082 ((_ extract 7 0) (currentBit!10013 (_2!10223 lt!351503))))))

(declare-fun b!223114 () Bool)

(declare-fun lt!352079 () (_ BitVec 64))

(declare-fun lt!352084 () (_ BitVec 64))

(assert (=> b!223114 (= e!151815 (= (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!352080))) (currentByte!10018 (_2!10223 lt!352080)) (currentBit!10013 (_2!10223 lt!352080))) (bvadd lt!352084 lt!352079)))))

(assert (=> b!223114 (or (not (= (bvand lt!352084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352079 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352084 lt!352079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223114 (= lt!352079 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223114 (= lt!352084 (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351503))) (currentByte!10018 (_2!10223 lt!351503)) (currentBit!10013 (_2!10223 lt!351503))))))

(assert (= (and d!75506 res!187307) b!223113))

(assert (= (and b!223113 res!187306) b!223114))

(declare-fun m!341597 () Bool)

(assert (=> d!75506 m!341597))

(declare-fun m!341599 () Bool)

(assert (=> d!75506 m!341599))

(declare-fun m!341601 () Bool)

(assert (=> d!75506 m!341601))

(assert (=> b!223113 m!341601))

(assert (=> b!223113 m!341597))

(declare-fun m!341603 () Bool)

(assert (=> b!223114 m!341603))

(assert (=> b!223114 m!341325))

(assert (=> b!223012 d!75506))

(declare-fun d!75508 () Bool)

(declare-fun e!151817 () Bool)

(assert (=> d!75508 e!151817))

(declare-fun res!187308 () Bool)

(assert (=> d!75508 (=> (not res!187308) (not e!151817))))

(declare-fun lt!352090 () (_ BitVec 64))

(declare-fun lt!352087 () (_ BitVec 64))

(declare-fun lt!352089 () (_ BitVec 64))

(assert (=> d!75508 (= res!187308 (= lt!352089 (bvsub lt!352090 lt!352087)))))

(assert (=> d!75508 (or (= (bvand lt!352090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352090 lt!352087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75508 (= lt!352087 (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10224 lt!351667)))) ((_ sign_extend 32) (currentByte!10018 (_2!10224 lt!351667))) ((_ sign_extend 32) (currentBit!10013 (_2!10224 lt!351667)))))))

(declare-fun lt!352088 () (_ BitVec 64))

(declare-fun lt!352085 () (_ BitVec 64))

(assert (=> d!75508 (= lt!352090 (bvmul lt!352088 lt!352085))))

(assert (=> d!75508 (or (= lt!352088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352085 (bvsdiv (bvmul lt!352088 lt!352085) lt!352088)))))

(assert (=> d!75508 (= lt!352085 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75508 (= lt!352088 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10224 lt!351667)))))))

(assert (=> d!75508 (= lt!352089 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10018 (_2!10224 lt!351667))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10013 (_2!10224 lt!351667)))))))

(assert (=> d!75508 (invariant!0 (currentBit!10013 (_2!10224 lt!351667)) (currentByte!10018 (_2!10224 lt!351667)) (size!4804 (buf!5348 (_2!10224 lt!351667))))))

(assert (=> d!75508 (= (bitIndex!0 (size!4804 (buf!5348 (_2!10224 lt!351667))) (currentByte!10018 (_2!10224 lt!351667)) (currentBit!10013 (_2!10224 lt!351667))) lt!352089)))

(declare-fun b!223115 () Bool)

(declare-fun res!187309 () Bool)

(assert (=> b!223115 (=> (not res!187309) (not e!151817))))

(assert (=> b!223115 (= res!187309 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352089))))

(declare-fun b!223116 () Bool)

(declare-fun lt!352086 () (_ BitVec 64))

(assert (=> b!223116 (= e!151817 (bvsle lt!352089 (bvmul lt!352086 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223116 (or (= lt!352086 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352086 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352086)))))

(assert (=> b!223116 (= lt!352086 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10224 lt!351667)))))))

(assert (= (and d!75508 res!187308) b!223115))

(assert (= (and b!223115 res!187309) b!223116))

(declare-fun m!341605 () Bool)

(assert (=> d!75508 m!341605))

(declare-fun m!341607 () Bool)

(assert (=> d!75508 m!341607))

(assert (=> b!223012 d!75508))

(declare-fun d!75510 () Bool)

(declare-fun e!151820 () Bool)

(assert (=> d!75510 e!151820))

(declare-fun res!187312 () Bool)

(assert (=> d!75510 (=> (not res!187312) (not e!151820))))

(assert (=> d!75510 (= res!187312 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))))

(declare-fun lt!352093 () Unit!16045)

(declare-fun choose!266 (array!10944 (_ BitVec 32) (_ BitVec 8)) Unit!16045)

(assert (=> d!75510 (= lt!352093 (choose!266 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)))))

(assert (=> d!75510 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))))))

(assert (=> d!75510 (= (arrayUpdatedAtPrefixLemma!296 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)) lt!352093)))

(declare-fun b!223119 () Bool)

(assert (=> b!223119 (= e!151820 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (array!10945 (store (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75510 res!187312) b!223119))

(declare-fun m!341609 () Bool)

(assert (=> d!75510 m!341609))

(assert (=> b!223119 m!341313))

(declare-fun m!341611 () Bool)

(assert (=> b!223119 m!341611))

(assert (=> b!223012 d!75510))

(declare-fun d!75512 () Bool)

(assert (=> d!75512 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351647)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351647))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351647))) (bvsub lt!351661 ((_ extract 31 0) (bvsdiv (bvadd lt!351670 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))) (bvsle ((_ sign_extend 32) (bvsub lt!351661 ((_ extract 31 0) (bvsdiv (bvadd lt!351670 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351647)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351647))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351647)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18428 () Bool)

(assert (= bs!18428 d!75512))

(declare-fun m!341613 () Bool)

(assert (=> bs!18428 m!341613))

(assert (=> b!223012 d!75512))

(declare-fun d!75514 () Bool)

(assert (=> d!75514 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4804 lt!351676)) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4804 (_3!709 lt!351667))) (= (select (arr!5734 lt!351676) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5734 (_3!709 lt!351667)) (bvadd #b00000000000000000000000000000001 i!761))))))

(declare-fun lt!352096 () Unit!16045)

(declare-fun choose!267 (array!10944 array!10944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16045)

(assert (=> d!75514 (= lt!352096 (choose!267 lt!351676 (_3!709 lt!351667) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75514 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75514 (= (arrayRangesEqImpliesEq!65 lt!351676 (_3!709 lt!351667) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) lt!352096)))

(declare-fun bs!18429 () Bool)

(assert (= bs!18429 d!75514))

(declare-fun m!341615 () Bool)

(assert (=> bs!18429 m!341615))

(assert (=> bs!18429 m!341311))

(declare-fun m!341617 () Bool)

(assert (=> bs!18429 m!341617))

(assert (=> b!223012 d!75514))

(declare-fun d!75516 () Bool)

(declare-fun e!151821 () Bool)

(assert (=> d!75516 e!151821))

(declare-fun res!187313 () Bool)

(assert (=> d!75516 (=> (not res!187313) (not e!151821))))

(declare-fun lt!352101 () (_ BitVec 64))

(declare-fun lt!352099 () (_ BitVec 64))

(declare-fun lt!352102 () (_ BitVec 64))

(assert (=> d!75516 (= res!187313 (= lt!352101 (bvsub lt!352102 lt!352099)))))

(assert (=> d!75516 (or (= (bvand lt!352102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352099 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352102 lt!352099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75516 (= lt!352099 (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503)))))))

(declare-fun lt!352100 () (_ BitVec 64))

(declare-fun lt!352097 () (_ BitVec 64))

(assert (=> d!75516 (= lt!352102 (bvmul lt!352100 lt!352097))))

(assert (=> d!75516 (or (= lt!352100 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352097 (bvsdiv (bvmul lt!352100 lt!352097) lt!352100)))))

(assert (=> d!75516 (= lt!352097 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75516 (= lt!352100 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))))))

(assert (=> d!75516 (= lt!352101 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503)))))))

(assert (=> d!75516 (invariant!0 (currentBit!10013 (_2!10223 lt!351503)) (currentByte!10018 (_2!10223 lt!351503)) (size!4804 (buf!5348 (_2!10223 lt!351503))))))

(assert (=> d!75516 (= (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351503))) (currentByte!10018 (_2!10223 lt!351503)) (currentBit!10013 (_2!10223 lt!351503))) lt!352101)))

(declare-fun b!223120 () Bool)

(declare-fun res!187314 () Bool)

(assert (=> b!223120 (=> (not res!187314) (not e!151821))))

(assert (=> b!223120 (= res!187314 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352101))))

(declare-fun b!223121 () Bool)

(declare-fun lt!352098 () (_ BitVec 64))

(assert (=> b!223121 (= e!151821 (bvsle lt!352101 (bvmul lt!352098 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223121 (or (= lt!352098 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352098 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352098)))))

(assert (=> b!223121 (= lt!352098 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))))))

(assert (= (and d!75516 res!187313) b!223120))

(assert (= (and b!223120 res!187314) b!223121))

(assert (=> d!75516 m!341407))

(assert (=> d!75516 m!341209))

(assert (=> b!223012 d!75516))

(declare-fun b!223122 () Bool)

(declare-fun e!151822 () Bool)

(declare-fun lt!352126 () tuple3!1134)

(assert (=> b!223122 (= e!151822 (= (select (arr!5734 (_3!709 lt!352126)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (_2!10229 (readBytePure!0 (_2!10223 lt!351647)))))))

(assert (=> b!223122 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (size!4804 (_3!709 lt!352126))))))

(declare-fun lt!352125 () tuple3!1134)

(declare-fun c!11075 () Bool)

(declare-fun call!3442 () Bool)

(declare-fun bm!3439 () Bool)

(assert (=> bm!3439 (= call!3442 (arrayRangesEq!704 lt!351676 (ite c!11075 (_3!709 lt!352125) lt!351676) #b00000000000000000000000000000000 (ite c!11075 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (size!4804 lt!351676))))))

(declare-fun d!75518 () Bool)

(assert (=> d!75518 e!151822))

(declare-fun res!187315 () Bool)

(assert (=> d!75518 (=> res!187315 e!151822)))

(assert (=> d!75518 (= res!187315 (bvsge (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun lt!352138 () Bool)

(declare-fun e!151823 () Bool)

(assert (=> d!75518 (= lt!352138 e!151823)))

(declare-fun res!187317 () Bool)

(assert (=> d!75518 (=> (not res!187317) (not e!151823))))

(declare-fun lt!352133 () (_ BitVec 64))

(declare-fun lt!352121 () (_ BitVec 64))

(assert (=> d!75518 (= res!187317 (= (bvadd lt!352121 lt!352133) (bitIndex!0 (size!4804 (buf!5348 (_2!10224 lt!352126))) (currentByte!10018 (_2!10224 lt!352126)) (currentBit!10013 (_2!10224 lt!352126)))))))

(assert (=> d!75518 (or (not (= (bvand lt!352121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352133 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!352121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!352121 lt!352133) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!352116 () (_ BitVec 64))

(assert (=> d!75518 (= lt!352133 (bvmul lt!352116 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75518 (or (= lt!352116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352116)))))

(assert (=> d!75518 (= lt!352116 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))))

(assert (=> d!75518 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> d!75518 (= lt!352121 (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351647))) (currentByte!10018 (_2!10223 lt!351647)) (currentBit!10013 (_2!10223 lt!351647))))))

(declare-fun e!151824 () tuple3!1134)

(assert (=> d!75518 (= lt!352126 e!151824)))

(assert (=> d!75518 (= c!11075 (bvslt (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> d!75518 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496) (bvsle to!496 (size!4804 lt!351676)))))

(assert (=> d!75518 (= (readByteArrayLoop!0 (_2!10223 lt!351647) lt!351676 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496) lt!352126)))

(declare-fun b!223123 () Bool)

(declare-fun lt!352124 () Unit!16045)

(assert (=> b!223123 (= e!151824 (tuple3!1135 lt!352124 (_2!10223 lt!351647) lt!351676))))

(declare-fun call!3444 () (_ BitVec 64))

(assert (=> b!223123 (= call!3444 call!3444)))

(declare-fun lt!352122 () Unit!16045)

(declare-fun Unit!16099 () Unit!16045)

(assert (=> b!223123 (= lt!352122 Unit!16099)))

(declare-fun lt!352114 () Unit!16045)

(assert (=> b!223123 (= lt!352114 (arrayRangesEqReflexiveLemma!56 lt!351676))))

(assert (=> b!223123 call!3442))

(declare-fun lt!352111 () Unit!16045)

(assert (=> b!223123 (= lt!352111 lt!352114)))

(declare-fun lt!352110 () array!10944)

(assert (=> b!223123 (= lt!352110 lt!351676)))

(declare-fun lt!352112 () array!10944)

(assert (=> b!223123 (= lt!352112 lt!351676)))

(declare-fun lt!352127 () (_ BitVec 32))

(assert (=> b!223123 (= lt!352127 #b00000000000000000000000000000000)))

(declare-fun lt!352120 () (_ BitVec 32))

(assert (=> b!223123 (= lt!352120 (size!4804 lt!351676))))

(declare-fun lt!352131 () (_ BitVec 32))

(assert (=> b!223123 (= lt!352131 #b00000000000000000000000000000000)))

(declare-fun lt!352117 () (_ BitVec 32))

(assert (=> b!223123 (= lt!352117 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))

(assert (=> b!223123 (= lt!352124 (arrayRangesEqSlicedLemma!56 lt!352110 lt!352112 lt!352127 lt!352120 lt!352131 lt!352117))))

(declare-fun call!3443 () Bool)

(assert (=> b!223123 call!3443))

(declare-fun b!223124 () Bool)

(declare-fun lt!352113 () Unit!16045)

(assert (=> b!223124 (= e!151824 (tuple3!1135 lt!352113 (_2!10224 lt!352125) (_3!709 lt!352125)))))

(declare-fun lt!352105 () tuple2!19028)

(assert (=> b!223124 (= lt!352105 (readByte!0 (_2!10223 lt!351647)))))

(declare-fun lt!352134 () array!10944)

(assert (=> b!223124 (= lt!352134 (array!10945 (store (arr!5734 lt!351676) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10223 lt!352105)) (size!4804 lt!351676)))))

(declare-fun lt!352128 () (_ BitVec 64))

(assert (=> b!223124 (= lt!352128 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!352119 () (_ BitVec 32))

(assert (=> b!223124 (= lt!352119 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun lt!352104 () Unit!16045)

(assert (=> b!223124 (= lt!352104 (validateOffsetBytesFromBitIndexLemma!0 (_2!10223 lt!351647) (_2!10223 lt!352105) lt!352128 lt!352119))))

(assert (=> b!223124 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!352105)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!352105))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!352105))) (bvsub lt!352119 ((_ extract 31 0) (bvsdiv (bvadd lt!352128 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!352115 () Unit!16045)

(assert (=> b!223124 (= lt!352115 lt!352104)))

(assert (=> b!223124 (= lt!352125 (readByteArrayLoop!0 (_2!10223 lt!352105) lt!352134 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223124 (= call!3444 (bvadd (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351647))) (currentByte!10018 (_2!10223 lt!351647)) (currentBit!10013 (_2!10223 lt!351647))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!352130 () Unit!16045)

(declare-fun Unit!16100 () Unit!16045)

(assert (=> b!223124 (= lt!352130 Unit!16100)))

(assert (=> b!223124 (= (bvadd call!3444 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4804 (buf!5348 (_2!10224 lt!352125))) (currentByte!10018 (_2!10224 lt!352125)) (currentBit!10013 (_2!10224 lt!352125))))))

(declare-fun lt!352109 () Unit!16045)

(declare-fun Unit!16101 () Unit!16045)

(assert (=> b!223124 (= lt!352109 Unit!16101)))

(assert (=> b!223124 (= (bvadd (bitIndex!0 (size!4804 (buf!5348 (_2!10223 lt!351647))) (currentByte!10018 (_2!10223 lt!351647)) (currentBit!10013 (_2!10223 lt!351647))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4804 (buf!5348 (_2!10224 lt!352125))) (currentByte!10018 (_2!10224 lt!352125)) (currentBit!10013 (_2!10224 lt!352125))))))

(declare-fun lt!352107 () Unit!16045)

(declare-fun Unit!16102 () Unit!16045)

(assert (=> b!223124 (= lt!352107 Unit!16102)))

(assert (=> b!223124 (and (= (buf!5348 (_2!10223 lt!351647)) (buf!5348 (_2!10224 lt!352125))) (= (size!4804 lt!351676) (size!4804 (_3!709 lt!352125))))))

(declare-fun lt!352132 () Unit!16045)

(declare-fun Unit!16103 () Unit!16045)

(assert (=> b!223124 (= lt!352132 Unit!16103)))

(declare-fun lt!352136 () Unit!16045)

(assert (=> b!223124 (= lt!352136 (arrayUpdatedAtPrefixLemma!296 lt!351676 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10223 lt!352105)))))

(assert (=> b!223124 call!3443))

(declare-fun lt!352129 () Unit!16045)

(assert (=> b!223124 (= lt!352129 lt!352136)))

(declare-fun lt!352135 () (_ BitVec 32))

(assert (=> b!223124 (= lt!352135 #b00000000000000000000000000000000)))

(declare-fun lt!352118 () Unit!16045)

(assert (=> b!223124 (= lt!352118 (arrayRangesEqTransitive!190 lt!351676 lt!352134 (_3!709 lt!352125) lt!352135 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!223124 (arrayRangesEq!704 lt!351676 (_3!709 lt!352125) lt!352135 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001))))

(declare-fun lt!352106 () Unit!16045)

(assert (=> b!223124 (= lt!352106 lt!352118)))

(assert (=> b!223124 call!3442))

(declare-fun lt!352108 () Unit!16045)

(declare-fun Unit!16104 () Unit!16045)

(assert (=> b!223124 (= lt!352108 Unit!16104)))

(declare-fun lt!352137 () Unit!16045)

(assert (=> b!223124 (= lt!352137 (arrayRangesEqImpliesEq!65 lt!352134 (_3!709 lt!352125) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!223124 (= (select (store (arr!5734 lt!351676) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10223 lt!352105)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (select (arr!5734 (_3!709 lt!352125)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun lt!352103 () Unit!16045)

(assert (=> b!223124 (= lt!352103 lt!352137)))

(declare-fun lt!352123 () Bool)

(assert (=> b!223124 (= lt!352123 (= (select (arr!5734 (_3!709 lt!352125)) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) (_1!10223 lt!352105)))))

(declare-fun Unit!16105 () Unit!16045)

(assert (=> b!223124 (= lt!352113 Unit!16105)))

(assert (=> b!223124 lt!352123))

(declare-fun b!223125 () Bool)

(declare-fun res!187316 () Bool)

(assert (=> b!223125 (=> (not res!187316) (not e!151823))))

(assert (=> b!223125 (= res!187316 (and (= (buf!5348 (_2!10223 lt!351647)) (buf!5348 (_2!10224 lt!352126))) (= (size!4804 lt!351676) (size!4804 (_3!709 lt!352126)))))))

(declare-fun b!223126 () Bool)

(assert (=> b!223126 (= e!151823 (arrayRangesEq!704 lt!351676 (_3!709 lt!352126) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun bm!3440 () Bool)

(assert (=> bm!3440 (= call!3443 (arrayRangesEq!704 (ite c!11075 lt!351676 lt!352110) (ite c!11075 (array!10945 (store (arr!5734 lt!351676) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) (_1!10223 lt!352105)) (size!4804 lt!351676)) lt!352112) (ite c!11075 #b00000000000000000000000000000000 lt!352131) (ite c!11075 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) lt!352117)))))

(declare-fun bm!3441 () Bool)

(assert (=> bm!3441 (= call!3444 (bitIndex!0 (ite c!11075 (size!4804 (buf!5348 (_2!10223 lt!352105))) (size!4804 (buf!5348 (_2!10223 lt!351647)))) (ite c!11075 (currentByte!10018 (_2!10223 lt!352105)) (currentByte!10018 (_2!10223 lt!351647))) (ite c!11075 (currentBit!10013 (_2!10223 lt!352105)) (currentBit!10013 (_2!10223 lt!351647)))))))

(assert (= (and d!75518 c!11075) b!223124))

(assert (= (and d!75518 (not c!11075)) b!223123))

(assert (= (or b!223124 b!223123) bm!3440))

(assert (= (or b!223124 b!223123) bm!3439))

(assert (= (or b!223124 b!223123) bm!3441))

(assert (= (and d!75518 res!187317) b!223125))

(assert (= (and b!223125 res!187316) b!223126))

(assert (= (and d!75518 (not res!187315)) b!223122))

(declare-fun m!341619 () Bool)

(assert (=> b!223124 m!341619))

(declare-fun m!341621 () Bool)

(assert (=> b!223124 m!341621))

(declare-fun m!341623 () Bool)

(assert (=> b!223124 m!341623))

(declare-fun m!341625 () Bool)

(assert (=> b!223124 m!341625))

(declare-fun m!341627 () Bool)

(assert (=> b!223124 m!341627))

(declare-fun m!341629 () Bool)

(assert (=> b!223124 m!341629))

(declare-fun m!341631 () Bool)

(assert (=> b!223124 m!341631))

(declare-fun m!341633 () Bool)

(assert (=> b!223124 m!341633))

(declare-fun m!341635 () Bool)

(assert (=> b!223124 m!341635))

(declare-fun m!341637 () Bool)

(assert (=> b!223124 m!341637))

(declare-fun m!341639 () Bool)

(assert (=> b!223124 m!341639))

(declare-fun m!341641 () Bool)

(assert (=> b!223124 m!341641))

(declare-fun m!341643 () Bool)

(assert (=> b!223124 m!341643))

(declare-fun m!341645 () Bool)

(assert (=> bm!3439 m!341645))

(declare-fun m!341647 () Bool)

(assert (=> bm!3441 m!341647))

(declare-fun m!341649 () Bool)

(assert (=> d!75518 m!341649))

(assert (=> d!75518 m!341643))

(assert (=> bm!3440 m!341631))

(declare-fun m!341651 () Bool)

(assert (=> bm!3440 m!341651))

(declare-fun m!341653 () Bool)

(assert (=> b!223126 m!341653))

(declare-fun m!341655 () Bool)

(assert (=> b!223123 m!341655))

(declare-fun m!341657 () Bool)

(assert (=> b!223123 m!341657))

(declare-fun m!341659 () Bool)

(assert (=> b!223122 m!341659))

(declare-fun m!341661 () Bool)

(assert (=> b!223122 m!341661))

(assert (=> b!223012 d!75518))

(declare-fun d!75520 () Bool)

(assert (=> d!75520 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (_3!709 lt!351667) lt!351677 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!352141 () Unit!16045)

(declare-fun choose!268 (array!10944 array!10944 array!10944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16045)

(assert (=> d!75520 (= lt!352141 (choose!268 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) lt!351676 (_3!709 lt!351667) lt!351677 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75520 (and (bvsle #b00000000000000000000000000000000 lt!351677) (bvsle lt!351677 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> d!75520 (= (arrayRangesEqTransitive!190 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) lt!351676 (_3!709 lt!351667) lt!351677 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)) lt!352141)))

(declare-fun bs!18430 () Bool)

(assert (= bs!18430 d!75520))

(assert (=> bs!18430 m!341321))

(declare-fun m!341663 () Bool)

(assert (=> bs!18430 m!341663))

(assert (=> b!223012 d!75520))

(declare-fun d!75522 () Bool)

(assert (=> d!75522 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) #b00000000000000000000000000000000 (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))

(declare-fun lt!352144 () Unit!16045)

(declare-fun choose!269 (array!10944) Unit!16045)

(assert (=> d!75522 (= lt!352144 (choose!269 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))))))

(assert (=> d!75522 (= (arrayRangesEqReflexiveLemma!56 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) lt!352144)))

(declare-fun bs!18431 () Bool)

(assert (= bs!18431 d!75522))

(declare-fun m!341665 () Bool)

(assert (=> bs!18431 m!341665))

(declare-fun m!341667 () Bool)

(assert (=> bs!18431 m!341667))

(assert (=> b!223011 d!75522))

(declare-fun d!75524 () Bool)

(assert (=> d!75524 (arrayRangesEq!704 lt!351652 lt!351654 lt!351673 lt!351659)))

(declare-fun lt!352147 () Unit!16045)

(declare-fun choose!270 (array!10944 array!10944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16045)

(assert (=> d!75524 (= lt!352147 (choose!270 lt!351652 lt!351654 lt!351669 lt!351662 lt!351673 lt!351659))))

(assert (=> d!75524 (and (bvsle #b00000000000000000000000000000000 lt!351669) (bvsle lt!351669 lt!351662))))

(assert (=> d!75524 (= (arrayRangesEqSlicedLemma!56 lt!351652 lt!351654 lt!351669 lt!351662 lt!351673 lt!351659) lt!352147)))

(declare-fun bs!18432 () Bool)

(assert (= bs!18432 d!75524))

(declare-fun m!341669 () Bool)

(assert (=> bs!18432 m!341669))

(declare-fun m!341671 () Bool)

(assert (=> bs!18432 m!341671))

(assert (=> b!223011 d!75524))

(declare-fun d!75526 () Bool)

(assert (=> d!75526 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503))) (bvsub (bvsub to!496 i!761) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!75526 true))

(declare-fun _$7!127 () Unit!16045)

(assert (=> d!75526 (= (choose!57 thiss!1870 (_2!10223 lt!351503) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) _$7!127)))

(declare-fun bs!18433 () Bool)

(assert (= bs!18433 d!75526))

(declare-fun m!341673 () Bool)

(assert (=> bs!18433 m!341673))

(assert (=> d!75418 d!75526))

(declare-fun d!75528 () Bool)

(declare-fun res!187318 () Bool)

(declare-fun e!151825 () Bool)

(assert (=> d!75528 (=> res!187318 e!151825)))

(assert (=> d!75528 (= res!187318 (= (ite c!11067 #b00000000000000000000000000000000 lt!351673) (ite c!11067 (bvadd #b00000000000000000000000000000001 i!761) lt!351659)))))

(assert (=> d!75528 (= (arrayRangesEq!704 (ite c!11067 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) lt!351652) (ite c!11067 (array!10945 (store (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))) lt!351654) (ite c!11067 #b00000000000000000000000000000000 lt!351673) (ite c!11067 (bvadd #b00000000000000000000000000000001 i!761) lt!351659)) e!151825)))

(declare-fun b!223127 () Bool)

(declare-fun e!151826 () Bool)

(assert (=> b!223127 (= e!151825 e!151826)))

(declare-fun res!187319 () Bool)

(assert (=> b!223127 (=> (not res!187319) (not e!151826))))

(assert (=> b!223127 (= res!187319 (= (select (arr!5734 (ite c!11067 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) lt!351652)) (ite c!11067 #b00000000000000000000000000000000 lt!351673)) (select (arr!5734 (ite c!11067 (array!10945 (store (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))) lt!351654)) (ite c!11067 #b00000000000000000000000000000000 lt!351673))))))

(declare-fun b!223128 () Bool)

(assert (=> b!223128 (= e!151826 (arrayRangesEq!704 (ite c!11067 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) lt!351652) (ite c!11067 (array!10945 (store (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10223 lt!351647)) (size!4804 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)))) lt!351654) (bvadd (ite c!11067 #b00000000000000000000000000000000 lt!351673) #b00000000000000000000000000000001) (ite c!11067 (bvadd #b00000000000000000000000000000001 i!761) lt!351659)))))

(assert (= (and d!75528 (not res!187318)) b!223127))

(assert (= (and b!223127 res!187319) b!223128))

(declare-fun m!341675 () Bool)

(assert (=> b!223127 m!341675))

(declare-fun m!341677 () Bool)

(assert (=> b!223127 m!341677))

(declare-fun m!341679 () Bool)

(assert (=> b!223128 m!341679))

(assert (=> bm!3416 d!75528))

(declare-fun d!75530 () Bool)

(assert (=> d!75530 (= (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503)))) (bvsub (bvmul ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503))))))))

(assert (=> d!75429 d!75530))

(declare-fun d!75532 () Bool)

(assert (=> d!75532 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503))) (bvsub (bvsub to!496 i!761) lt!351817)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!496 i!761) lt!351817)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10223 lt!351503)))) ((_ sign_extend 32) (currentByte!10018 (_2!10223 lt!351503))) ((_ sign_extend 32) (currentBit!10013 (_2!10223 lt!351503)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18434 () Bool)

(assert (= bs!18434 d!75532))

(assert (=> bs!18434 m!341407))

(assert (=> b!223038 d!75532))

(declare-fun d!75534 () Bool)

(declare-fun res!187320 () Bool)

(declare-fun e!151827 () Bool)

(assert (=> d!75534 (=> res!187320 e!151827)))

(assert (=> d!75534 (= res!187320 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> d!75534 (= (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (_3!709 lt!351668) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) e!151827)))

(declare-fun b!223129 () Bool)

(declare-fun e!151828 () Bool)

(assert (=> b!223129 (= e!151827 e!151828)))

(declare-fun res!187321 () Bool)

(assert (=> b!223129 (=> (not res!187321) (not e!151828))))

(assert (=> b!223129 (= res!187321 (= (select (arr!5734 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308))) #b00000000000000000000000000000000) (select (arr!5734 (_3!709 lt!351668)) #b00000000000000000000000000000000)))))

(declare-fun b!223130 () Bool)

(assert (=> b!223130 (= e!151828 (arrayRangesEq!704 (array!10945 (store (arr!5734 arr!308) i!761 (_1!10223 lt!351503)) (size!4804 arr!308)) (_3!709 lt!351668) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (= (and d!75534 (not res!187320)) b!223129))

(assert (= (and b!223129 res!187321) b!223130))

(assert (=> b!223129 m!341577))

(declare-fun m!341681 () Bool)

(assert (=> b!223129 m!341681))

(declare-fun m!341683 () Bool)

(assert (=> b!223130 m!341683))

(assert (=> b!223014 d!75534))

(declare-fun d!75536 () Bool)

(assert (=> d!75536 (= (invariant!0 (currentBit!10013 thiss!1870) (currentByte!10018 thiss!1870) (size!4804 (buf!5348 thiss!1870))) (and (bvsge (currentBit!10013 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10013 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10018 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10018 thiss!1870) (size!4804 (buf!5348 thiss!1870))) (and (= (currentBit!10013 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10018 thiss!1870) (size!4804 (buf!5348 thiss!1870)))))))))

(assert (=> d!75391 d!75536))

(declare-fun d!75538 () Bool)

(declare-fun e!151829 () Bool)

(assert (=> d!75538 e!151829))

(declare-fun res!187322 () Bool)

(assert (=> d!75538 (=> (not res!187322) (not e!151829))))

(declare-fun lt!352150 () (_ BitVec 64))

(declare-fun lt!352152 () (_ BitVec 64))

(declare-fun lt!352153 () (_ BitVec 64))

(assert (=> d!75538 (= res!187322 (= lt!352152 (bvsub lt!352153 lt!352150)))))

(assert (=> d!75538 (or (= (bvand lt!352153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352153 lt!352150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75538 (= lt!352150 (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10224 lt!351668)))) ((_ sign_extend 32) (currentByte!10018 (_2!10224 lt!351668))) ((_ sign_extend 32) (currentBit!10013 (_2!10224 lt!351668)))))))

(declare-fun lt!352151 () (_ BitVec 64))

(declare-fun lt!352148 () (_ BitVec 64))

(assert (=> d!75538 (= lt!352153 (bvmul lt!352151 lt!352148))))

(assert (=> d!75538 (or (= lt!352151 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352148 (bvsdiv (bvmul lt!352151 lt!352148) lt!352151)))))

(assert (=> d!75538 (= lt!352148 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75538 (= lt!352151 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10224 lt!351668)))))))

(assert (=> d!75538 (= lt!352152 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10018 (_2!10224 lt!351668))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10013 (_2!10224 lt!351668)))))))

(assert (=> d!75538 (invariant!0 (currentBit!10013 (_2!10224 lt!351668)) (currentByte!10018 (_2!10224 lt!351668)) (size!4804 (buf!5348 (_2!10224 lt!351668))))))

(assert (=> d!75538 (= (bitIndex!0 (size!4804 (buf!5348 (_2!10224 lt!351668))) (currentByte!10018 (_2!10224 lt!351668)) (currentBit!10013 (_2!10224 lt!351668))) lt!352152)))

(declare-fun b!223131 () Bool)

(declare-fun res!187323 () Bool)

(assert (=> b!223131 (=> (not res!187323) (not e!151829))))

(assert (=> b!223131 (= res!187323 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352152))))

(declare-fun b!223132 () Bool)

(declare-fun lt!352149 () (_ BitVec 64))

(assert (=> b!223132 (= e!151829 (bvsle lt!352152 (bvmul lt!352149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223132 (or (= lt!352149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352149)))))

(assert (=> b!223132 (= lt!352149 ((_ sign_extend 32) (size!4804 (buf!5348 (_2!10224 lt!351668)))))))

(assert (= (and d!75538 res!187322) b!223131))

(assert (= (and b!223131 res!187323) b!223132))

(declare-fun m!341685 () Bool)

(assert (=> d!75538 m!341685))

(declare-fun m!341687 () Bool)

(assert (=> d!75538 m!341687))

(assert (=> d!75395 d!75538))

(assert (=> d!75395 d!75516))

(declare-fun d!75540 () Bool)

(assert (=> d!75540 (= (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) ((_ sign_extend 32) (currentByte!10018 thiss!1870)) ((_ sign_extend 32) (currentBit!10013 thiss!1870))) (bvsub (bvmul ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!10018 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10013 thiss!1870)))))))

(assert (=> d!75385 d!75540))

(declare-fun d!75542 () Bool)

(assert (=> d!75542 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) ((_ sign_extend 32) (currentByte!10018 thiss!1870)) ((_ sign_extend 32) (currentBit!10013 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4804 (buf!5348 thiss!1870))) ((_ sign_extend 32) (currentByte!10018 thiss!1870)) ((_ sign_extend 32) (currentBit!10013 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!18435 () Bool)

(assert (= bs!18435 d!75542))

(assert (=> bs!18435 m!341269))

(assert (=> d!75416 d!75542))

(declare-fun d!75544 () Bool)

(declare-fun e!151830 () Bool)

(assert (=> d!75544 e!151830))

(declare-fun res!187324 () Bool)

(assert (=> d!75544 (=> (not res!187324) (not e!151830))))

(declare-fun lt!352156 () (_ BitVec 64))

(declare-fun lt!352159 () (_ BitVec 64))

(declare-fun lt!352158 () (_ BitVec 64))

(assert (=> d!75544 (= res!187324 (= lt!352158 (bvsub lt!352159 lt!352156)))))

(assert (=> d!75544 (or (= (bvand lt!352159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!352156 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!352159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!352159 lt!352156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75544 (= lt!352156 (remainingBits!0 ((_ sign_extend 32) (ite c!11067 (size!4804 (buf!5348 (_2!10223 lt!351647))) (size!4804 (buf!5348 (_2!10223 lt!351503))))) ((_ sign_extend 32) (ite c!11067 (currentByte!10018 (_2!10223 lt!351647)) (currentByte!10018 (_2!10223 lt!351503)))) ((_ sign_extend 32) (ite c!11067 (currentBit!10013 (_2!10223 lt!351647)) (currentBit!10013 (_2!10223 lt!351503))))))))

(declare-fun lt!352157 () (_ BitVec 64))

(declare-fun lt!352154 () (_ BitVec 64))

(assert (=> d!75544 (= lt!352159 (bvmul lt!352157 lt!352154))))

(assert (=> d!75544 (or (= lt!352157 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!352154 (bvsdiv (bvmul lt!352157 lt!352154) lt!352157)))))

(assert (=> d!75544 (= lt!352154 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75544 (= lt!352157 ((_ sign_extend 32) (ite c!11067 (size!4804 (buf!5348 (_2!10223 lt!351647))) (size!4804 (buf!5348 (_2!10223 lt!351503))))))))

(assert (=> d!75544 (= lt!352158 (bvadd (bvmul ((_ sign_extend 32) (ite c!11067 (currentByte!10018 (_2!10223 lt!351647)) (currentByte!10018 (_2!10223 lt!351503)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite c!11067 (currentBit!10013 (_2!10223 lt!351647)) (currentBit!10013 (_2!10223 lt!351503))))))))

(assert (=> d!75544 (invariant!0 (ite c!11067 (currentBit!10013 (_2!10223 lt!351647)) (currentBit!10013 (_2!10223 lt!351503))) (ite c!11067 (currentByte!10018 (_2!10223 lt!351647)) (currentByte!10018 (_2!10223 lt!351503))) (ite c!11067 (size!4804 (buf!5348 (_2!10223 lt!351647))) (size!4804 (buf!5348 (_2!10223 lt!351503)))))))

(assert (=> d!75544 (= (bitIndex!0 (ite c!11067 (size!4804 (buf!5348 (_2!10223 lt!351647))) (size!4804 (buf!5348 (_2!10223 lt!351503)))) (ite c!11067 (currentByte!10018 (_2!10223 lt!351647)) (currentByte!10018 (_2!10223 lt!351503))) (ite c!11067 (currentBit!10013 (_2!10223 lt!351647)) (currentBit!10013 (_2!10223 lt!351503)))) lt!352158)))

(declare-fun b!223133 () Bool)

(declare-fun res!187325 () Bool)

(assert (=> b!223133 (=> (not res!187325) (not e!151830))))

(assert (=> b!223133 (= res!187325 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!352158))))

(declare-fun b!223134 () Bool)

(declare-fun lt!352155 () (_ BitVec 64))

(assert (=> b!223134 (= e!151830 (bvsle lt!352158 (bvmul lt!352155 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223134 (or (= lt!352155 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!352155 #b0000000000000000000000000000000000000000000000000000000000001000) lt!352155)))))

(assert (=> b!223134 (= lt!352155 ((_ sign_extend 32) (ite c!11067 (size!4804 (buf!5348 (_2!10223 lt!351647))) (size!4804 (buf!5348 (_2!10223 lt!351503))))))))

(assert (= (and d!75544 res!187324) b!223133))

(assert (= (and b!223133 res!187325) b!223134))

(declare-fun m!341689 () Bool)

(assert (=> d!75544 m!341689))

(declare-fun m!341691 () Bool)

(assert (=> d!75544 m!341691))

(assert (=> bm!3417 d!75544))

(push 1)

(assert (not b!223114))

(assert (not d!75504))

(assert (not b!223101))

(assert (not d!75526))

(assert (not b!223111))

(assert (not d!75520))

(assert (not d!75510))

(assert (not b!223124))

(assert (not d!75514))

(assert (not d!75542))

(assert (not bm!3441))

(assert (not d!75500))

(assert (not d!75538))

(assert (not d!75516))

(assert (not d!75518))

(assert (not d!75498))

(assert (not b!223130))

(assert (not d!75532))

(assert (not d!75506))

(assert (not b!223119))

(assert (not b!223126))

(assert (not d!75496))

(assert (not b!223122))

(assert (not d!75524))

(assert (not d!75522))

(assert (not d!75544))

(assert (not bm!3440))

(assert (not b!223123))

(assert (not d!75508))

(assert (not b!223128))

(assert (not b!223112))

(assert (not d!75512))

(assert (not bm!3439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

