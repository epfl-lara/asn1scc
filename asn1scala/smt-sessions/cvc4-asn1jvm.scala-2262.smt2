; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57274 () Bool)

(assert start!57274)

(declare-fun b!262568 () Bool)

(declare-fun e!182843 () Bool)

(declare-fun e!182839 () Bool)

(assert (=> b!262568 (= e!182843 (not e!182839))))

(declare-fun res!219712 () Bool)

(assert (=> b!262568 (=> res!219712 e!182839)))

(declare-datatypes ((array!14643 0))(
  ( (array!14644 (arr!7380 (Array (_ BitVec 32) (_ BitVec 8))) (size!6393 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11600 0))(
  ( (BitStream!11601 (buf!6861 array!14643) (currentByte!12701 (_ BitVec 32)) (currentBit!12696 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11600)

(assert (=> b!262568 (= res!219712 (= (size!6393 (buf!6861 w1!584)) #b00000000000000000000000000000000))))

(declare-fun w2!580 () BitStream!11600)

(declare-fun isPrefixOf!0 (BitStream!11600 BitStream!11600) Bool)

(assert (=> b!262568 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18729 0))(
  ( (Unit!18730) )
))
(declare-fun lt!404182 () Unit!18729)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11600) Unit!18729)

(assert (=> b!262568 (= lt!404182 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404181 () BitStream!11600)

(assert (=> b!262568 (isPrefixOf!0 lt!404181 lt!404181)))

(declare-fun lt!404180 () Unit!18729)

(assert (=> b!262568 (= lt!404180 (lemmaIsPrefixRefl!0 lt!404181))))

(assert (=> b!262568 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404183 () Unit!18729)

(assert (=> b!262568 (= lt!404183 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262568 (= lt!404181 (BitStream!11601 (buf!6861 w2!580) (currentByte!12701 w1!584) (currentBit!12696 w1!584)))))

(declare-fun res!219711 () Bool)

(assert (=> start!57274 (=> (not res!219711) (not e!182843))))

(assert (=> start!57274 (= res!219711 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57274 e!182843))

(declare-fun e!182841 () Bool)

(declare-fun inv!12 (BitStream!11600) Bool)

(assert (=> start!57274 (and (inv!12 w1!584) e!182841)))

(declare-fun e!182840 () Bool)

(assert (=> start!57274 (and (inv!12 w2!580) e!182840)))

(declare-fun b!262569 () Bool)

(assert (=> b!262569 (= e!182839 (bvsle (size!6393 (buf!6861 w1!584)) (size!6393 (buf!6861 w2!580))))))

(declare-fun lt!404179 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262569 (= lt!404179 (bitIndex!0 (size!6393 (buf!6861 w1!584)) (currentByte!12701 w1!584) (currentBit!12696 w1!584)))))

(declare-fun b!262570 () Bool)

(declare-fun array_inv!6117 (array!14643) Bool)

(assert (=> b!262570 (= e!182841 (array_inv!6117 (buf!6861 w1!584)))))

(declare-fun b!262571 () Bool)

(assert (=> b!262571 (= e!182840 (array_inv!6117 (buf!6861 w2!580)))))

(assert (= (and start!57274 res!219711) b!262568))

(assert (= (and b!262568 (not res!219712)) b!262569))

(assert (= start!57274 b!262570))

(assert (= start!57274 b!262571))

(declare-fun m!392687 () Bool)

(assert (=> b!262571 m!392687))

(declare-fun m!392689 () Bool)

(assert (=> b!262569 m!392689))

(declare-fun m!392691 () Bool)

(assert (=> start!57274 m!392691))

(declare-fun m!392693 () Bool)

(assert (=> start!57274 m!392693))

(declare-fun m!392695 () Bool)

(assert (=> start!57274 m!392695))

(declare-fun m!392697 () Bool)

(assert (=> b!262568 m!392697))

(declare-fun m!392699 () Bool)

(assert (=> b!262568 m!392699))

(declare-fun m!392701 () Bool)

(assert (=> b!262568 m!392701))

(declare-fun m!392703 () Bool)

(assert (=> b!262568 m!392703))

(declare-fun m!392705 () Bool)

(assert (=> b!262568 m!392705))

(declare-fun m!392707 () Bool)

(assert (=> b!262568 m!392707))

(declare-fun m!392709 () Bool)

(assert (=> b!262570 m!392709))

(push 1)

(assert (not b!262568))

(assert (not b!262570))

(assert (not start!57274))

(assert (not b!262571))

(assert (not b!262569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88562 () Bool)

(assert (=> d!88562 (= (array_inv!6117 (buf!6861 w2!580)) (bvsge (size!6393 (buf!6861 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262571 d!88562))

(declare-fun d!88564 () Bool)

(assert (=> d!88564 (= (array_inv!6117 (buf!6861 w1!584)) (bvsge (size!6393 (buf!6861 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262570 d!88564))

(declare-fun d!88566 () Bool)

(declare-fun e!182853 () Bool)

(assert (=> d!88566 e!182853))

(declare-fun res!219730 () Bool)

(assert (=> d!88566 (=> (not res!219730) (not e!182853))))

(declare-fun lt!404237 () (_ BitVec 64))

(declare-fun lt!404234 () (_ BitVec 64))

(declare-fun lt!404235 () (_ BitVec 64))

(assert (=> d!88566 (= res!219730 (= lt!404234 (bvsub lt!404235 lt!404237)))))

(assert (=> d!88566 (or (= (bvand lt!404235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404237 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404235 lt!404237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88566 (= lt!404237 (remainingBits!0 ((_ sign_extend 32) (size!6393 (buf!6861 w1!584))) ((_ sign_extend 32) (currentByte!12701 w1!584)) ((_ sign_extend 32) (currentBit!12696 w1!584))))))

(declare-fun lt!404236 () (_ BitVec 64))

(declare-fun lt!404233 () (_ BitVec 64))

(assert (=> d!88566 (= lt!404235 (bvmul lt!404236 lt!404233))))

(assert (=> d!88566 (or (= lt!404236 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404233 (bvsdiv (bvmul lt!404236 lt!404233) lt!404236)))))

(assert (=> d!88566 (= lt!404233 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88566 (= lt!404236 ((_ sign_extend 32) (size!6393 (buf!6861 w1!584))))))

(assert (=> d!88566 (= lt!404234 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12701 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12696 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88566 (invariant!0 (currentBit!12696 w1!584) (currentByte!12701 w1!584) (size!6393 (buf!6861 w1!584)))))

(assert (=> d!88566 (= (bitIndex!0 (size!6393 (buf!6861 w1!584)) (currentByte!12701 w1!584) (currentBit!12696 w1!584)) lt!404234)))

(declare-fun b!262588 () Bool)

(declare-fun res!219729 () Bool)

(assert (=> b!262588 (=> (not res!219729) (not e!182853))))

(assert (=> b!262588 (= res!219729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404234))))

(declare-fun b!262589 () Bool)

(declare-fun lt!404232 () (_ BitVec 64))

(assert (=> b!262589 (= e!182853 (bvsle lt!404234 (bvmul lt!404232 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262589 (or (= lt!404232 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404232 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404232)))))

(assert (=> b!262589 (= lt!404232 ((_ sign_extend 32) (size!6393 (buf!6861 w1!584))))))

(assert (= (and d!88566 res!219730) b!262588))

(assert (= (and b!262588 res!219729) b!262589))

(declare-fun m!392719 () Bool)

(assert (=> d!88566 m!392719))

(declare-fun m!392721 () Bool)

(assert (=> d!88566 m!392721))

(assert (=> b!262569 d!88566))

(declare-fun d!88572 () Bool)

(assert (=> d!88572 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404245 () Unit!18729)

(declare-fun choose!11 (BitStream!11600) Unit!18729)

(assert (=> d!88572 (= lt!404245 (choose!11 w2!580))))

(assert (=> d!88572 (= (lemmaIsPrefixRefl!0 w2!580) lt!404245)))

(declare-fun bs!22463 () Bool)

(assert (= bs!22463 d!88572))

(assert (=> bs!22463 m!392705))

(declare-fun m!392729 () Bool)

(assert (=> bs!22463 m!392729))

(assert (=> b!262568 d!88572))

(declare-fun d!88580 () Bool)

(assert (=> d!88580 (isPrefixOf!0 lt!404181 lt!404181)))

(declare-fun lt!404246 () Unit!18729)

(assert (=> d!88580 (= lt!404246 (choose!11 lt!404181))))

(assert (=> d!88580 (= (lemmaIsPrefixRefl!0 lt!404181) lt!404246)))

(declare-fun bs!22464 () Bool)

(assert (= bs!22464 d!88580))

(assert (=> bs!22464 m!392699))

(declare-fun m!392731 () Bool)

(assert (=> bs!22464 m!392731))

(assert (=> b!262568 d!88580))

(declare-fun d!88582 () Bool)

(assert (=> d!88582 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404247 () Unit!18729)

(assert (=> d!88582 (= lt!404247 (choose!11 w1!584))))

(assert (=> d!88582 (= (lemmaIsPrefixRefl!0 w1!584) lt!404247)))

(declare-fun bs!22465 () Bool)

(assert (= bs!22465 d!88582))

(assert (=> bs!22465 m!392703))

(declare-fun m!392733 () Bool)

(assert (=> bs!22465 m!392733))

(assert (=> b!262568 d!88582))

(declare-fun d!88584 () Bool)

(declare-fun res!219758 () Bool)

(declare-fun e!182872 () Bool)

(assert (=> d!88584 (=> (not res!219758) (not e!182872))))

(assert (=> d!88584 (= res!219758 (= (size!6393 (buf!6861 lt!404181)) (size!6393 (buf!6861 lt!404181))))))

(assert (=> d!88584 (= (isPrefixOf!0 lt!404181 lt!404181) e!182872)))

(declare-fun b!262617 () Bool)

(declare-fun res!219760 () Bool)

(assert (=> b!262617 (=> (not res!219760) (not e!182872))))

(assert (=> b!262617 (= res!219760 (bvsle (bitIndex!0 (size!6393 (buf!6861 lt!404181)) (currentByte!12701 lt!404181) (currentBit!12696 lt!404181)) (bitIndex!0 (size!6393 (buf!6861 lt!404181)) (currentByte!12701 lt!404181) (currentBit!12696 lt!404181))))))

(declare-fun b!262618 () Bool)

(declare-fun e!182873 () Bool)

(assert (=> b!262618 (= e!182872 e!182873)))

(declare-fun res!219759 () Bool)

(assert (=> b!262618 (=> res!219759 e!182873)))

(assert (=> b!262618 (= res!219759 (= (size!6393 (buf!6861 lt!404181)) #b00000000000000000000000000000000))))

(declare-fun b!262619 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14643 array!14643 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262619 (= e!182873 (arrayBitRangesEq!0 (buf!6861 lt!404181) (buf!6861 lt!404181) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6393 (buf!6861 lt!404181)) (currentByte!12701 lt!404181) (currentBit!12696 lt!404181))))))

(assert (= (and d!88584 res!219758) b!262617))

(assert (= (and b!262617 res!219760) b!262618))

(assert (= (and b!262618 (not res!219759)) b!262619))

(declare-fun m!392747 () Bool)

(assert (=> b!262617 m!392747))

(assert (=> b!262617 m!392747))

(assert (=> b!262619 m!392747))

(assert (=> b!262619 m!392747))

(declare-fun m!392749 () Bool)

(assert (=> b!262619 m!392749))

(assert (=> b!262568 d!88584))

(declare-fun d!88596 () Bool)

(declare-fun res!219764 () Bool)

(declare-fun e!182876 () Bool)

(assert (=> d!88596 (=> (not res!219764) (not e!182876))))

(assert (=> d!88596 (= res!219764 (= (size!6393 (buf!6861 w1!584)) (size!6393 (buf!6861 w1!584))))))

(assert (=> d!88596 (= (isPrefixOf!0 w1!584 w1!584) e!182876)))

(declare-fun b!262623 () Bool)

(declare-fun res!219766 () Bool)

(assert (=> b!262623 (=> (not res!219766) (not e!182876))))

(assert (=> b!262623 (= res!219766 (bvsle (bitIndex!0 (size!6393 (buf!6861 w1!584)) (currentByte!12701 w1!584) (currentBit!12696 w1!584)) (bitIndex!0 (size!6393 (buf!6861 w1!584)) (currentByte!12701 w1!584) (currentBit!12696 w1!584))))))

(declare-fun b!262624 () Bool)

(declare-fun e!182877 () Bool)

(assert (=> b!262624 (= e!182876 e!182877)))

(declare-fun res!219765 () Bool)

(assert (=> b!262624 (=> res!219765 e!182877)))

(assert (=> b!262624 (= res!219765 (= (size!6393 (buf!6861 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262625 () Bool)

(assert (=> b!262625 (= e!182877 (arrayBitRangesEq!0 (buf!6861 w1!584) (buf!6861 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6393 (buf!6861 w1!584)) (currentByte!12701 w1!584) (currentBit!12696 w1!584))))))

(assert (= (and d!88596 res!219764) b!262623))

(assert (= (and b!262623 res!219766) b!262624))

(assert (= (and b!262624 (not res!219765)) b!262625))

(assert (=> b!262623 m!392689))

(assert (=> b!262623 m!392689))

(assert (=> b!262625 m!392689))

(assert (=> b!262625 m!392689))

(declare-fun m!392759 () Bool)

(assert (=> b!262625 m!392759))

(assert (=> b!262568 d!88596))

(declare-fun d!88604 () Bool)

(declare-fun res!219770 () Bool)

(declare-fun e!182880 () Bool)

(assert (=> d!88604 (=> (not res!219770) (not e!182880))))

(assert (=> d!88604 (= res!219770 (= (size!6393 (buf!6861 w2!580)) (size!6393 (buf!6861 w2!580))))))

(assert (=> d!88604 (= (isPrefixOf!0 w2!580 w2!580) e!182880)))

(declare-fun b!262629 () Bool)

(declare-fun res!219772 () Bool)

(assert (=> b!262629 (=> (not res!219772) (not e!182880))))

(assert (=> b!262629 (= res!219772 (bvsle (bitIndex!0 (size!6393 (buf!6861 w2!580)) (currentByte!12701 w2!580) (currentBit!12696 w2!580)) (bitIndex!0 (size!6393 (buf!6861 w2!580)) (currentByte!12701 w2!580) (currentBit!12696 w2!580))))))

(declare-fun b!262630 () Bool)

(declare-fun e!182881 () Bool)

(assert (=> b!262630 (= e!182880 e!182881)))

(declare-fun res!219771 () Bool)

(assert (=> b!262630 (=> res!219771 e!182881)))

(assert (=> b!262630 (= res!219771 (= (size!6393 (buf!6861 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262631 () Bool)

(assert (=> b!262631 (= e!182881 (arrayBitRangesEq!0 (buf!6861 w2!580) (buf!6861 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6393 (buf!6861 w2!580)) (currentByte!12701 w2!580) (currentBit!12696 w2!580))))))

(assert (= (and d!88604 res!219770) b!262629))

(assert (= (and b!262629 res!219772) b!262630))

(assert (= (and b!262630 (not res!219771)) b!262631))

(declare-fun m!392765 () Bool)

(assert (=> b!262629 m!392765))

(assert (=> b!262629 m!392765))

(assert (=> b!262631 m!392765))

(assert (=> b!262631 m!392765))

(declare-fun m!392769 () Bool)

(assert (=> b!262631 m!392769))

(assert (=> b!262568 d!88604))

(declare-fun d!88610 () Bool)

(declare-fun res!219776 () Bool)

(declare-fun e!182884 () Bool)

(assert (=> d!88610 (=> (not res!219776) (not e!182884))))

(assert (=> d!88610 (= res!219776 (= (size!6393 (buf!6861 w1!584)) (size!6393 (buf!6861 w2!580))))))

(assert (=> d!88610 (= (isPrefixOf!0 w1!584 w2!580) e!182884)))

(declare-fun b!262635 () Bool)

(declare-fun res!219778 () Bool)

(assert (=> b!262635 (=> (not res!219778) (not e!182884))))

(assert (=> b!262635 (= res!219778 (bvsle (bitIndex!0 (size!6393 (buf!6861 w1!584)) (currentByte!12701 w1!584) (currentBit!12696 w1!584)) (bitIndex!0 (size!6393 (buf!6861 w2!580)) (currentByte!12701 w2!580) (currentBit!12696 w2!580))))))

(declare-fun b!262636 () Bool)

(declare-fun e!182885 () Bool)

(assert (=> b!262636 (= e!182884 e!182885)))

(declare-fun res!219777 () Bool)

(assert (=> b!262636 (=> res!219777 e!182885)))

(assert (=> b!262636 (= res!219777 (= (size!6393 (buf!6861 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262637 () Bool)

(assert (=> b!262637 (= e!182885 (arrayBitRangesEq!0 (buf!6861 w1!584) (buf!6861 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6393 (buf!6861 w1!584)) (currentByte!12701 w1!584) (currentBit!12696 w1!584))))))

(assert (= (and d!88610 res!219776) b!262635))

(assert (= (and b!262635 res!219778) b!262636))

(assert (= (and b!262636 (not res!219777)) b!262637))

(assert (=> b!262635 m!392689))

(assert (=> b!262635 m!392765))

(assert (=> b!262637 m!392689))

(assert (=> b!262637 m!392689))

(declare-fun m!392773 () Bool)

(assert (=> b!262637 m!392773))

(assert (=> start!57274 d!88610))

(declare-fun d!88614 () Bool)

(assert (=> d!88614 (= (inv!12 w1!584) (invariant!0 (currentBit!12696 w1!584) (currentByte!12701 w1!584) (size!6393 (buf!6861 w1!584))))))

(declare-fun bs!22474 () Bool)

(assert (= bs!22474 d!88614))

(assert (=> bs!22474 m!392721))

(assert (=> start!57274 d!88614))

(declare-fun d!88624 () Bool)

(assert (=> d!88624 (= (inv!12 w2!580) (invariant!0 (currentBit!12696 w2!580) (currentByte!12701 w2!580) (size!6393 (buf!6861 w2!580))))))

(declare-fun bs!22475 () Bool)

(assert (= bs!22475 d!88624))

(declare-fun m!392781 () Bool)

(assert (=> bs!22475 m!392781))

(assert (=> start!57274 d!88624))

(push 1)

(assert (not b!262635))

(assert (not d!88566))

(assert (not b!262629))

(assert (not b!262637))

(assert (not b!262625))

(assert (not d!88572))

(assert (not d!88582))

(assert (not d!88614))

(assert (not d!88624))

(assert (not b!262619))

(assert (not b!262631))

(assert (not b!262623))

(assert (not b!262617))

(assert (not d!88580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

