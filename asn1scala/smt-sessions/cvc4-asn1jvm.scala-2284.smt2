; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57898 () Bool)

(assert start!57898)

(declare-fun b!265696 () Bool)

(declare-fun e!185713 () Bool)

(declare-datatypes ((array!14811 0))(
  ( (array!14812 (arr!7446 (Array (_ BitVec 32) (_ BitVec 8))) (size!6459 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11732 0))(
  ( (BitStream!11733 (buf!6927 array!14811) (currentByte!12812 (_ BitVec 32)) (currentBit!12807 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11732)

(declare-fun w2!580 () BitStream!11732)

(declare-fun arrayBitRangesEq!0 (array!14811 array!14811 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265696 (= e!185713 (not (arrayBitRangesEq!0 (buf!6927 w1!584) (buf!6927 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584)))))))

(declare-fun b!265697 () Bool)

(declare-fun e!185711 () Bool)

(declare-fun array_inv!6183 (array!14811) Bool)

(assert (=> b!265697 (= e!185711 (array_inv!6183 (buf!6927 w1!584)))))

(declare-fun b!265698 () Bool)

(declare-fun e!185715 () Bool)

(assert (=> b!265698 (= e!185715 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584))))))

(declare-fun b!265699 () Bool)

(declare-fun res!221998 () Bool)

(assert (=> b!265699 (=> res!221998 e!185715)))

(assert (=> b!265699 (= res!221998 (= (size!6459 (buf!6927 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265700 () Bool)

(declare-fun e!185712 () Bool)

(assert (=> b!265700 (= e!185712 (array_inv!6183 (buf!6927 w2!580)))))

(declare-fun b!265695 () Bool)

(declare-fun e!185709 () Bool)

(assert (=> b!265695 (= e!185709 (not e!185715))))

(declare-fun res!221996 () Bool)

(assert (=> b!265695 (=> res!221996 e!185715)))

(assert (=> b!265695 (= res!221996 e!185713)))

(declare-fun res!221995 () Bool)

(assert (=> b!265695 (=> (not res!221995) (not e!185713))))

(assert (=> b!265695 (= res!221995 (not (= (size!6459 (buf!6927 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11732 BitStream!11732) Bool)

(assert (=> b!265695 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18885 0))(
  ( (Unit!18886) )
))
(declare-fun lt!406615 () Unit!18885)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11732) Unit!18885)

(assert (=> b!265695 (= lt!406615 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406616 () BitStream!11732)

(assert (=> b!265695 (isPrefixOf!0 lt!406616 lt!406616)))

(declare-fun lt!406613 () Unit!18885)

(assert (=> b!265695 (= lt!406613 (lemmaIsPrefixRefl!0 lt!406616))))

(assert (=> b!265695 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406614 () Unit!18885)

(assert (=> b!265695 (= lt!406614 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265695 (= lt!406616 (BitStream!11733 (buf!6927 w2!580) (currentByte!12812 w1!584) (currentBit!12807 w1!584)))))

(declare-fun res!221997 () Bool)

(assert (=> start!57898 (=> (not res!221997) (not e!185709))))

(assert (=> start!57898 (= res!221997 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57898 e!185709))

(declare-fun inv!12 (BitStream!11732) Bool)

(assert (=> start!57898 (and (inv!12 w1!584) e!185711)))

(assert (=> start!57898 (and (inv!12 w2!580) e!185712)))

(assert (= (and start!57898 res!221997) b!265695))

(assert (= (and b!265695 res!221995) b!265696))

(assert (= (and b!265695 (not res!221996)) b!265699))

(assert (= (and b!265699 (not res!221998)) b!265698))

(assert (= start!57898 b!265697))

(assert (= start!57898 b!265700))

(declare-fun m!396471 () Bool)

(assert (=> b!265696 m!396471))

(assert (=> b!265696 m!396471))

(declare-fun m!396473 () Bool)

(assert (=> b!265696 m!396473))

(assert (=> b!265698 m!396471))

(declare-fun m!396475 () Bool)

(assert (=> b!265695 m!396475))

(declare-fun m!396477 () Bool)

(assert (=> b!265695 m!396477))

(declare-fun m!396479 () Bool)

(assert (=> b!265695 m!396479))

(declare-fun m!396481 () Bool)

(assert (=> b!265695 m!396481))

(declare-fun m!396483 () Bool)

(assert (=> b!265695 m!396483))

(declare-fun m!396485 () Bool)

(assert (=> b!265695 m!396485))

(declare-fun m!396487 () Bool)

(assert (=> start!57898 m!396487))

(declare-fun m!396489 () Bool)

(assert (=> start!57898 m!396489))

(declare-fun m!396491 () Bool)

(assert (=> start!57898 m!396491))

(declare-fun m!396493 () Bool)

(assert (=> b!265697 m!396493))

(declare-fun m!396495 () Bool)

(assert (=> b!265700 m!396495))

(push 1)

(assert (not b!265700))

(assert (not b!265696))

(assert (not b!265698))

(assert (not b!265697))

(assert (not start!57898))

(assert (not b!265695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89704 () Bool)

(assert (=> d!89704 (= (array_inv!6183 (buf!6927 w1!584)) (bvsge (size!6459 (buf!6927 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265697 d!89704))

(declare-fun d!89706 () Bool)

(declare-fun e!185724 () Bool)

(assert (=> d!89706 e!185724))

(declare-fun res!222012 () Bool)

(assert (=> d!89706 (=> (not res!222012) (not e!185724))))

(declare-fun lt!406634 () (_ BitVec 64))

(declare-fun lt!406629 () (_ BitVec 64))

(declare-fun lt!406630 () (_ BitVec 64))

(assert (=> d!89706 (= res!222012 (= lt!406634 (bvsub lt!406629 lt!406630)))))

(assert (=> d!89706 (or (= (bvand lt!406629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406629 lt!406630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89706 (= lt!406630 (remainingBits!0 ((_ sign_extend 32) (size!6459 (buf!6927 w1!584))) ((_ sign_extend 32) (currentByte!12812 w1!584)) ((_ sign_extend 32) (currentBit!12807 w1!584))))))

(declare-fun lt!406632 () (_ BitVec 64))

(declare-fun lt!406631 () (_ BitVec 64))

(assert (=> d!89706 (= lt!406629 (bvmul lt!406632 lt!406631))))

(assert (=> d!89706 (or (= lt!406632 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406631 (bvsdiv (bvmul lt!406632 lt!406631) lt!406632)))))

(assert (=> d!89706 (= lt!406631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89706 (= lt!406632 ((_ sign_extend 32) (size!6459 (buf!6927 w1!584))))))

(assert (=> d!89706 (= lt!406634 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12812 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12807 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89706 (invariant!0 (currentBit!12807 w1!584) (currentByte!12812 w1!584) (size!6459 (buf!6927 w1!584)))))

(assert (=> d!89706 (= (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584)) lt!406634)))

(declare-fun b!265714 () Bool)

(declare-fun res!222013 () Bool)

(assert (=> b!265714 (=> (not res!222013) (not e!185724))))

(assert (=> b!265714 (= res!222013 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406634))))

(declare-fun b!265715 () Bool)

(declare-fun lt!406633 () (_ BitVec 64))

(assert (=> b!265715 (= e!185724 (bvsle lt!406634 (bvmul lt!406633 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265715 (or (= lt!406633 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406633 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406633)))))

(assert (=> b!265715 (= lt!406633 ((_ sign_extend 32) (size!6459 (buf!6927 w1!584))))))

(assert (= (and d!89706 res!222012) b!265714))

(assert (= (and b!265714 res!222013) b!265715))

(declare-fun m!396503 () Bool)

(assert (=> d!89706 m!396503))

(declare-fun m!396505 () Bool)

(assert (=> d!89706 m!396505))

(assert (=> b!265698 d!89706))

(declare-fun d!89724 () Bool)

(assert (=> d!89724 (= (array_inv!6183 (buf!6927 w2!580)) (bvsge (size!6459 (buf!6927 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265700 d!89724))

(declare-fun d!89726 () Bool)

(assert (=> d!89726 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406637 () Unit!18885)

(declare-fun choose!11 (BitStream!11732) Unit!18885)

(assert (=> d!89726 (= lt!406637 (choose!11 w1!584))))

(assert (=> d!89726 (= (lemmaIsPrefixRefl!0 w1!584) lt!406637)))

(declare-fun bs!22773 () Bool)

(assert (= bs!22773 d!89726))

(assert (=> bs!22773 m!396481))

(declare-fun m!396507 () Bool)

(assert (=> bs!22773 m!396507))

(assert (=> b!265695 d!89726))

(declare-fun d!89728 () Bool)

(assert (=> d!89728 (isPrefixOf!0 lt!406616 lt!406616)))

(declare-fun lt!406638 () Unit!18885)

(assert (=> d!89728 (= lt!406638 (choose!11 lt!406616))))

(assert (=> d!89728 (= (lemmaIsPrefixRefl!0 lt!406616) lt!406638)))

(declare-fun bs!22774 () Bool)

(assert (= bs!22774 d!89728))

(assert (=> bs!22774 m!396479))

(declare-fun m!396509 () Bool)

(assert (=> bs!22774 m!396509))

(assert (=> b!265695 d!89728))

(declare-fun d!89730 () Bool)

(declare-fun res!222041 () Bool)

(declare-fun e!185748 () Bool)

(assert (=> d!89730 (=> (not res!222041) (not e!185748))))

(assert (=> d!89730 (= res!222041 (= (size!6459 (buf!6927 lt!406616)) (size!6459 (buf!6927 lt!406616))))))

(assert (=> d!89730 (= (isPrefixOf!0 lt!406616 lt!406616) e!185748)))

(declare-fun b!265745 () Bool)

(declare-fun res!222040 () Bool)

(assert (=> b!265745 (=> (not res!222040) (not e!185748))))

(assert (=> b!265745 (= res!222040 (bvsle (bitIndex!0 (size!6459 (buf!6927 lt!406616)) (currentByte!12812 lt!406616) (currentBit!12807 lt!406616)) (bitIndex!0 (size!6459 (buf!6927 lt!406616)) (currentByte!12812 lt!406616) (currentBit!12807 lt!406616))))))

(declare-fun b!265746 () Bool)

(declare-fun e!185747 () Bool)

(assert (=> b!265746 (= e!185748 e!185747)))

(declare-fun res!222039 () Bool)

(assert (=> b!265746 (=> res!222039 e!185747)))

(assert (=> b!265746 (= res!222039 (= (size!6459 (buf!6927 lt!406616)) #b00000000000000000000000000000000))))

(declare-fun b!265747 () Bool)

(assert (=> b!265747 (= e!185747 (arrayBitRangesEq!0 (buf!6927 lt!406616) (buf!6927 lt!406616) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 lt!406616)) (currentByte!12812 lt!406616) (currentBit!12807 lt!406616))))))

(assert (= (and d!89730 res!222041) b!265745))

(assert (= (and b!265745 res!222040) b!265746))

(assert (= (and b!265746 (not res!222039)) b!265747))

(declare-fun m!396515 () Bool)

(assert (=> b!265745 m!396515))

(assert (=> b!265745 m!396515))

(assert (=> b!265747 m!396515))

(assert (=> b!265747 m!396515))

(declare-fun m!396519 () Bool)

(assert (=> b!265747 m!396519))

(assert (=> b!265695 d!89730))

(declare-fun d!89736 () Bool)

(assert (=> d!89736 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406645 () Unit!18885)

(assert (=> d!89736 (= lt!406645 (choose!11 w2!580))))

(assert (=> d!89736 (= (lemmaIsPrefixRefl!0 w2!580) lt!406645)))

(declare-fun bs!22777 () Bool)

(assert (= bs!22777 d!89736))

(assert (=> bs!22777 m!396483))

(declare-fun m!396521 () Bool)

(assert (=> bs!22777 m!396521))

(assert (=> b!265695 d!89736))

(declare-fun d!89740 () Bool)

(declare-fun res!222044 () Bool)

(declare-fun e!185750 () Bool)

(assert (=> d!89740 (=> (not res!222044) (not e!185750))))

(assert (=> d!89740 (= res!222044 (= (size!6459 (buf!6927 w1!584)) (size!6459 (buf!6927 w1!584))))))

(assert (=> d!89740 (= (isPrefixOf!0 w1!584 w1!584) e!185750)))

(declare-fun b!265748 () Bool)

(declare-fun res!222043 () Bool)

(assert (=> b!265748 (=> (not res!222043) (not e!185750))))

(assert (=> b!265748 (= res!222043 (bvsle (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584)) (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584))))))

(declare-fun b!265749 () Bool)

(declare-fun e!185749 () Bool)

(assert (=> b!265749 (= e!185750 e!185749)))

(declare-fun res!222042 () Bool)

(assert (=> b!265749 (=> res!222042 e!185749)))

(assert (=> b!265749 (= res!222042 (= (size!6459 (buf!6927 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265750 () Bool)

(assert (=> b!265750 (= e!185749 (arrayBitRangesEq!0 (buf!6927 w1!584) (buf!6927 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584))))))

(assert (= (and d!89740 res!222044) b!265748))

(assert (= (and b!265748 res!222043) b!265749))

(assert (= (and b!265749 (not res!222042)) b!265750))

(assert (=> b!265748 m!396471))

(assert (=> b!265748 m!396471))

(assert (=> b!265750 m!396471))

(assert (=> b!265750 m!396471))

(declare-fun m!396523 () Bool)

(assert (=> b!265750 m!396523))

(assert (=> b!265695 d!89740))

(declare-fun d!89742 () Bool)

(declare-fun res!222047 () Bool)

(declare-fun e!185752 () Bool)

(assert (=> d!89742 (=> (not res!222047) (not e!185752))))

(assert (=> d!89742 (= res!222047 (= (size!6459 (buf!6927 w2!580)) (size!6459 (buf!6927 w2!580))))))

(assert (=> d!89742 (= (isPrefixOf!0 w2!580 w2!580) e!185752)))

(declare-fun b!265751 () Bool)

(declare-fun res!222046 () Bool)

(assert (=> b!265751 (=> (not res!222046) (not e!185752))))

(assert (=> b!265751 (= res!222046 (bvsle (bitIndex!0 (size!6459 (buf!6927 w2!580)) (currentByte!12812 w2!580) (currentBit!12807 w2!580)) (bitIndex!0 (size!6459 (buf!6927 w2!580)) (currentByte!12812 w2!580) (currentBit!12807 w2!580))))))

(declare-fun b!265752 () Bool)

(declare-fun e!185751 () Bool)

(assert (=> b!265752 (= e!185752 e!185751)))

(declare-fun res!222045 () Bool)

(assert (=> b!265752 (=> res!222045 e!185751)))

(assert (=> b!265752 (= res!222045 (= (size!6459 (buf!6927 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265753 () Bool)

(assert (=> b!265753 (= e!185751 (arrayBitRangesEq!0 (buf!6927 w2!580) (buf!6927 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 w2!580)) (currentByte!12812 w2!580) (currentBit!12807 w2!580))))))

(assert (= (and d!89742 res!222047) b!265751))

(assert (= (and b!265751 res!222046) b!265752))

(assert (= (and b!265752 (not res!222045)) b!265753))

(declare-fun m!396525 () Bool)

(assert (=> b!265751 m!396525))

(assert (=> b!265751 m!396525))

(assert (=> b!265753 m!396525))

(assert (=> b!265753 m!396525))

(declare-fun m!396527 () Bool)

(assert (=> b!265753 m!396527))

(assert (=> b!265695 d!89742))

(declare-fun b!265783 () Bool)

(declare-fun res!222076 () Bool)

(declare-fun lt!406681 () (_ BitVec 32))

(assert (=> b!265783 (= res!222076 (= lt!406681 #b00000000000000000000000000000000))))

(declare-fun e!185780 () Bool)

(assert (=> b!265783 (=> res!222076 e!185780)))

(declare-fun e!185778 () Bool)

(assert (=> b!265783 (= e!185778 e!185780)))

(declare-datatypes ((tuple4!376 0))(
  ( (tuple4!377 (_1!12168 (_ BitVec 32)) (_2!12168 (_ BitVec 32)) (_3!968 (_ BitVec 32)) (_4!188 (_ BitVec 32))) )
))
(declare-fun lt!406679 () tuple4!376)

(declare-fun b!265784 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265784 (= e!185780 (byteRangesEq!0 (select (arr!7446 (buf!6927 w1!584)) (_4!188 lt!406679)) (select (arr!7446 (buf!6927 w2!580)) (_4!188 lt!406679)) #b00000000000000000000000000000000 lt!406681))))

(declare-fun b!265785 () Bool)

(declare-fun e!185781 () Bool)

(declare-fun e!185783 () Bool)

(assert (=> b!265785 (= e!185781 e!185783)))

(declare-fun c!12222 () Bool)

(assert (=> b!265785 (= c!12222 (= (_3!968 lt!406679) (_4!188 lt!406679)))))

(declare-fun b!265786 () Bool)

(declare-fun call!4145 () Bool)

(assert (=> b!265786 (= e!185783 call!4145)))

(declare-fun bm!4142 () Bool)

(declare-fun lt!406680 () (_ BitVec 32))

(assert (=> bm!4142 (= call!4145 (byteRangesEq!0 (select (arr!7446 (buf!6927 w1!584)) (_3!968 lt!406679)) (select (arr!7446 (buf!6927 w2!580)) (_3!968 lt!406679)) lt!406680 (ite c!12222 lt!406681 #b00000000000000000000000000001000)))))

(declare-fun b!265787 () Bool)

(assert (=> b!265787 (= e!185783 e!185778)))

(declare-fun res!222073 () Bool)

(assert (=> b!265787 (= res!222073 call!4145)))

(assert (=> b!265787 (=> (not res!222073) (not e!185778))))

(declare-fun d!89744 () Bool)

(declare-fun res!222075 () Bool)

(declare-fun e!185782 () Bool)

(assert (=> d!89744 (=> res!222075 e!185782)))

(assert (=> d!89744 (= res!222075 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584))))))

(assert (=> d!89744 (= (arrayBitRangesEq!0 (buf!6927 w1!584) (buf!6927 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584))) e!185782)))

(declare-fun b!265788 () Bool)

(declare-fun e!185779 () Bool)

(declare-fun arrayRangesEq!1024 (array!14811 array!14811 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265788 (= e!185779 (arrayRangesEq!1024 (buf!6927 w1!584) (buf!6927 w2!580) (_1!12168 lt!406679) (_2!12168 lt!406679)))))

(declare-fun b!265789 () Bool)

(assert (=> b!265789 (= e!185782 e!185781)))

(declare-fun res!222077 () Bool)

(assert (=> b!265789 (=> (not res!222077) (not e!185781))))

(assert (=> b!265789 (= res!222077 e!185779)))

(declare-fun res!222074 () Bool)

(assert (=> b!265789 (=> res!222074 e!185779)))

(assert (=> b!265789 (= res!222074 (bvsge (_1!12168 lt!406679) (_2!12168 lt!406679)))))

(assert (=> b!265789 (= lt!406681 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265789 (= lt!406680 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!376)

(assert (=> b!265789 (= lt!406679 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584))))))

(assert (= (and d!89744 (not res!222075)) b!265789))

(assert (= (and b!265789 (not res!222074)) b!265788))

(assert (= (and b!265789 res!222077) b!265785))

(assert (= (and b!265785 c!12222) b!265786))

(assert (= (and b!265785 (not c!12222)) b!265787))

(assert (= (and b!265787 res!222073) b!265783))

(assert (= (and b!265783 (not res!222076)) b!265784))

(assert (= (or b!265786 b!265787) bm!4142))

(declare-fun m!396547 () Bool)

(assert (=> b!265784 m!396547))

(declare-fun m!396549 () Bool)

(assert (=> b!265784 m!396549))

(assert (=> b!265784 m!396547))

(assert (=> b!265784 m!396549))

(declare-fun m!396551 () Bool)

(assert (=> b!265784 m!396551))

(declare-fun m!396553 () Bool)

(assert (=> bm!4142 m!396553))

(declare-fun m!396557 () Bool)

(assert (=> bm!4142 m!396557))

(assert (=> bm!4142 m!396553))

(assert (=> bm!4142 m!396557))

(declare-fun m!396559 () Bool)

(assert (=> bm!4142 m!396559))

(declare-fun m!396561 () Bool)

(assert (=> b!265788 m!396561))

(assert (=> b!265789 m!396471))

(declare-fun m!396565 () Bool)

(assert (=> b!265789 m!396565))

(assert (=> b!265696 d!89744))

(assert (=> b!265696 d!89706))

(declare-fun d!89754 () Bool)

(declare-fun res!222089 () Bool)

(declare-fun e!185795 () Bool)

(assert (=> d!89754 (=> (not res!222089) (not e!185795))))

(assert (=> d!89754 (= res!222089 (= (size!6459 (buf!6927 w1!584)) (size!6459 (buf!6927 w2!580))))))

(assert (=> d!89754 (= (isPrefixOf!0 w1!584 w2!580) e!185795)))

(declare-fun b!265805 () Bool)

(declare-fun res!222088 () Bool)

(assert (=> b!265805 (=> (not res!222088) (not e!185795))))

(assert (=> b!265805 (= res!222088 (bvsle (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584)) (bitIndex!0 (size!6459 (buf!6927 w2!580)) (currentByte!12812 w2!580) (currentBit!12807 w2!580))))))

(declare-fun b!265806 () Bool)

(declare-fun e!185794 () Bool)

(assert (=> b!265806 (= e!185795 e!185794)))

(declare-fun res!222087 () Bool)

(assert (=> b!265806 (=> res!222087 e!185794)))

(assert (=> b!265806 (= res!222087 (= (size!6459 (buf!6927 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265807 () Bool)

(assert (=> b!265807 (= e!185794 (arrayBitRangesEq!0 (buf!6927 w1!584) (buf!6927 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6459 (buf!6927 w1!584)) (currentByte!12812 w1!584) (currentBit!12807 w1!584))))))

(assert (= (and d!89754 res!222089) b!265805))

(assert (= (and b!265805 res!222088) b!265806))

(assert (= (and b!265806 (not res!222087)) b!265807))

(assert (=> b!265805 m!396471))

(assert (=> b!265805 m!396525))

(assert (=> b!265807 m!396471))

(assert (=> b!265807 m!396471))

(assert (=> b!265807 m!396473))

(assert (=> start!57898 d!89754))

(declare-fun d!89758 () Bool)

(assert (=> d!89758 (= (inv!12 w1!584) (invariant!0 (currentBit!12807 w1!584) (currentByte!12812 w1!584) (size!6459 (buf!6927 w1!584))))))

(declare-fun bs!22782 () Bool)

(assert (= bs!22782 d!89758))

(assert (=> bs!22782 m!396505))

(assert (=> start!57898 d!89758))

(declare-fun d!89764 () Bool)

(assert (=> d!89764 (= (inv!12 w2!580) (invariant!0 (currentBit!12807 w2!580) (currentByte!12812 w2!580) (size!6459 (buf!6927 w2!580))))))

(declare-fun bs!22783 () Bool)

(assert (= bs!22783 d!89764))

(declare-fun m!396575 () Bool)

(assert (=> bs!22783 m!396575))

(assert (=> start!57898 d!89764))

(push 1)

(assert (not d!89758))

(assert (not d!89736))

(assert (not d!89706))

(assert (not b!265745))

(assert (not bm!4142))

(assert (not d!89728))

(assert (not b!265753))

(assert (not b!265789))

(assert (not d!89726))

(assert (not b!265807))

(assert (not d!89764))

(assert (not b!265784))

(assert (not b!265750))

(assert (not b!265747))

(assert (not b!265748))

(assert (not b!265788))

(assert (not b!265751))

(assert (not b!265805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

