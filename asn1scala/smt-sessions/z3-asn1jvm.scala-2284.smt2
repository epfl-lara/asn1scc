; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57896 () Bool)

(assert start!57896)

(declare-fun b!265677 () Bool)

(declare-fun e!185694 () Bool)

(declare-datatypes ((array!14809 0))(
  ( (array!14810 (arr!7445 (Array (_ BitVec 32) (_ BitVec 8))) (size!6458 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11730 0))(
  ( (BitStream!11731 (buf!6926 array!14809) (currentByte!12811 (_ BitVec 32)) (currentBit!12806 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11730)

(declare-fun array_inv!6182 (array!14809) Bool)

(assert (=> b!265677 (= e!185694 (array_inv!6182 (buf!6926 w2!580)))))

(declare-fun b!265678 () Bool)

(declare-fun e!185689 () Bool)

(declare-fun w1!584 () BitStream!11730)

(declare-fun arrayBitRangesEq!0 (array!14809 array!14809 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265678 (= e!185689 (not (arrayBitRangesEq!0 (buf!6926 w1!584) (buf!6926 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584)))))))

(declare-fun res!221983 () Bool)

(declare-fun e!185691 () Bool)

(assert (=> start!57896 (=> (not res!221983) (not e!185691))))

(declare-fun isPrefixOf!0 (BitStream!11730 BitStream!11730) Bool)

(assert (=> start!57896 (= res!221983 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57896 e!185691))

(declare-fun e!185690 () Bool)

(declare-fun inv!12 (BitStream!11730) Bool)

(assert (=> start!57896 (and (inv!12 w1!584) e!185690)))

(assert (=> start!57896 (and (inv!12 w2!580) e!185694)))

(declare-fun b!265679 () Bool)

(declare-fun e!185692 () Bool)

(assert (=> b!265679 (= e!185692 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584))))))

(declare-fun b!265680 () Bool)

(assert (=> b!265680 (= e!185691 (not e!185692))))

(declare-fun res!221984 () Bool)

(assert (=> b!265680 (=> res!221984 e!185692)))

(assert (=> b!265680 (= res!221984 e!185689)))

(declare-fun res!221986 () Bool)

(assert (=> b!265680 (=> (not res!221986) (not e!185689))))

(assert (=> b!265680 (= res!221986 (not (= (size!6458 (buf!6926 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!265680 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18883 0))(
  ( (Unit!18884) )
))
(declare-fun lt!406601 () Unit!18883)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11730) Unit!18883)

(assert (=> b!265680 (= lt!406601 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406604 () BitStream!11730)

(assert (=> b!265680 (isPrefixOf!0 lt!406604 lt!406604)))

(declare-fun lt!406603 () Unit!18883)

(assert (=> b!265680 (= lt!406603 (lemmaIsPrefixRefl!0 lt!406604))))

(assert (=> b!265680 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406602 () Unit!18883)

(assert (=> b!265680 (= lt!406602 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265680 (= lt!406604 (BitStream!11731 (buf!6926 w2!580) (currentByte!12811 w1!584) (currentBit!12806 w1!584)))))

(declare-fun b!265681 () Bool)

(declare-fun res!221985 () Bool)

(assert (=> b!265681 (=> res!221985 e!185692)))

(assert (=> b!265681 (= res!221985 (= (size!6458 (buf!6926 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265682 () Bool)

(assert (=> b!265682 (= e!185690 (array_inv!6182 (buf!6926 w1!584)))))

(assert (= (and start!57896 res!221983) b!265680))

(assert (= (and b!265680 res!221986) b!265678))

(assert (= (and b!265680 (not res!221984)) b!265681))

(assert (= (and b!265681 (not res!221985)) b!265679))

(assert (= start!57896 b!265682))

(assert (= start!57896 b!265677))

(declare-fun m!396445 () Bool)

(assert (=> b!265680 m!396445))

(declare-fun m!396447 () Bool)

(assert (=> b!265680 m!396447))

(declare-fun m!396449 () Bool)

(assert (=> b!265680 m!396449))

(declare-fun m!396451 () Bool)

(assert (=> b!265680 m!396451))

(declare-fun m!396453 () Bool)

(assert (=> b!265680 m!396453))

(declare-fun m!396455 () Bool)

(assert (=> b!265680 m!396455))

(declare-fun m!396457 () Bool)

(assert (=> start!57896 m!396457))

(declare-fun m!396459 () Bool)

(assert (=> start!57896 m!396459))

(declare-fun m!396461 () Bool)

(assert (=> start!57896 m!396461))

(declare-fun m!396463 () Bool)

(assert (=> b!265678 m!396463))

(assert (=> b!265678 m!396463))

(declare-fun m!396465 () Bool)

(assert (=> b!265678 m!396465))

(declare-fun m!396467 () Bool)

(assert (=> b!265682 m!396467))

(declare-fun m!396469 () Bool)

(assert (=> b!265677 m!396469))

(assert (=> b!265679 m!396463))

(check-sat (not b!265677) (not b!265678) (not b!265680) (not b!265679) (not b!265682) (not start!57896))
(check-sat)
(get-model)

(declare-fun d!89710 () Bool)

(assert (=> d!89710 (= (array_inv!6182 (buf!6926 w2!580)) (bvsge (size!6458 (buf!6926 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!265677 d!89710))

(declare-fun d!89720 () Bool)

(assert (=> d!89720 (= (array_inv!6182 (buf!6926 w1!584)) (bvsge (size!6458 (buf!6926 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!265682 d!89720))

(declare-fun d!89722 () Bool)

(declare-fun res!222021 () Bool)

(declare-fun e!185729 () Bool)

(assert (=> d!89722 (=> (not res!222021) (not e!185729))))

(assert (=> d!89722 (= res!222021 (= (size!6458 (buf!6926 w1!584)) (size!6458 (buf!6926 w2!580))))))

(assert (=> d!89722 (= (isPrefixOf!0 w1!584 w2!580) e!185729)))

(declare-fun b!265722 () Bool)

(declare-fun res!222020 () Bool)

(assert (=> b!265722 (=> (not res!222020) (not e!185729))))

(assert (=> b!265722 (= res!222020 (bvsle (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584)) (bitIndex!0 (size!6458 (buf!6926 w2!580)) (currentByte!12811 w2!580) (currentBit!12806 w2!580))))))

(declare-fun b!265723 () Bool)

(declare-fun e!185730 () Bool)

(assert (=> b!265723 (= e!185729 e!185730)))

(declare-fun res!222022 () Bool)

(assert (=> b!265723 (=> res!222022 e!185730)))

(assert (=> b!265723 (= res!222022 (= (size!6458 (buf!6926 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265724 () Bool)

(assert (=> b!265724 (= e!185730 (arrayBitRangesEq!0 (buf!6926 w1!584) (buf!6926 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584))))))

(assert (= (and d!89722 res!222021) b!265722))

(assert (= (and b!265722 res!222020) b!265723))

(assert (= (and b!265723 (not res!222022)) b!265724))

(assert (=> b!265722 m!396463))

(declare-fun m!396511 () Bool)

(assert (=> b!265722 m!396511))

(assert (=> b!265724 m!396463))

(assert (=> b!265724 m!396463))

(assert (=> b!265724 m!396465))

(assert (=> start!57896 d!89722))

(declare-fun d!89732 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89732 (= (inv!12 w1!584) (invariant!0 (currentBit!12806 w1!584) (currentByte!12811 w1!584) (size!6458 (buf!6926 w1!584))))))

(declare-fun bs!22775 () Bool)

(assert (= bs!22775 d!89732))

(declare-fun m!396513 () Bool)

(assert (=> bs!22775 m!396513))

(assert (=> start!57896 d!89732))

(declare-fun d!89734 () Bool)

(assert (=> d!89734 (= (inv!12 w2!580) (invariant!0 (currentBit!12806 w2!580) (currentByte!12811 w2!580) (size!6458 (buf!6926 w2!580))))))

(declare-fun bs!22776 () Bool)

(assert (= bs!22776 d!89734))

(declare-fun m!396517 () Bool)

(assert (=> bs!22776 m!396517))

(assert (=> start!57896 d!89734))

(declare-fun e!185802 () Bool)

(declare-fun b!265814 () Bool)

(declare-datatypes ((tuple4!374 0))(
  ( (tuple4!375 (_1!12167 (_ BitVec 32)) (_2!12167 (_ BitVec 32)) (_3!967 (_ BitVec 32)) (_4!187 (_ BitVec 32))) )
))
(declare-fun lt!406687 () tuple4!374)

(declare-fun arrayRangesEq!1023 (array!14809 array!14809 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!265814 (= e!185802 (arrayRangesEq!1023 (buf!6926 w1!584) (buf!6926 w2!580) (_1!12167 lt!406687) (_2!12167 lt!406687)))))

(declare-fun call!4148 () Bool)

(declare-fun bm!4145 () Bool)

(declare-fun lt!406689 () (_ BitVec 32))

(declare-fun c!12225 () Bool)

(declare-fun lt!406688 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4145 (= call!4148 (byteRangesEq!0 (select (arr!7445 (buf!6926 w1!584)) (_3!967 lt!406687)) (select (arr!7445 (buf!6926 w2!580)) (_3!967 lt!406687)) lt!406688 (ite c!12225 lt!406689 #b00000000000000000000000000001000)))))

(declare-fun b!265815 () Bool)

(declare-fun e!185804 () Bool)

(declare-fun e!185803 () Bool)

(assert (=> b!265815 (= e!185804 e!185803)))

(assert (=> b!265815 (= c!12225 (= (_3!967 lt!406687) (_4!187 lt!406687)))))

(declare-fun e!185801 () Bool)

(declare-fun b!265816 () Bool)

(assert (=> b!265816 (= e!185801 (byteRangesEq!0 (select (arr!7445 (buf!6926 w1!584)) (_4!187 lt!406687)) (select (arr!7445 (buf!6926 w2!580)) (_4!187 lt!406687)) #b00000000000000000000000000000000 lt!406689))))

(declare-fun b!265818 () Bool)

(assert (=> b!265818 (= e!185803 call!4148)))

(declare-fun b!265817 () Bool)

(declare-fun e!185800 () Bool)

(assert (=> b!265817 (= e!185803 e!185800)))

(declare-fun res!222097 () Bool)

(assert (=> b!265817 (= res!222097 call!4148)))

(assert (=> b!265817 (=> (not res!222097) (not e!185800))))

(declare-fun d!89738 () Bool)

(declare-fun res!222098 () Bool)

(declare-fun e!185805 () Bool)

(assert (=> d!89738 (=> res!222098 e!185805)))

(assert (=> d!89738 (= res!222098 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584))))))

(assert (=> d!89738 (= (arrayBitRangesEq!0 (buf!6926 w1!584) (buf!6926 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584))) e!185805)))

(declare-fun b!265819 () Bool)

(declare-fun res!222096 () Bool)

(assert (=> b!265819 (= res!222096 (= lt!406689 #b00000000000000000000000000000000))))

(assert (=> b!265819 (=> res!222096 e!185801)))

(assert (=> b!265819 (= e!185800 e!185801)))

(declare-fun b!265820 () Bool)

(assert (=> b!265820 (= e!185805 e!185804)))

(declare-fun res!222100 () Bool)

(assert (=> b!265820 (=> (not res!222100) (not e!185804))))

(assert (=> b!265820 (= res!222100 e!185802)))

(declare-fun res!222099 () Bool)

(assert (=> b!265820 (=> res!222099 e!185802)))

(assert (=> b!265820 (= res!222099 (bvsge (_1!12167 lt!406687) (_2!12167 lt!406687)))))

(assert (=> b!265820 (= lt!406689 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265820 (= lt!406688 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!374)

(assert (=> b!265820 (= lt!406687 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584))))))

(assert (= (and d!89738 (not res!222098)) b!265820))

(assert (= (and b!265820 (not res!222099)) b!265814))

(assert (= (and b!265820 res!222100) b!265815))

(assert (= (and b!265815 c!12225) b!265818))

(assert (= (and b!265815 (not c!12225)) b!265817))

(assert (= (and b!265817 res!222097) b!265819))

(assert (= (and b!265819 (not res!222096)) b!265816))

(assert (= (or b!265818 b!265817) bm!4145))

(declare-fun m!396579 () Bool)

(assert (=> b!265814 m!396579))

(declare-fun m!396581 () Bool)

(assert (=> bm!4145 m!396581))

(declare-fun m!396583 () Bool)

(assert (=> bm!4145 m!396583))

(assert (=> bm!4145 m!396581))

(assert (=> bm!4145 m!396583))

(declare-fun m!396585 () Bool)

(assert (=> bm!4145 m!396585))

(declare-fun m!396587 () Bool)

(assert (=> b!265816 m!396587))

(declare-fun m!396589 () Bool)

(assert (=> b!265816 m!396589))

(assert (=> b!265816 m!396587))

(assert (=> b!265816 m!396589))

(declare-fun m!396591 () Bool)

(assert (=> b!265816 m!396591))

(assert (=> b!265820 m!396463))

(declare-fun m!396593 () Bool)

(assert (=> b!265820 m!396593))

(assert (=> b!265678 d!89738))

(declare-fun d!89766 () Bool)

(declare-fun e!185808 () Bool)

(assert (=> d!89766 e!185808))

(declare-fun res!222105 () Bool)

(assert (=> d!89766 (=> (not res!222105) (not e!185808))))

(declare-fun lt!406702 () (_ BitVec 64))

(declare-fun lt!406706 () (_ BitVec 64))

(declare-fun lt!406707 () (_ BitVec 64))

(assert (=> d!89766 (= res!222105 (= lt!406702 (bvsub lt!406706 lt!406707)))))

(assert (=> d!89766 (or (= (bvand lt!406706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406707 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406706 lt!406707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89766 (= lt!406707 (remainingBits!0 ((_ sign_extend 32) (size!6458 (buf!6926 w1!584))) ((_ sign_extend 32) (currentByte!12811 w1!584)) ((_ sign_extend 32) (currentBit!12806 w1!584))))))

(declare-fun lt!406704 () (_ BitVec 64))

(declare-fun lt!406703 () (_ BitVec 64))

(assert (=> d!89766 (= lt!406706 (bvmul lt!406704 lt!406703))))

(assert (=> d!89766 (or (= lt!406704 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406703 (bvsdiv (bvmul lt!406704 lt!406703) lt!406704)))))

(assert (=> d!89766 (= lt!406703 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89766 (= lt!406704 ((_ sign_extend 32) (size!6458 (buf!6926 w1!584))))))

(assert (=> d!89766 (= lt!406702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12811 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12806 w1!584))))))

(assert (=> d!89766 (invariant!0 (currentBit!12806 w1!584) (currentByte!12811 w1!584) (size!6458 (buf!6926 w1!584)))))

(assert (=> d!89766 (= (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584)) lt!406702)))

(declare-fun b!265825 () Bool)

(declare-fun res!222106 () Bool)

(assert (=> b!265825 (=> (not res!222106) (not e!185808))))

(assert (=> b!265825 (= res!222106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406702))))

(declare-fun b!265826 () Bool)

(declare-fun lt!406705 () (_ BitVec 64))

(assert (=> b!265826 (= e!185808 (bvsle lt!406702 (bvmul lt!406705 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!265826 (or (= lt!406705 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406705 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406705)))))

(assert (=> b!265826 (= lt!406705 ((_ sign_extend 32) (size!6458 (buf!6926 w1!584))))))

(assert (= (and d!89766 res!222105) b!265825))

(assert (= (and b!265825 res!222106) b!265826))

(declare-fun m!396595 () Bool)

(assert (=> d!89766 m!396595))

(assert (=> d!89766 m!396513))

(assert (=> b!265678 d!89766))

(declare-fun d!89768 () Bool)

(assert (=> d!89768 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406710 () Unit!18883)

(declare-fun choose!11 (BitStream!11730) Unit!18883)

(assert (=> d!89768 (= lt!406710 (choose!11 w2!580))))

(assert (=> d!89768 (= (lemmaIsPrefixRefl!0 w2!580) lt!406710)))

(declare-fun bs!22785 () Bool)

(assert (= bs!22785 d!89768))

(assert (=> bs!22785 m!396451))

(declare-fun m!396597 () Bool)

(assert (=> bs!22785 m!396597))

(assert (=> b!265680 d!89768))

(declare-fun d!89770 () Bool)

(assert (=> d!89770 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406711 () Unit!18883)

(assert (=> d!89770 (= lt!406711 (choose!11 w1!584))))

(assert (=> d!89770 (= (lemmaIsPrefixRefl!0 w1!584) lt!406711)))

(declare-fun bs!22786 () Bool)

(assert (= bs!22786 d!89770))

(assert (=> bs!22786 m!396449))

(declare-fun m!396599 () Bool)

(assert (=> bs!22786 m!396599))

(assert (=> b!265680 d!89770))

(declare-fun d!89772 () Bool)

(declare-fun res!222108 () Bool)

(declare-fun e!185809 () Bool)

(assert (=> d!89772 (=> (not res!222108) (not e!185809))))

(assert (=> d!89772 (= res!222108 (= (size!6458 (buf!6926 lt!406604)) (size!6458 (buf!6926 lt!406604))))))

(assert (=> d!89772 (= (isPrefixOf!0 lt!406604 lt!406604) e!185809)))

(declare-fun b!265827 () Bool)

(declare-fun res!222107 () Bool)

(assert (=> b!265827 (=> (not res!222107) (not e!185809))))

(assert (=> b!265827 (= res!222107 (bvsle (bitIndex!0 (size!6458 (buf!6926 lt!406604)) (currentByte!12811 lt!406604) (currentBit!12806 lt!406604)) (bitIndex!0 (size!6458 (buf!6926 lt!406604)) (currentByte!12811 lt!406604) (currentBit!12806 lt!406604))))))

(declare-fun b!265828 () Bool)

(declare-fun e!185810 () Bool)

(assert (=> b!265828 (= e!185809 e!185810)))

(declare-fun res!222109 () Bool)

(assert (=> b!265828 (=> res!222109 e!185810)))

(assert (=> b!265828 (= res!222109 (= (size!6458 (buf!6926 lt!406604)) #b00000000000000000000000000000000))))

(declare-fun b!265829 () Bool)

(assert (=> b!265829 (= e!185810 (arrayBitRangesEq!0 (buf!6926 lt!406604) (buf!6926 lt!406604) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 lt!406604)) (currentByte!12811 lt!406604) (currentBit!12806 lt!406604))))))

(assert (= (and d!89772 res!222108) b!265827))

(assert (= (and b!265827 res!222107) b!265828))

(assert (= (and b!265828 (not res!222109)) b!265829))

(declare-fun m!396601 () Bool)

(assert (=> b!265827 m!396601))

(assert (=> b!265827 m!396601))

(assert (=> b!265829 m!396601))

(assert (=> b!265829 m!396601))

(declare-fun m!396603 () Bool)

(assert (=> b!265829 m!396603))

(assert (=> b!265680 d!89772))

(declare-fun d!89774 () Bool)

(assert (=> d!89774 (isPrefixOf!0 lt!406604 lt!406604)))

(declare-fun lt!406712 () Unit!18883)

(assert (=> d!89774 (= lt!406712 (choose!11 lt!406604))))

(assert (=> d!89774 (= (lemmaIsPrefixRefl!0 lt!406604) lt!406712)))

(declare-fun bs!22787 () Bool)

(assert (= bs!22787 d!89774))

(assert (=> bs!22787 m!396445))

(declare-fun m!396605 () Bool)

(assert (=> bs!22787 m!396605))

(assert (=> b!265680 d!89774))

(declare-fun d!89776 () Bool)

(declare-fun res!222111 () Bool)

(declare-fun e!185811 () Bool)

(assert (=> d!89776 (=> (not res!222111) (not e!185811))))

(assert (=> d!89776 (= res!222111 (= (size!6458 (buf!6926 w1!584)) (size!6458 (buf!6926 w1!584))))))

(assert (=> d!89776 (= (isPrefixOf!0 w1!584 w1!584) e!185811)))

(declare-fun b!265830 () Bool)

(declare-fun res!222110 () Bool)

(assert (=> b!265830 (=> (not res!222110) (not e!185811))))

(assert (=> b!265830 (= res!222110 (bvsle (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584)) (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584))))))

(declare-fun b!265831 () Bool)

(declare-fun e!185812 () Bool)

(assert (=> b!265831 (= e!185811 e!185812)))

(declare-fun res!222112 () Bool)

(assert (=> b!265831 (=> res!222112 e!185812)))

(assert (=> b!265831 (= res!222112 (= (size!6458 (buf!6926 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!265832 () Bool)

(assert (=> b!265832 (= e!185812 (arrayBitRangesEq!0 (buf!6926 w1!584) (buf!6926 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 w1!584)) (currentByte!12811 w1!584) (currentBit!12806 w1!584))))))

(assert (= (and d!89776 res!222111) b!265830))

(assert (= (and b!265830 res!222110) b!265831))

(assert (= (and b!265831 (not res!222112)) b!265832))

(assert (=> b!265830 m!396463))

(assert (=> b!265830 m!396463))

(assert (=> b!265832 m!396463))

(assert (=> b!265832 m!396463))

(declare-fun m!396607 () Bool)

(assert (=> b!265832 m!396607))

(assert (=> b!265680 d!89776))

(declare-fun d!89778 () Bool)

(declare-fun res!222114 () Bool)

(declare-fun e!185813 () Bool)

(assert (=> d!89778 (=> (not res!222114) (not e!185813))))

(assert (=> d!89778 (= res!222114 (= (size!6458 (buf!6926 w2!580)) (size!6458 (buf!6926 w2!580))))))

(assert (=> d!89778 (= (isPrefixOf!0 w2!580 w2!580) e!185813)))

(declare-fun b!265833 () Bool)

(declare-fun res!222113 () Bool)

(assert (=> b!265833 (=> (not res!222113) (not e!185813))))

(assert (=> b!265833 (= res!222113 (bvsle (bitIndex!0 (size!6458 (buf!6926 w2!580)) (currentByte!12811 w2!580) (currentBit!12806 w2!580)) (bitIndex!0 (size!6458 (buf!6926 w2!580)) (currentByte!12811 w2!580) (currentBit!12806 w2!580))))))

(declare-fun b!265834 () Bool)

(declare-fun e!185814 () Bool)

(assert (=> b!265834 (= e!185813 e!185814)))

(declare-fun res!222115 () Bool)

(assert (=> b!265834 (=> res!222115 e!185814)))

(assert (=> b!265834 (= res!222115 (= (size!6458 (buf!6926 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!265835 () Bool)

(assert (=> b!265835 (= e!185814 (arrayBitRangesEq!0 (buf!6926 w2!580) (buf!6926 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6458 (buf!6926 w2!580)) (currentByte!12811 w2!580) (currentBit!12806 w2!580))))))

(assert (= (and d!89778 res!222114) b!265833))

(assert (= (and b!265833 res!222113) b!265834))

(assert (= (and b!265834 (not res!222115)) b!265835))

(assert (=> b!265833 m!396511))

(assert (=> b!265833 m!396511))

(assert (=> b!265835 m!396511))

(assert (=> b!265835 m!396511))

(declare-fun m!396609 () Bool)

(assert (=> b!265835 m!396609))

(assert (=> b!265680 d!89778))

(assert (=> b!265679 d!89766))

(check-sat (not b!265833) (not d!89766) (not b!265724) (not b!265830) (not d!89774) (not bm!4145) (not d!89768) (not d!89770) (not d!89734) (not b!265827) (not b!265814) (not b!265829) (not d!89732) (not b!265816) (not b!265722) (not b!265832) (not b!265835) (not b!265820))
