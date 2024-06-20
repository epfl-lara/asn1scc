; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57270 () Bool)

(assert start!57270)

(declare-fun b!262544 () Bool)

(declare-fun e!182804 () Bool)

(declare-fun e!182807 () Bool)

(assert (=> b!262544 (= e!182804 (not e!182807))))

(declare-fun res!219699 () Bool)

(assert (=> b!262544 (=> res!219699 e!182807)))

(declare-datatypes ((array!14639 0))(
  ( (array!14640 (arr!7378 (Array (_ BitVec 32) (_ BitVec 8))) (size!6391 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11596 0))(
  ( (BitStream!11597 (buf!6859 array!14639) (currentByte!12699 (_ BitVec 32)) (currentBit!12694 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11596)

(assert (=> b!262544 (= res!219699 (= (size!6391 (buf!6859 w1!584)) #b00000000000000000000000000000000))))

(declare-fun w2!580 () BitStream!11596)

(declare-fun isPrefixOf!0 (BitStream!11596 BitStream!11596) Bool)

(assert (=> b!262544 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18725 0))(
  ( (Unit!18726) )
))
(declare-fun lt!404149 () Unit!18725)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11596) Unit!18725)

(assert (=> b!262544 (= lt!404149 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404152 () BitStream!11596)

(assert (=> b!262544 (isPrefixOf!0 lt!404152 lt!404152)))

(declare-fun lt!404153 () Unit!18725)

(assert (=> b!262544 (= lt!404153 (lemmaIsPrefixRefl!0 lt!404152))))

(assert (=> b!262544 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404151 () Unit!18725)

(assert (=> b!262544 (= lt!404151 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262544 (= lt!404152 (BitStream!11597 (buf!6859 w2!580) (currentByte!12699 w1!584) (currentBit!12694 w1!584)))))

(declare-fun b!262545 () Bool)

(assert (=> b!262545 (= e!182807 (bvsle (size!6391 (buf!6859 w1!584)) (size!6391 (buf!6859 w2!580))))))

(declare-fun lt!404150 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262545 (= lt!404150 (bitIndex!0 (size!6391 (buf!6859 w1!584)) (currentByte!12699 w1!584) (currentBit!12694 w1!584)))))

(declare-fun b!262546 () Bool)

(declare-fun e!182806 () Bool)

(declare-fun array_inv!6115 (array!14639) Bool)

(assert (=> b!262546 (= e!182806 (array_inv!6115 (buf!6859 w1!584)))))

(declare-fun res!219700 () Bool)

(assert (=> start!57270 (=> (not res!219700) (not e!182804))))

(assert (=> start!57270 (= res!219700 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57270 e!182804))

(declare-fun inv!12 (BitStream!11596) Bool)

(assert (=> start!57270 (and (inv!12 w1!584) e!182806)))

(declare-fun e!182803 () Bool)

(assert (=> start!57270 (and (inv!12 w2!580) e!182803)))

(declare-fun b!262547 () Bool)

(assert (=> b!262547 (= e!182803 (array_inv!6115 (buf!6859 w2!580)))))

(assert (= (and start!57270 res!219700) b!262544))

(assert (= (and b!262544 (not res!219699)) b!262545))

(assert (= start!57270 b!262546))

(assert (= start!57270 b!262547))

(declare-fun m!392639 () Bool)

(assert (=> b!262547 m!392639))

(declare-fun m!392641 () Bool)

(assert (=> b!262546 m!392641))

(declare-fun m!392643 () Bool)

(assert (=> b!262545 m!392643))

(declare-fun m!392645 () Bool)

(assert (=> b!262544 m!392645))

(declare-fun m!392647 () Bool)

(assert (=> b!262544 m!392647))

(declare-fun m!392649 () Bool)

(assert (=> b!262544 m!392649))

(declare-fun m!392651 () Bool)

(assert (=> b!262544 m!392651))

(declare-fun m!392653 () Bool)

(assert (=> b!262544 m!392653))

(declare-fun m!392655 () Bool)

(assert (=> b!262544 m!392655))

(declare-fun m!392657 () Bool)

(assert (=> start!57270 m!392657))

(declare-fun m!392659 () Bool)

(assert (=> start!57270 m!392659))

(declare-fun m!392661 () Bool)

(assert (=> start!57270 m!392661))

(push 1)

(assert (not b!262544))

(assert (not b!262545))

(assert (not b!262547))

(assert (not start!57270))

(assert (not b!262546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88556 () Bool)

(declare-fun e!182851 () Bool)

(assert (=> d!88556 e!182851))

(declare-fun res!219725 () Bool)

(assert (=> d!88556 (=> (not res!219725) (not e!182851))))

(declare-fun lt!404225 () (_ BitVec 64))

(declare-fun lt!404222 () (_ BitVec 64))

(declare-fun lt!404223 () (_ BitVec 64))

(assert (=> d!88556 (= res!219725 (= lt!404225 (bvsub lt!404222 lt!404223)))))

(assert (=> d!88556 (or (= (bvand lt!404222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404223 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404222 lt!404223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88556 (= lt!404223 (remainingBits!0 ((_ sign_extend 32) (size!6391 (buf!6859 w1!584))) ((_ sign_extend 32) (currentByte!12699 w1!584)) ((_ sign_extend 32) (currentBit!12694 w1!584))))))

(declare-fun lt!404224 () (_ BitVec 64))

(declare-fun lt!404220 () (_ BitVec 64))

(assert (=> d!88556 (= lt!404222 (bvmul lt!404224 lt!404220))))

(assert (=> d!88556 (or (= lt!404224 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404220 (bvsdiv (bvmul lt!404224 lt!404220) lt!404224)))))

(assert (=> d!88556 (= lt!404220 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88556 (= lt!404224 ((_ sign_extend 32) (size!6391 (buf!6859 w1!584))))))

(assert (=> d!88556 (= lt!404225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12699 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12694 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88556 (invariant!0 (currentBit!12694 w1!584) (currentByte!12699 w1!584) (size!6391 (buf!6859 w1!584)))))

(assert (=> d!88556 (= (bitIndex!0 (size!6391 (buf!6859 w1!584)) (currentByte!12699 w1!584) (currentBit!12694 w1!584)) lt!404225)))

(declare-fun b!262584 () Bool)

(declare-fun res!219726 () Bool)

(assert (=> b!262584 (=> (not res!219726) (not e!182851))))

(assert (=> b!262584 (= res!219726 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404225))))

(declare-fun b!262585 () Bool)

(declare-fun lt!404221 () (_ BitVec 64))

(assert (=> b!262585 (= e!182851 (bvsle lt!404225 (bvmul lt!404221 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262585 (or (= lt!404221 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404221 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404221)))))

(assert (=> b!262585 (= lt!404221 ((_ sign_extend 32) (size!6391 (buf!6859 w1!584))))))

(assert (= (and d!88556 res!219725) b!262584))

(assert (= (and b!262584 res!219726) b!262585))

(declare-fun m!392711 () Bool)

(assert (=> d!88556 m!392711))

(declare-fun m!392713 () Bool)

(assert (=> d!88556 m!392713))

(assert (=> b!262545 d!88556))

(declare-fun d!88568 () Bool)

(assert (=> d!88568 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404240 () Unit!18725)

(declare-fun choose!11 (BitStream!11596) Unit!18725)

(assert (=> d!88568 (= lt!404240 (choose!11 w2!580))))

(assert (=> d!88568 (= (lemmaIsPrefixRefl!0 w2!580) lt!404240)))

(declare-fun bs!22459 () Bool)

(assert (= bs!22459 d!88568))

(assert (=> bs!22459 m!392653))

(declare-fun m!392723 () Bool)

(assert (=> bs!22459 m!392723))

(assert (=> b!262544 d!88568))

(declare-fun d!88574 () Bool)

(assert (=> d!88574 (isPrefixOf!0 lt!404152 lt!404152)))

(declare-fun lt!404241 () Unit!18725)

(assert (=> d!88574 (= lt!404241 (choose!11 lt!404152))))

(assert (=> d!88574 (= (lemmaIsPrefixRefl!0 lt!404152) lt!404241)))

(declare-fun bs!22460 () Bool)

(assert (= bs!22460 d!88574))

(assert (=> bs!22460 m!392649))

(declare-fun m!392725 () Bool)

(assert (=> bs!22460 m!392725))

(assert (=> b!262544 d!88574))

(declare-fun d!88576 () Bool)

(assert (=> d!88576 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404242 () Unit!18725)

(assert (=> d!88576 (= lt!404242 (choose!11 w1!584))))

(assert (=> d!88576 (= (lemmaIsPrefixRefl!0 w1!584) lt!404242)))

(declare-fun bs!22462 () Bool)

(assert (= bs!22462 d!88576))

(assert (=> bs!22462 m!392651))

(declare-fun m!392727 () Bool)

(assert (=> bs!22462 m!392727))

(assert (=> b!262544 d!88576))

(declare-fun d!88578 () Bool)

(declare-fun res!219753 () Bool)

(declare-fun e!182869 () Bool)

(assert (=> d!88578 (=> (not res!219753) (not e!182869))))

(assert (=> d!88578 (= res!219753 (= (size!6391 (buf!6859 lt!404152)) (size!6391 (buf!6859 lt!404152))))))

(assert (=> d!88578 (= (isPrefixOf!0 lt!404152 lt!404152) e!182869)))

(declare-fun b!262611 () Bool)

(declare-fun res!219752 () Bool)

(assert (=> b!262611 (=> (not res!219752) (not e!182869))))

(assert (=> b!262611 (= res!219752 (bvsle (bitIndex!0 (size!6391 (buf!6859 lt!404152)) (currentByte!12699 lt!404152) (currentBit!12694 lt!404152)) (bitIndex!0 (size!6391 (buf!6859 lt!404152)) (currentByte!12699 lt!404152) (currentBit!12694 lt!404152))))))

(declare-fun b!262612 () Bool)

(declare-fun e!182868 () Bool)

(assert (=> b!262612 (= e!182869 e!182868)))

(declare-fun res!219754 () Bool)

(assert (=> b!262612 (=> res!219754 e!182868)))

(assert (=> b!262612 (= res!219754 (= (size!6391 (buf!6859 lt!404152)) #b00000000000000000000000000000000))))

(declare-fun b!262613 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14639 array!14639 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262613 (= e!182868 (arrayBitRangesEq!0 (buf!6859 lt!404152) (buf!6859 lt!404152) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6391 (buf!6859 lt!404152)) (currentByte!12699 lt!404152) (currentBit!12694 lt!404152))))))

(assert (= (and d!88578 res!219753) b!262611))

(assert (= (and b!262611 res!219752) b!262612))

(assert (= (and b!262612 (not res!219754)) b!262613))

(declare-fun m!392741 () Bool)

(assert (=> b!262611 m!392741))

(assert (=> b!262611 m!392741))

(assert (=> b!262613 m!392741))

(assert (=> b!262613 m!392741))

(declare-fun m!392743 () Bool)

(assert (=> b!262613 m!392743))

(assert (=> b!262544 d!88578))

(declare-fun d!88592 () Bool)

(declare-fun res!219756 () Bool)

(declare-fun e!182871 () Bool)

(assert (=> d!88592 (=> (not res!219756) (not e!182871))))

(assert (=> d!88592 (= res!219756 (= (size!6391 (buf!6859 w1!584)) (size!6391 (buf!6859 w1!584))))))

(assert (=> d!88592 (= (isPrefixOf!0 w1!584 w1!584) e!182871)))

(declare-fun b!262614 () Bool)

(declare-fun res!219755 () Bool)

(assert (=> b!262614 (=> (not res!219755) (not e!182871))))

(assert (=> b!262614 (= res!219755 (bvsle (bitIndex!0 (size!6391 (buf!6859 w1!584)) (currentByte!12699 w1!584) (currentBit!12694 w1!584)) (bitIndex!0 (size!6391 (buf!6859 w1!584)) (currentByte!12699 w1!584) (currentBit!12694 w1!584))))))

(declare-fun b!262615 () Bool)

(declare-fun e!182870 () Bool)

(assert (=> b!262615 (= e!182871 e!182870)))

(declare-fun res!219757 () Bool)

(assert (=> b!262615 (=> res!219757 e!182870)))

(assert (=> b!262615 (= res!219757 (= (size!6391 (buf!6859 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262616 () Bool)

(assert (=> b!262616 (= e!182870 (arrayBitRangesEq!0 (buf!6859 w1!584) (buf!6859 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6391 (buf!6859 w1!584)) (currentByte!12699 w1!584) (currentBit!12694 w1!584))))))

(assert (= (and d!88592 res!219756) b!262614))

(assert (= (and b!262614 res!219755) b!262615))

(assert (= (and b!262615 (not res!219757)) b!262616))

(assert (=> b!262614 m!392643))

(assert (=> b!262614 m!392643))

(assert (=> b!262616 m!392643))

(assert (=> b!262616 m!392643))

(declare-fun m!392745 () Bool)

(assert (=> b!262616 m!392745))

(assert (=> b!262544 d!88592))

(declare-fun d!88594 () Bool)

(declare-fun res!219762 () Bool)

(declare-fun e!182875 () Bool)

(assert (=> d!88594 (=> (not res!219762) (not e!182875))))

(assert (=> d!88594 (= res!219762 (= (size!6391 (buf!6859 w2!580)) (size!6391 (buf!6859 w2!580))))))

(assert (=> d!88594 (= (isPrefixOf!0 w2!580 w2!580) e!182875)))

(declare-fun b!262620 () Bool)

(declare-fun res!219761 () Bool)

(assert (=> b!262620 (=> (not res!219761) (not e!182875))))

(assert (=> b!262620 (= res!219761 (bvsle (bitIndex!0 (size!6391 (buf!6859 w2!580)) (currentByte!12699 w2!580) (currentBit!12694 w2!580)) (bitIndex!0 (size!6391 (buf!6859 w2!580)) (currentByte!12699 w2!580) (currentBit!12694 w2!580))))))

(declare-fun b!262621 () Bool)

(declare-fun e!182874 () Bool)

(assert (=> b!262621 (= e!182875 e!182874)))

(declare-fun res!219763 () Bool)

(assert (=> b!262621 (=> res!219763 e!182874)))

(assert (=> b!262621 (= res!219763 (= (size!6391 (buf!6859 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262622 () Bool)

(assert (=> b!262622 (= e!182874 (arrayBitRangesEq!0 (buf!6859 w2!580) (buf!6859 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6391 (buf!6859 w2!580)) (currentByte!12699 w2!580) (currentBit!12694 w2!580))))))

(assert (= (and d!88594 res!219762) b!262620))

(assert (= (and b!262620 res!219761) b!262621))

(assert (= (and b!262621 (not res!219763)) b!262622))

(declare-fun m!392751 () Bool)

(assert (=> b!262620 m!392751))

(assert (=> b!262620 m!392751))

(assert (=> b!262622 m!392751))

(assert (=> b!262622 m!392751))

(declare-fun m!392755 () Bool)

(assert (=> b!262622 m!392755))

(assert (=> b!262544 d!88594))

(declare-fun d!88600 () Bool)

(declare-fun res!219768 () Bool)

(declare-fun e!182879 () Bool)

(assert (=> d!88600 (=> (not res!219768) (not e!182879))))

(assert (=> d!88600 (= res!219768 (= (size!6391 (buf!6859 w1!584)) (size!6391 (buf!6859 w2!580))))))

(assert (=> d!88600 (= (isPrefixOf!0 w1!584 w2!580) e!182879)))

(declare-fun b!262626 () Bool)

(declare-fun res!219767 () Bool)

(assert (=> b!262626 (=> (not res!219767) (not e!182879))))

(assert (=> b!262626 (= res!219767 (bvsle (bitIndex!0 (size!6391 (buf!6859 w1!584)) (currentByte!12699 w1!584) (currentBit!12694 w1!584)) (bitIndex!0 (size!6391 (buf!6859 w2!580)) (currentByte!12699 w2!580) (currentBit!12694 w2!580))))))

(declare-fun b!262627 () Bool)

(declare-fun e!182878 () Bool)

(assert (=> b!262627 (= e!182879 e!182878)))

(declare-fun res!219769 () Bool)

(assert (=> b!262627 (=> res!219769 e!182878)))

(assert (=> b!262627 (= res!219769 (= (size!6391 (buf!6859 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262628 () Bool)

(assert (=> b!262628 (= e!182878 (arrayBitRangesEq!0 (buf!6859 w1!584) (buf!6859 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6391 (buf!6859 w1!584)) (currentByte!12699 w1!584) (currentBit!12694 w1!584))))))

(assert (= (and d!88600 res!219768) b!262626))

(assert (= (and b!262626 res!219767) b!262627))

(assert (= (and b!262627 (not res!219769)) b!262628))

(assert (=> b!262626 m!392643))

(assert (=> b!262626 m!392751))

(assert (=> b!262628 m!392643))

(assert (=> b!262628 m!392643))

(declare-fun m!392763 () Bool)

(assert (=> b!262628 m!392763))

(assert (=> start!57270 d!88600))

(declare-fun d!88608 () Bool)

(assert (=> d!88608 (= (inv!12 w1!584) (invariant!0 (currentBit!12694 w1!584) (currentByte!12699 w1!584) (size!6391 (buf!6859 w1!584))))))

(declare-fun bs!22472 () Bool)

(assert (= bs!22472 d!88608))

(assert (=> bs!22472 m!392713))

(assert (=> start!57270 d!88608))

(declare-fun d!88618 () Bool)

(assert (=> d!88618 (= (inv!12 w2!580) (invariant!0 (currentBit!12694 w2!580) (currentByte!12699 w2!580) (size!6391 (buf!6859 w2!580))))))

(declare-fun bs!22473 () Bool)

(assert (= bs!22473 d!88618))

(declare-fun m!392777 () Bool)

(assert (=> bs!22473 m!392777))

(assert (=> start!57270 d!88618))

(declare-fun d!88620 () Bool)

(assert (=> d!88620 (= (array_inv!6115 (buf!6859 w2!580)) (bvsge (size!6391 (buf!6859 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262547 d!88620))

(declare-fun d!88622 () Bool)

(assert (=> d!88622 (= (array_inv!6115 (buf!6859 w1!584)) (bvsge (size!6391 (buf!6859 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262546 d!88622))

(push 1)

(assert (not b!262626))

(assert (not b!262628))

(assert (not b!262611))

(assert (not d!88556))

(assert (not d!88568))

(assert (not b!262620))

(assert (not d!88574))

(assert (not b!262614))

(assert (not d!88576))

(assert (not d!88618))

(assert (not d!88608))

(assert (not b!262622))

(assert (not b!262613))

(assert (not b!262616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

