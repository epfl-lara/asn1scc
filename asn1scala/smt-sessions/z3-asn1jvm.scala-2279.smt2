; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57770 () Bool)

(assert start!57770)

(declare-fun b!265078 () Bool)

(declare-fun e!185113 () Bool)

(declare-datatypes ((array!14770 0))(
  ( (array!14771 (arr!7430 (Array (_ BitVec 32) (_ BitVec 8))) (size!6443 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11700 0))(
  ( (BitStream!11701 (buf!6911 array!14770) (currentByte!12790 (_ BitVec 32)) (currentBit!12785 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11700)

(declare-fun array_inv!6167 (array!14770) Bool)

(assert (=> b!265078 (= e!185113 (array_inv!6167 (buf!6911 w1!584)))))

(declare-fun res!221557 () Bool)

(declare-fun e!185112 () Bool)

(assert (=> start!57770 (=> (not res!221557) (not e!185112))))

(declare-fun w2!580 () BitStream!11700)

(declare-fun isPrefixOf!0 (BitStream!11700 BitStream!11700) Bool)

(assert (=> start!57770 (= res!221557 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57770 e!185112))

(declare-fun inv!12 (BitStream!11700) Bool)

(assert (=> start!57770 (and (inv!12 w1!584) e!185113)))

(declare-fun e!185115 () Bool)

(assert (=> start!57770 (and (inv!12 w2!580) e!185115)))

(declare-fun b!265077 () Bool)

(declare-fun e!185110 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14770 array!14770 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265077 (= e!185110 (arrayBitRangesEq!0 (buf!6911 w1!584) (buf!6911 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584))))))

(declare-fun b!265076 () Bool)

(assert (=> b!265076 (= e!185112 (not e!185110))))

(declare-fun res!221556 () Bool)

(assert (=> b!265076 (=> res!221556 e!185110)))

(assert (=> b!265076 (= res!221556 (= (size!6443 (buf!6911 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265076 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18859 0))(
  ( (Unit!18860) )
))
(declare-fun lt!406223 () Unit!18859)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11700) Unit!18859)

(assert (=> b!265076 (= lt!406223 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406222 () BitStream!11700)

(assert (=> b!265076 (isPrefixOf!0 lt!406222 lt!406222)))

(declare-fun lt!406220 () Unit!18859)

(assert (=> b!265076 (= lt!406220 (lemmaIsPrefixRefl!0 lt!406222))))

(assert (=> b!265076 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406221 () Unit!18859)

(assert (=> b!265076 (= lt!406221 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265076 (= lt!406222 (BitStream!11701 (buf!6911 w2!580) (currentByte!12790 w1!584) (currentBit!12785 w1!584)))))

(declare-fun b!265079 () Bool)

(assert (=> b!265079 (= e!185115 (array_inv!6167 (buf!6911 w2!580)))))

(assert (= (and start!57770 res!221557) b!265076))

(assert (= (and b!265076 (not res!221556)) b!265077))

(assert (= start!57770 b!265078))

(assert (= start!57770 b!265079))

(declare-fun m!395737 () Bool)

(assert (=> b!265077 m!395737))

(assert (=> b!265077 m!395737))

(declare-fun m!395739 () Bool)

(assert (=> b!265077 m!395739))

(declare-fun m!395741 () Bool)

(assert (=> start!57770 m!395741))

(declare-fun m!395743 () Bool)

(assert (=> start!57770 m!395743))

(declare-fun m!395745 () Bool)

(assert (=> start!57770 m!395745))

(declare-fun m!395747 () Bool)

(assert (=> b!265079 m!395747))

(declare-fun m!395749 () Bool)

(assert (=> b!265076 m!395749))

(declare-fun m!395751 () Bool)

(assert (=> b!265076 m!395751))

(declare-fun m!395753 () Bool)

(assert (=> b!265076 m!395753))

(declare-fun m!395755 () Bool)

(assert (=> b!265076 m!395755))

(declare-fun m!395757 () Bool)

(assert (=> b!265076 m!395757))

(declare-fun m!395759 () Bool)

(assert (=> b!265076 m!395759))

(declare-fun m!395761 () Bool)

(assert (=> b!265078 m!395761))

(check-sat (not b!265079) (not b!265076) (not start!57770) (not b!265077) (not b!265078))
(check-sat)
(get-model)

(declare-fun d!89480 () Bool)

(assert (=> d!89480 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406238 () Unit!18859)

(declare-fun choose!11 (BitStream!11700) Unit!18859)

(assert (=> d!89480 (= lt!406238 (choose!11 w2!580))))

(assert (=> d!89480 (= (lemmaIsPrefixRefl!0 w2!580) lt!406238)))

(declare-fun bs!22708 () Bool)

(assert (= bs!22708 d!89480))

(assert (=> bs!22708 m!395757))

(declare-fun m!395789 () Bool)

(assert (=> bs!22708 m!395789))

(assert (=> b!265076 d!89480))

(declare-fun d!89484 () Bool)

(assert (=> d!89484 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406239 () Unit!18859)

(assert (=> d!89484 (= lt!406239 (choose!11 w1!584))))

(assert (=> d!89484 (= (lemmaIsPrefixRefl!0 w1!584) lt!406239)))

(declare-fun bs!22709 () Bool)

(assert (= bs!22709 d!89484))

(assert (=> bs!22709 m!395753))

(declare-fun m!395791 () Bool)

(assert (=> bs!22709 m!395791))

(assert (=> b!265076 d!89484))

(declare-fun d!89486 () Bool)

(declare-fun res!221588 () Bool)

(declare-fun e!185151 () Bool)

(assert (=> d!89486 (=> (not res!221588) (not e!185151))))

(assert (=> d!89486 (= res!221588 (= (size!6443 (buf!6911 lt!406222)) (size!6443 (buf!6911 lt!406222))))))

(assert (=> d!89486 (= (isPrefixOf!0 lt!406222 lt!406222) e!185151)))

(declare-fun b!265116 () Bool)

(declare-fun res!221589 () Bool)

(assert (=> b!265116 (=> (not res!221589) (not e!185151))))

(assert (=> b!265116 (= res!221589 (bvsle (bitIndex!0 (size!6443 (buf!6911 lt!406222)) (currentByte!12790 lt!406222) (currentBit!12785 lt!406222)) (bitIndex!0 (size!6443 (buf!6911 lt!406222)) (currentByte!12790 lt!406222) (currentBit!12785 lt!406222))))))

(declare-fun b!265117 () Bool)

(declare-fun e!185150 () Bool)

(assert (=> b!265117 (= e!185151 e!185150)))

(declare-fun res!221590 () Bool)

(assert (=> b!265117 (=> res!221590 e!185150)))

(assert (=> b!265117 (= res!221590 (= (size!6443 (buf!6911 lt!406222)) #b00000000000000000000000000000000))))

(declare-fun b!265118 () Bool)

(assert (=> b!265118 (= e!185150 (arrayBitRangesEq!0 (buf!6911 lt!406222) (buf!6911 lt!406222) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6443 (buf!6911 lt!406222)) (currentByte!12790 lt!406222) (currentBit!12785 lt!406222))))))

(assert (= (and d!89486 res!221588) b!265116))

(assert (= (and b!265116 res!221589) b!265117))

(assert (= (and b!265117 (not res!221590)) b!265118))

(declare-fun m!395805 () Bool)

(assert (=> b!265116 m!395805))

(assert (=> b!265116 m!395805))

(assert (=> b!265118 m!395805))

(assert (=> b!265118 m!395805))

(declare-fun m!395807 () Bool)

(assert (=> b!265118 m!395807))

(assert (=> b!265076 d!89486))

(declare-fun d!89506 () Bool)

(assert (=> d!89506 (isPrefixOf!0 lt!406222 lt!406222)))

(declare-fun lt!406240 () Unit!18859)

(assert (=> d!89506 (= lt!406240 (choose!11 lt!406222))))

(assert (=> d!89506 (= (lemmaIsPrefixRefl!0 lt!406222) lt!406240)))

(declare-fun bs!22714 () Bool)

(assert (= bs!22714 d!89506))

(assert (=> bs!22714 m!395751))

(declare-fun m!395809 () Bool)

(assert (=> bs!22714 m!395809))

(assert (=> b!265076 d!89506))

(declare-fun d!89508 () Bool)

(declare-fun res!221591 () Bool)

(declare-fun e!185153 () Bool)

(assert (=> d!89508 (=> (not res!221591) (not e!185153))))

(assert (=> d!89508 (= res!221591 (= (size!6443 (buf!6911 w1!584)) (size!6443 (buf!6911 w1!584))))))

(assert (=> d!89508 (= (isPrefixOf!0 w1!584 w1!584) e!185153)))

(declare-fun b!265119 () Bool)

(declare-fun res!221592 () Bool)

(assert (=> b!265119 (=> (not res!221592) (not e!185153))))

(assert (=> b!265119 (= res!221592 (bvsle (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584)) (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584))))))

(declare-fun b!265120 () Bool)

(declare-fun e!185152 () Bool)

(assert (=> b!265120 (= e!185153 e!185152)))

(declare-fun res!221593 () Bool)

(assert (=> b!265120 (=> res!221593 e!185152)))

(assert (=> b!265120 (= res!221593 (= (size!6443 (buf!6911 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265121 () Bool)

(assert (=> b!265121 (= e!185152 (arrayBitRangesEq!0 (buf!6911 w1!584) (buf!6911 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584))))))

(assert (= (and d!89508 res!221591) b!265119))

(assert (= (and b!265119 res!221592) b!265120))

(assert (= (and b!265120 (not res!221593)) b!265121))

(assert (=> b!265119 m!395737))

(assert (=> b!265119 m!395737))

(assert (=> b!265121 m!395737))

(assert (=> b!265121 m!395737))

(declare-fun m!395811 () Bool)

(assert (=> b!265121 m!395811))

(assert (=> b!265076 d!89508))

(declare-fun d!89510 () Bool)

(declare-fun res!221594 () Bool)

(declare-fun e!185155 () Bool)

(assert (=> d!89510 (=> (not res!221594) (not e!185155))))

(assert (=> d!89510 (= res!221594 (= (size!6443 (buf!6911 w2!580)) (size!6443 (buf!6911 w2!580))))))

(assert (=> d!89510 (= (isPrefixOf!0 w2!580 w2!580) e!185155)))

(declare-fun b!265122 () Bool)

(declare-fun res!221595 () Bool)

(assert (=> b!265122 (=> (not res!221595) (not e!185155))))

(assert (=> b!265122 (= res!221595 (bvsle (bitIndex!0 (size!6443 (buf!6911 w2!580)) (currentByte!12790 w2!580) (currentBit!12785 w2!580)) (bitIndex!0 (size!6443 (buf!6911 w2!580)) (currentByte!12790 w2!580) (currentBit!12785 w2!580))))))

(declare-fun b!265123 () Bool)

(declare-fun e!185154 () Bool)

(assert (=> b!265123 (= e!185155 e!185154)))

(declare-fun res!221596 () Bool)

(assert (=> b!265123 (=> res!221596 e!185154)))

(assert (=> b!265123 (= res!221596 (= (size!6443 (buf!6911 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265124 () Bool)

(assert (=> b!265124 (= e!185154 (arrayBitRangesEq!0 (buf!6911 w2!580) (buf!6911 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6443 (buf!6911 w2!580)) (currentByte!12790 w2!580) (currentBit!12785 w2!580))))))

(assert (= (and d!89510 res!221594) b!265122))

(assert (= (and b!265122 res!221595) b!265123))

(assert (= (and b!265123 (not res!221596)) b!265124))

(declare-fun m!395813 () Bool)

(assert (=> b!265122 m!395813))

(assert (=> b!265122 m!395813))

(assert (=> b!265124 m!395813))

(assert (=> b!265124 m!395813))

(declare-fun m!395815 () Bool)

(assert (=> b!265124 m!395815))

(assert (=> b!265076 d!89510))

(declare-fun d!89512 () Bool)

(assert (=> d!89512 (= (array_inv!6167 (buf!6911 w2!580)) (bvsge (size!6443 (buf!6911 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265079 d!89512))

(declare-fun d!89514 () Bool)

(declare-fun res!221597 () Bool)

(declare-fun e!185157 () Bool)

(assert (=> d!89514 (=> (not res!221597) (not e!185157))))

(assert (=> d!89514 (= res!221597 (= (size!6443 (buf!6911 w1!584)) (size!6443 (buf!6911 w2!580))))))

(assert (=> d!89514 (= (isPrefixOf!0 w1!584 w2!580) e!185157)))

(declare-fun b!265125 () Bool)

(declare-fun res!221598 () Bool)

(assert (=> b!265125 (=> (not res!221598) (not e!185157))))

(assert (=> b!265125 (= res!221598 (bvsle (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584)) (bitIndex!0 (size!6443 (buf!6911 w2!580)) (currentByte!12790 w2!580) (currentBit!12785 w2!580))))))

(declare-fun b!265126 () Bool)

(declare-fun e!185156 () Bool)

(assert (=> b!265126 (= e!185157 e!185156)))

(declare-fun res!221599 () Bool)

(assert (=> b!265126 (=> res!221599 e!185156)))

(assert (=> b!265126 (= res!221599 (= (size!6443 (buf!6911 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265127 () Bool)

(assert (=> b!265127 (= e!185156 (arrayBitRangesEq!0 (buf!6911 w1!584) (buf!6911 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584))))))

(assert (= (and d!89514 res!221597) b!265125))

(assert (= (and b!265125 res!221598) b!265126))

(assert (= (and b!265126 (not res!221599)) b!265127))

(assert (=> b!265125 m!395737))

(assert (=> b!265125 m!395813))

(assert (=> b!265127 m!395737))

(assert (=> b!265127 m!395737))

(assert (=> b!265127 m!395739))

(assert (=> start!57770 d!89514))

(declare-fun d!89516 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89516 (= (inv!12 w1!584) (invariant!0 (currentBit!12785 w1!584) (currentByte!12790 w1!584) (size!6443 (buf!6911 w1!584))))))

(declare-fun bs!22715 () Bool)

(assert (= bs!22715 d!89516))

(declare-fun m!395817 () Bool)

(assert (=> bs!22715 m!395817))

(assert (=> start!57770 d!89516))

(declare-fun d!89518 () Bool)

(assert (=> d!89518 (= (inv!12 w2!580) (invariant!0 (currentBit!12785 w2!580) (currentByte!12790 w2!580) (size!6443 (buf!6911 w2!580))))))

(declare-fun bs!22716 () Bool)

(assert (= bs!22716 d!89518))

(declare-fun m!395819 () Bool)

(assert (=> bs!22716 m!395819))

(assert (=> start!57770 d!89518))

(declare-fun d!89520 () Bool)

(assert (=> d!89520 (= (array_inv!6167 (buf!6911 w1!584)) (bvsge (size!6443 (buf!6911 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265078 d!89520))

(declare-fun b!265184 () Bool)

(declare-fun res!221641 () Bool)

(declare-fun lt!406265 () (_ BitVec 32))

(assert (=> b!265184 (= res!221641 (= lt!406265 #b00000000000000000000000000000000))))

(declare-fun e!185207 () Bool)

(assert (=> b!265184 (=> res!221641 e!185207)))

(declare-fun e!185211 () Bool)

(assert (=> b!265184 (= e!185211 e!185207)))

(declare-fun b!265185 () Bool)

(declare-fun call!4124 () Bool)

(assert (=> b!265185 (= e!185207 call!4124)))

(declare-fun b!265186 () Bool)

(declare-fun e!185208 () Bool)

(assert (=> b!265186 (= e!185208 e!185211)))

(declare-datatypes ((tuple4!364 0))(
  ( (tuple4!365 (_1!12162 (_ BitVec 32)) (_2!12162 (_ BitVec 32)) (_3!962 (_ BitVec 32)) (_4!182 (_ BitVec 32))) )
))
(declare-fun lt!406267 () tuple4!364)

(declare-fun lt!406266 () (_ BitVec 32))

(declare-fun res!221644 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265186 (= res!221644 (byteRangesEq!0 (select (arr!7430 (buf!6911 w1!584)) (_3!962 lt!406267)) (select (arr!7430 (buf!6911 w2!580)) (_3!962 lt!406267)) lt!406266 #b00000000000000000000000000001000))))

(assert (=> b!265186 (=> (not res!221644) (not e!185211))))

(declare-fun b!265187 () Bool)

(declare-fun e!185209 () Bool)

(declare-fun e!185206 () Bool)

(assert (=> b!265187 (= e!185209 e!185206)))

(declare-fun res!221640 () Bool)

(assert (=> b!265187 (=> (not res!221640) (not e!185206))))

(declare-fun e!185210 () Bool)

(assert (=> b!265187 (= res!221640 e!185210)))

(declare-fun res!221643 () Bool)

(assert (=> b!265187 (=> res!221643 e!185210)))

(assert (=> b!265187 (= res!221643 (bvsge (_1!12162 lt!406267) (_2!12162 lt!406267)))))

(assert (=> b!265187 (= lt!406265 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265187 (= lt!406266 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!364)

(assert (=> b!265187 (= lt!406267 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584))))))

(declare-fun d!89522 () Bool)

(declare-fun res!221642 () Bool)

(assert (=> d!89522 (=> res!221642 e!185209)))

(assert (=> d!89522 (= res!221642 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584))))))

(assert (=> d!89522 (= (arrayBitRangesEq!0 (buf!6911 w1!584) (buf!6911 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584))) e!185209)))

(declare-fun c!12183 () Bool)

(declare-fun bm!4121 () Bool)

(assert (=> bm!4121 (= call!4124 (byteRangesEq!0 (ite c!12183 (select (arr!7430 (buf!6911 w1!584)) (_3!962 lt!406267)) (select (arr!7430 (buf!6911 w1!584)) (_4!182 lt!406267))) (ite c!12183 (select (arr!7430 (buf!6911 w2!580)) (_3!962 lt!406267)) (select (arr!7430 (buf!6911 w2!580)) (_4!182 lt!406267))) (ite c!12183 lt!406266 #b00000000000000000000000000000000) lt!406265))))

(declare-fun b!265188 () Bool)

(declare-fun arrayRangesEq!1018 (array!14770 array!14770 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265188 (= e!185210 (arrayRangesEq!1018 (buf!6911 w1!584) (buf!6911 w2!580) (_1!12162 lt!406267) (_2!12162 lt!406267)))))

(declare-fun b!265189 () Bool)

(assert (=> b!265189 (= e!185208 call!4124)))

(declare-fun b!265190 () Bool)

(assert (=> b!265190 (= e!185206 e!185208)))

(assert (=> b!265190 (= c!12183 (= (_3!962 lt!406267) (_4!182 lt!406267)))))

(assert (= (and d!89522 (not res!221642)) b!265187))

(assert (= (and b!265187 (not res!221643)) b!265188))

(assert (= (and b!265187 res!221640) b!265190))

(assert (= (and b!265190 c!12183) b!265189))

(assert (= (and b!265190 (not c!12183)) b!265186))

(assert (= (and b!265186 res!221644) b!265184))

(assert (= (and b!265184 (not res!221641)) b!265185))

(assert (= (or b!265189 b!265185) bm!4121))

(declare-fun m!395853 () Bool)

(assert (=> b!265186 m!395853))

(declare-fun m!395855 () Bool)

(assert (=> b!265186 m!395855))

(assert (=> b!265186 m!395853))

(assert (=> b!265186 m!395855))

(declare-fun m!395857 () Bool)

(assert (=> b!265186 m!395857))

(assert (=> b!265187 m!395737))

(declare-fun m!395859 () Bool)

(assert (=> b!265187 m!395859))

(declare-fun m!395861 () Bool)

(assert (=> bm!4121 m!395861))

(assert (=> bm!4121 m!395855))

(declare-fun m!395863 () Bool)

(assert (=> bm!4121 m!395863))

(assert (=> bm!4121 m!395853))

(declare-fun m!395865 () Bool)

(assert (=> bm!4121 m!395865))

(declare-fun m!395867 () Bool)

(assert (=> b!265188 m!395867))

(assert (=> b!265077 d!89522))

(declare-fun d!89528 () Bool)

(declare-fun e!185230 () Bool)

(assert (=> d!89528 e!185230))

(declare-fun res!221676 () Bool)

(assert (=> d!89528 (=> (not res!221676) (not e!185230))))

(declare-fun lt!406329 () (_ BitVec 64))

(declare-fun lt!406326 () (_ BitVec 64))

(declare-fun lt!406327 () (_ BitVec 64))

(assert (=> d!89528 (= res!221676 (= lt!406329 (bvsub lt!406327 lt!406326)))))

(assert (=> d!89528 (or (= (bvand lt!406327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406326 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406327 lt!406326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89528 (= lt!406326 (remainingBits!0 ((_ sign_extend 32) (size!6443 (buf!6911 w1!584))) ((_ sign_extend 32) (currentByte!12790 w1!584)) ((_ sign_extend 32) (currentBit!12785 w1!584))))))

(declare-fun lt!406331 () (_ BitVec 64))

(declare-fun lt!406328 () (_ BitVec 64))

(assert (=> d!89528 (= lt!406327 (bvmul lt!406331 lt!406328))))

(assert (=> d!89528 (or (= lt!406331 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406328 (bvsdiv (bvmul lt!406331 lt!406328) lt!406331)))))

(assert (=> d!89528 (= lt!406328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89528 (= lt!406331 ((_ sign_extend 32) (size!6443 (buf!6911 w1!584))))))

(assert (=> d!89528 (= lt!406329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12790 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12785 w1!584))))))

(assert (=> d!89528 (invariant!0 (currentBit!12785 w1!584) (currentByte!12790 w1!584) (size!6443 (buf!6911 w1!584)))))

(assert (=> d!89528 (= (bitIndex!0 (size!6443 (buf!6911 w1!584)) (currentByte!12790 w1!584) (currentBit!12785 w1!584)) lt!406329)))

(declare-fun b!265222 () Bool)

(declare-fun res!221677 () Bool)

(assert (=> b!265222 (=> (not res!221677) (not e!185230))))

(assert (=> b!265222 (= res!221677 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406329))))

(declare-fun b!265223 () Bool)

(declare-fun lt!406330 () (_ BitVec 64))

(assert (=> b!265223 (= e!185230 (bvsle lt!406329 (bvmul lt!406330 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265223 (or (= lt!406330 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406330 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406330)))))

(assert (=> b!265223 (= lt!406330 ((_ sign_extend 32) (size!6443 (buf!6911 w1!584))))))

(assert (= (and d!89528 res!221676) b!265222))

(assert (= (and b!265222 res!221677) b!265223))

(declare-fun m!395899 () Bool)

(assert (=> d!89528 m!395899))

(assert (=> d!89528 m!395817))

(assert (=> b!265077 d!89528))

(check-sat (not b!265127) (not b!265116) (not d!89484) (not b!265122) (not d!89480) (not b!265188) (not d!89528) (not d!89518) (not b!265119) (not b!265124) (not d!89516) (not b!265186) (not b!265118) (not b!265125) (not b!265121) (not b!265187) (not bm!4121) (not d!89506))
