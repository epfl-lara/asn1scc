; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57894 () Bool)

(assert start!57894)

(declare-fun b!265659 () Bool)

(declare-fun e!185671 () Bool)

(declare-datatypes ((array!14807 0))(
  ( (array!14808 (arr!7444 (Array (_ BitVec 32) (_ BitVec 8))) (size!6457 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11728 0))(
  ( (BitStream!11729 (buf!6925 array!14807) (currentByte!12810 (_ BitVec 32)) (currentBit!12805 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11728)

(declare-fun array_inv!6181 (array!14807) Bool)

(assert (=> b!265659 (= e!185671 (array_inv!6181 (buf!6925 w1!584)))))

(declare-fun b!265660 () Bool)

(declare-fun res!221971 () Bool)

(declare-fun e!185670 () Bool)

(assert (=> b!265660 (=> res!221971 e!185670)))

(assert (=> b!265660 (= res!221971 (= (size!6457 (buf!6925 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265661 () Bool)

(declare-fun e!185668 () Bool)

(declare-fun w2!580 () BitStream!11728)

(declare-fun arrayBitRangesEq!0 (array!14807 array!14807 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265661 (= e!185668 (not (arrayBitRangesEq!0 (buf!6925 w1!584) (buf!6925 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584)))))))

(declare-fun res!221974 () Bool)

(declare-fun e!185667 () Bool)

(assert (=> start!57894 (=> (not res!221974) (not e!185667))))

(declare-fun isPrefixOf!0 (BitStream!11728 BitStream!11728) Bool)

(assert (=> start!57894 (= res!221974 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57894 e!185667))

(declare-fun inv!12 (BitStream!11728) Bool)

(assert (=> start!57894 (and (inv!12 w1!584) e!185671)))

(declare-fun e!185673 () Bool)

(assert (=> start!57894 (and (inv!12 w2!580) e!185673)))

(declare-fun b!265662 () Bool)

(assert (=> b!265662 (= e!185670 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584))))))

(declare-fun b!265663 () Bool)

(assert (=> b!265663 (= e!185667 (not e!185670))))

(declare-fun res!221973 () Bool)

(assert (=> b!265663 (=> res!221973 e!185670)))

(assert (=> b!265663 (= res!221973 e!185668)))

(declare-fun res!221972 () Bool)

(assert (=> b!265663 (=> (not res!221972) (not e!185668))))

(assert (=> b!265663 (= res!221972 (not (= (size!6457 (buf!6925 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!265663 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18881 0))(
  ( (Unit!18882) )
))
(declare-fun lt!406591 () Unit!18881)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11728) Unit!18881)

(assert (=> b!265663 (= lt!406591 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406590 () BitStream!11728)

(assert (=> b!265663 (isPrefixOf!0 lt!406590 lt!406590)))

(declare-fun lt!406592 () Unit!18881)

(assert (=> b!265663 (= lt!406592 (lemmaIsPrefixRefl!0 lt!406590))))

(assert (=> b!265663 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406589 () Unit!18881)

(assert (=> b!265663 (= lt!406589 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265663 (= lt!406590 (BitStream!11729 (buf!6925 w2!580) (currentByte!12810 w1!584) (currentBit!12805 w1!584)))))

(declare-fun b!265664 () Bool)

(assert (=> b!265664 (= e!185673 (array_inv!6181 (buf!6925 w2!580)))))

(assert (= (and start!57894 res!221974) b!265663))

(assert (= (and b!265663 res!221972) b!265661))

(assert (= (and b!265663 (not res!221973)) b!265660))

(assert (= (and b!265660 (not res!221971)) b!265662))

(assert (= start!57894 b!265659))

(assert (= start!57894 b!265664))

(declare-fun m!396419 () Bool)

(assert (=> b!265664 m!396419))

(declare-fun m!396421 () Bool)

(assert (=> start!57894 m!396421))

(declare-fun m!396423 () Bool)

(assert (=> start!57894 m!396423))

(declare-fun m!396425 () Bool)

(assert (=> start!57894 m!396425))

(declare-fun m!396427 () Bool)

(assert (=> b!265663 m!396427))

(declare-fun m!396429 () Bool)

(assert (=> b!265663 m!396429))

(declare-fun m!396431 () Bool)

(assert (=> b!265663 m!396431))

(declare-fun m!396433 () Bool)

(assert (=> b!265663 m!396433))

(declare-fun m!396435 () Bool)

(assert (=> b!265663 m!396435))

(declare-fun m!396437 () Bool)

(assert (=> b!265663 m!396437))

(declare-fun m!396439 () Bool)

(assert (=> b!265662 m!396439))

(assert (=> b!265661 m!396439))

(assert (=> b!265661 m!396439))

(declare-fun m!396441 () Bool)

(assert (=> b!265661 m!396441))

(declare-fun m!396443 () Bool)

(assert (=> b!265659 m!396443))

(push 1)

(assert (not start!57894))

(assert (not b!265663))

(assert (not b!265664))

(assert (not b!265661))

(assert (not b!265662))

(assert (not b!265659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89702 () Bool)

(declare-fun res!222005 () Bool)

(declare-fun e!185720 () Bool)

(assert (=> d!89702 (=> (not res!222005) (not e!185720))))

(assert (=> d!89702 (= res!222005 (= (size!6457 (buf!6925 w1!584)) (size!6457 (buf!6925 w2!580))))))

(assert (=> d!89702 (= (isPrefixOf!0 w1!584 w2!580) e!185720)))

(declare-fun b!265707 () Bool)

(declare-fun res!222006 () Bool)

(assert (=> b!265707 (=> (not res!222006) (not e!185720))))

(assert (=> b!265707 (= res!222006 (bvsle (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584)) (bitIndex!0 (size!6457 (buf!6925 w2!580)) (currentByte!12810 w2!580) (currentBit!12805 w2!580))))))

(declare-fun b!265708 () Bool)

(declare-fun e!185721 () Bool)

(assert (=> b!265708 (= e!185720 e!185721)))

(declare-fun res!222007 () Bool)

(assert (=> b!265708 (=> res!222007 e!185721)))

(assert (=> b!265708 (= res!222007 (= (size!6457 (buf!6925 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265709 () Bool)

(assert (=> b!265709 (= e!185721 (arrayBitRangesEq!0 (buf!6925 w1!584) (buf!6925 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584))))))

(assert (= (and d!89702 res!222005) b!265707))

(assert (= (and b!265707 res!222006) b!265708))

(assert (= (and b!265708 (not res!222007)) b!265709))

(assert (=> b!265707 m!396439))

(declare-fun m!396497 () Bool)

(assert (=> b!265707 m!396497))

(assert (=> b!265709 m!396439))

(assert (=> b!265709 m!396439))

(assert (=> b!265709 m!396441))

(assert (=> start!57894 d!89702))

(declare-fun d!89708 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89708 (= (inv!12 w1!584) (invariant!0 (currentBit!12805 w1!584) (currentByte!12810 w1!584) (size!6457 (buf!6925 w1!584))))))

(declare-fun bs!22770 () Bool)

(assert (= bs!22770 d!89708))

(declare-fun m!396499 () Bool)

(assert (=> bs!22770 m!396499))

(assert (=> start!57894 d!89708))

(declare-fun d!89712 () Bool)

(assert (=> d!89712 (= (inv!12 w2!580) (invariant!0 (currentBit!12805 w2!580) (currentByte!12810 w2!580) (size!6457 (buf!6925 w2!580))))))

(declare-fun bs!22771 () Bool)

(assert (= bs!22771 d!89712))

(declare-fun m!396501 () Bool)

(assert (=> bs!22771 m!396501))

(assert (=> start!57894 d!89712))

(declare-fun d!89714 () Bool)

(assert (=> d!89714 (= (array_inv!6181 (buf!6925 w2!580)) (bvsge (size!6457 (buf!6925 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265664 d!89714))

(declare-fun d!89716 () Bool)

(assert (=> d!89716 (= (array_inv!6181 (buf!6925 w1!584)) (bvsge (size!6457 (buf!6925 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265659 d!89716))

(declare-fun b!265754 () Bool)

(declare-fun e!185757 () Bool)

(declare-fun call!4142 () Bool)

(assert (=> b!265754 (= e!185757 call!4142)))

(declare-fun b!265755 () Bool)

(declare-fun res!222050 () Bool)

(declare-fun lt!406647 () (_ BitVec 32))

(assert (=> b!265755 (= res!222050 (= lt!406647 #b00000000000000000000000000000000))))

(assert (=> b!265755 (=> res!222050 e!185757)))

(declare-fun e!185754 () Bool)

(assert (=> b!265755 (= e!185754 e!185757)))

(declare-fun b!265756 () Bool)

(declare-fun e!185758 () Bool)

(assert (=> b!265756 (= e!185758 e!185754)))

(declare-fun res!222051 () Bool)

(declare-fun lt!406646 () (_ BitVec 32))

(declare-datatypes ((tuple4!372 0))(
  ( (tuple4!373 (_1!12166 (_ BitVec 32)) (_2!12166 (_ BitVec 32)) (_3!966 (_ BitVec 32)) (_4!186 (_ BitVec 32))) )
))
(declare-fun lt!406648 () tuple4!372)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265756 (= res!222051 (byteRangesEq!0 (select (arr!7444 (buf!6925 w1!584)) (_3!966 lt!406648)) (select (arr!7444 (buf!6925 w2!580)) (_3!966 lt!406648)) lt!406646 #b00000000000000000000000000001000))))

(assert (=> b!265756 (=> (not res!222051) (not e!185754))))

(declare-fun b!265757 () Bool)

(declare-fun e!185756 () Bool)

(assert (=> b!265757 (= e!185756 e!185758)))

(declare-fun c!12219 () Bool)

(assert (=> b!265757 (= c!12219 (= (_3!966 lt!406648) (_4!186 lt!406648)))))

(declare-fun b!265758 () Bool)

(declare-fun e!185755 () Bool)

(assert (=> b!265758 (= e!185755 e!185756)))

(declare-fun res!222049 () Bool)

(assert (=> b!265758 (=> (not res!222049) (not e!185756))))

(declare-fun e!185753 () Bool)

(assert (=> b!265758 (= res!222049 e!185753)))

(declare-fun res!222048 () Bool)

(assert (=> b!265758 (=> res!222048 e!185753)))

(assert (=> b!265758 (= res!222048 (bvsge (_1!12166 lt!406648) (_2!12166 lt!406648)))))

(assert (=> b!265758 (= lt!406647 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265758 (= lt!406646 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!372)

(assert (=> b!265758 (= lt!406648 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584))))))

(declare-fun b!265759 () Bool)

(assert (=> b!265759 (= e!185758 call!4142)))

(declare-fun d!89718 () Bool)

(declare-fun res!222052 () Bool)

(assert (=> d!89718 (=> res!222052 e!185755)))

(assert (=> d!89718 (= res!222052 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584))))))

(assert (=> d!89718 (= (arrayBitRangesEq!0 (buf!6925 w1!584) (buf!6925 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584))) e!185755)))

(declare-fun bm!4139 () Bool)

(assert (=> bm!4139 (= call!4142 (byteRangesEq!0 (ite c!12219 (select (arr!7444 (buf!6925 w1!584)) (_3!966 lt!406648)) (select (arr!7444 (buf!6925 w1!584)) (_4!186 lt!406648))) (ite c!12219 (select (arr!7444 (buf!6925 w2!580)) (_3!966 lt!406648)) (select (arr!7444 (buf!6925 w2!580)) (_4!186 lt!406648))) (ite c!12219 lt!406646 #b00000000000000000000000000000000) lt!406647))))

(declare-fun b!265760 () Bool)

(declare-fun arrayRangesEq!1022 (array!14807 array!14807 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265760 (= e!185753 (arrayRangesEq!1022 (buf!6925 w1!584) (buf!6925 w2!580) (_1!12166 lt!406648) (_2!12166 lt!406648)))))

(assert (= (and d!89718 (not res!222052)) b!265758))

(assert (= (and b!265758 (not res!222048)) b!265760))

(assert (= (and b!265758 res!222049) b!265757))

(assert (= (and b!265757 c!12219) b!265759))

(assert (= (and b!265757 (not c!12219)) b!265756))

(assert (= (and b!265756 res!222051) b!265755))

(assert (= (and b!265755 (not res!222050)) b!265754))

(assert (= (or b!265759 b!265754) bm!4139))

(declare-fun m!396529 () Bool)

(assert (=> b!265756 m!396529))

(declare-fun m!396531 () Bool)

(assert (=> b!265756 m!396531))

(assert (=> b!265756 m!396529))

(assert (=> b!265756 m!396531))

(declare-fun m!396533 () Bool)

(assert (=> b!265756 m!396533))

(assert (=> b!265758 m!396439))

(declare-fun m!396535 () Bool)

(assert (=> b!265758 m!396535))

(declare-fun m!396537 () Bool)

(assert (=> bm!4139 m!396537))

(assert (=> bm!4139 m!396529))

(assert (=> bm!4139 m!396531))

(declare-fun m!396539 () Bool)

(assert (=> bm!4139 m!396539))

(declare-fun m!396541 () Bool)

(assert (=> bm!4139 m!396541))

(declare-fun m!396543 () Bool)

(assert (=> b!265760 m!396543))

(assert (=> b!265661 d!89718))

(declare-fun d!89746 () Bool)

(declare-fun e!185773 () Bool)

(assert (=> d!89746 e!185773))

(declare-fun res!222068 () Bool)

(assert (=> d!89746 (=> (not res!222068) (not e!185773))))

(declare-fun lt!406671 () (_ BitVec 64))

(declare-fun lt!406669 () (_ BitVec 64))

(declare-fun lt!406667 () (_ BitVec 64))

(assert (=> d!89746 (= res!222068 (= lt!406669 (bvsub lt!406667 lt!406671)))))

(assert (=> d!89746 (or (= (bvand lt!406667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406667 lt!406671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89746 (= lt!406671 (remainingBits!0 ((_ sign_extend 32) (size!6457 (buf!6925 w1!584))) ((_ sign_extend 32) (currentByte!12810 w1!584)) ((_ sign_extend 32) (currentBit!12805 w1!584))))))

(declare-fun lt!406670 () (_ BitVec 64))

(declare-fun lt!406668 () (_ BitVec 64))

(assert (=> d!89746 (= lt!406667 (bvmul lt!406670 lt!406668))))

(assert (=> d!89746 (or (= lt!406670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406668 (bvsdiv (bvmul lt!406670 lt!406668) lt!406670)))))

(assert (=> d!89746 (= lt!406668 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89746 (= lt!406670 ((_ sign_extend 32) (size!6457 (buf!6925 w1!584))))))

(assert (=> d!89746 (= lt!406669 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12810 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12805 w1!584))))))

(assert (=> d!89746 (invariant!0 (currentBit!12805 w1!584) (currentByte!12810 w1!584) (size!6457 (buf!6925 w1!584)))))

(assert (=> d!89746 (= (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584)) lt!406669)))

(declare-fun b!265779 () Bool)

(declare-fun res!222067 () Bool)

(assert (=> b!265779 (=> (not res!222067) (not e!185773))))

(assert (=> b!265779 (= res!222067 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406669))))

(declare-fun b!265780 () Bool)

(declare-fun lt!406672 () (_ BitVec 64))

(assert (=> b!265780 (= e!185773 (bvsle lt!406669 (bvmul lt!406672 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265780 (or (= lt!406672 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406672 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406672)))))

(assert (=> b!265780 (= lt!406672 ((_ sign_extend 32) (size!6457 (buf!6925 w1!584))))))

(assert (= (and d!89746 res!222068) b!265779))

(assert (= (and b!265779 res!222067) b!265780))

(declare-fun m!396545 () Bool)

(assert (=> d!89746 m!396545))

(assert (=> d!89746 m!396499))

(assert (=> b!265661 d!89746))

(assert (=> b!265662 d!89746))

(declare-fun d!89748 () Bool)

(assert (=> d!89748 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406684 () Unit!18881)

(declare-fun choose!11 (BitStream!11728) Unit!18881)

(assert (=> d!89748 (= lt!406684 (choose!11 w2!580))))

(assert (=> d!89748 (= (lemmaIsPrefixRefl!0 w2!580) lt!406684)))

(declare-fun bs!22779 () Bool)

(assert (= bs!22779 d!89748))

(assert (=> bs!22779 m!396435))

(declare-fun m!396555 () Bool)

(assert (=> bs!22779 m!396555))

(assert (=> b!265663 d!89748))

(declare-fun d!89750 () Bool)

(assert (=> d!89750 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406685 () Unit!18881)

(assert (=> d!89750 (= lt!406685 (choose!11 w1!584))))

(assert (=> d!89750 (= (lemmaIsPrefixRefl!0 w1!584) lt!406685)))

(declare-fun bs!22780 () Bool)

(assert (= bs!22780 d!89750))

(assert (=> bs!22780 m!396431))

(declare-fun m!396563 () Bool)

(assert (=> bs!22780 m!396563))

(assert (=> b!265663 d!89750))

(declare-fun d!89752 () Bool)

(declare-fun res!222084 () Bool)

(declare-fun e!185792 () Bool)

(assert (=> d!89752 (=> (not res!222084) (not e!185792))))

(assert (=> d!89752 (= res!222084 (= (size!6457 (buf!6925 lt!406590)) (size!6457 (buf!6925 lt!406590))))))

(assert (=> d!89752 (= (isPrefixOf!0 lt!406590 lt!406590) e!185792)))

(declare-fun b!265802 () Bool)

(declare-fun res!222085 () Bool)

(assert (=> b!265802 (=> (not res!222085) (not e!185792))))

(assert (=> b!265802 (= res!222085 (bvsle (bitIndex!0 (size!6457 (buf!6925 lt!406590)) (currentByte!12810 lt!406590) (currentBit!12805 lt!406590)) (bitIndex!0 (size!6457 (buf!6925 lt!406590)) (currentByte!12810 lt!406590) (currentBit!12805 lt!406590))))))

(declare-fun b!265803 () Bool)

(declare-fun e!185793 () Bool)

(assert (=> b!265803 (= e!185792 e!185793)))

(declare-fun res!222086 () Bool)

(assert (=> b!265803 (=> res!222086 e!185793)))

(assert (=> b!265803 (= res!222086 (= (size!6457 (buf!6925 lt!406590)) #b00000000000000000000000000000000))))

(declare-fun b!265804 () Bool)

(assert (=> b!265804 (= e!185793 (arrayBitRangesEq!0 (buf!6925 lt!406590) (buf!6925 lt!406590) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 lt!406590)) (currentByte!12810 lt!406590) (currentBit!12805 lt!406590))))))

(assert (= (and d!89752 res!222084) b!265802))

(assert (= (and b!265802 res!222085) b!265803))

(assert (= (and b!265803 (not res!222086)) b!265804))

(declare-fun m!396567 () Bool)

(assert (=> b!265802 m!396567))

(assert (=> b!265802 m!396567))

(assert (=> b!265804 m!396567))

(assert (=> b!265804 m!396567))

(declare-fun m!396569 () Bool)

(assert (=> b!265804 m!396569))

(assert (=> b!265663 d!89752))

(declare-fun d!89756 () Bool)

(assert (=> d!89756 (isPrefixOf!0 lt!406590 lt!406590)))

(declare-fun lt!406686 () Unit!18881)

(assert (=> d!89756 (= lt!406686 (choose!11 lt!406590))))

(assert (=> d!89756 (= (lemmaIsPrefixRefl!0 lt!406590) lt!406686)))

(declare-fun bs!22781 () Bool)

(assert (= bs!22781 d!89756))

(assert (=> bs!22781 m!396433))

(declare-fun m!396571 () Bool)

(assert (=> bs!22781 m!396571))

(assert (=> b!265663 d!89756))

(declare-fun d!89760 () Bool)

(declare-fun res!222090 () Bool)

(declare-fun e!185796 () Bool)

(assert (=> d!89760 (=> (not res!222090) (not e!185796))))

(assert (=> d!89760 (= res!222090 (= (size!6457 (buf!6925 w1!584)) (size!6457 (buf!6925 w1!584))))))

(assert (=> d!89760 (= (isPrefixOf!0 w1!584 w1!584) e!185796)))

(declare-fun b!265808 () Bool)

(declare-fun res!222091 () Bool)

(assert (=> b!265808 (=> (not res!222091) (not e!185796))))

(assert (=> b!265808 (= res!222091 (bvsle (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584)) (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584))))))

(declare-fun b!265809 () Bool)

(declare-fun e!185797 () Bool)

(assert (=> b!265809 (= e!185796 e!185797)))

(declare-fun res!222092 () Bool)

(assert (=> b!265809 (=> res!222092 e!185797)))

(assert (=> b!265809 (= res!222092 (= (size!6457 (buf!6925 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265810 () Bool)

(assert (=> b!265810 (= e!185797 (arrayBitRangesEq!0 (buf!6925 w1!584) (buf!6925 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 w1!584)) (currentByte!12810 w1!584) (currentBit!12805 w1!584))))))

(assert (= (and d!89760 res!222090) b!265808))

(assert (= (and b!265808 res!222091) b!265809))

(assert (= (and b!265809 (not res!222092)) b!265810))

(assert (=> b!265808 m!396439))

(assert (=> b!265808 m!396439))

(assert (=> b!265810 m!396439))

(assert (=> b!265810 m!396439))

(declare-fun m!396573 () Bool)

(assert (=> b!265810 m!396573))

(assert (=> b!265663 d!89760))

(declare-fun d!89762 () Bool)

(declare-fun res!222093 () Bool)

(declare-fun e!185798 () Bool)

(assert (=> d!89762 (=> (not res!222093) (not e!185798))))

(assert (=> d!89762 (= res!222093 (= (size!6457 (buf!6925 w2!580)) (size!6457 (buf!6925 w2!580))))))

(assert (=> d!89762 (= (isPrefixOf!0 w2!580 w2!580) e!185798)))

(declare-fun b!265811 () Bool)

(declare-fun res!222094 () Bool)

(assert (=> b!265811 (=> (not res!222094) (not e!185798))))

(assert (=> b!265811 (= res!222094 (bvsle (bitIndex!0 (size!6457 (buf!6925 w2!580)) (currentByte!12810 w2!580) (currentBit!12805 w2!580)) (bitIndex!0 (size!6457 (buf!6925 w2!580)) (currentByte!12810 w2!580) (currentBit!12805 w2!580))))))

(declare-fun b!265812 () Bool)

(declare-fun e!185799 () Bool)

(assert (=> b!265812 (= e!185798 e!185799)))

(declare-fun res!222095 () Bool)

(assert (=> b!265812 (=> res!222095 e!185799)))

(assert (=> b!265812 (= res!222095 (= (size!6457 (buf!6925 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265813 () Bool)

(assert (=> b!265813 (= e!185799 (arrayBitRangesEq!0 (buf!6925 w2!580) (buf!6925 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6457 (buf!6925 w2!580)) (currentByte!12810 w2!580) (currentBit!12805 w2!580))))))

(assert (= (and d!89762 res!222093) b!265811))

(assert (= (and b!265811 res!222094) b!265812))

(assert (= (and b!265812 (not res!222095)) b!265813))

(assert (=> b!265811 m!396497))

(assert (=> b!265811 m!396497))

(assert (=> b!265813 m!396497))

(assert (=> b!265813 m!396497))

(declare-fun m!396577 () Bool)

(assert (=> b!265813 m!396577))

(assert (=> b!265663 d!89762))

(push 1)

(assert (not b!265813))

(assert (not d!89708))

(assert (not d!89750))

(assert (not b!265808))

(assert (not d!89748))

(assert (not b!265804))

(assert (not b!265707))

(assert (not d!89756))

(assert (not bm!4139))

(assert (not b!265810))

(assert (not b!265709))

(assert (not b!265802))

(assert (not d!89746))

(assert (not b!265760))

(assert (not d!89712))

(assert (not b!265811))

(assert (not b!265756))

(assert (not b!265758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

