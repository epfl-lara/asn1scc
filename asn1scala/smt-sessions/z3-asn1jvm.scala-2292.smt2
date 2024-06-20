; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58052 () Bool)

(assert start!58052)

(declare-fun b!266678 () Bool)

(declare-fun e!186621 () Bool)

(declare-fun e!186627 () Bool)

(assert (=> b!266678 (= e!186621 e!186627)))

(declare-fun res!222708 () Bool)

(assert (=> b!266678 (=> res!222708 e!186627)))

(declare-fun e!186629 () Bool)

(assert (=> b!266678 (= res!222708 e!186629)))

(declare-fun res!222707 () Bool)

(assert (=> b!266678 (=> (not res!222707) (not e!186629))))

(declare-datatypes ((array!14866 0))(
  ( (array!14867 (arr!7469 (Array (_ BitVec 32) (_ BitVec 8))) (size!6482 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11778 0))(
  ( (BitStream!11779 (buf!6950 array!14866) (currentByte!12844 (_ BitVec 32)) (currentBit!12839 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11778)

(assert (=> b!266678 (= res!222707 (not (= (size!6482 (buf!6950 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18944 0))(
  ( (Unit!18945) )
))
(declare-fun lt!407383 () Unit!18944)

(declare-fun e!186626 () Unit!18944)

(assert (=> b!266678 (= lt!407383 e!186626)))

(declare-fun c!12285 () Bool)

(assert (=> b!266678 (= c!12285 (not (= (size!6482 (buf!6950 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266679 () Bool)

(declare-fun w2!580 () BitStream!11778)

(declare-fun arrayBitRangesEq!0 (array!14866 array!14866 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266679 (= e!186629 (not (arrayBitRangesEq!0 (buf!6950 w2!580) (buf!6950 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)))))))

(declare-fun lt!407381 () (_ BitVec 64))

(declare-fun b!266680 () Bool)

(declare-fun lt!407382 () (_ BitVec 64))

(declare-fun lt!407389 () (_ BitVec 64))

(assert (=> b!266680 (= e!186627 (or (= lt!407382 (bvand lt!407381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!407382 (bvand (bvsub lt!407389 lt!407381) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!266680 (= lt!407382 (bvand lt!407389 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!266680 (= lt!407381 (bitIndex!0 (size!6482 (buf!6950 w2!580)) (currentByte!12844 w2!580) (currentBit!12839 w2!580)))))

(assert (=> b!266680 (= lt!407389 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)))))

(declare-fun lt!407380 () Unit!18944)

(declare-fun lt!407385 () BitStream!11778)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11778 BitStream!11778 BitStream!11778) Unit!18944)

(assert (=> b!266680 (= lt!407380 (lemmaIsPrefixTransitive!0 lt!407385 w2!580 w2!580))))

(declare-fun isPrefixOf!0 (BitStream!11778 BitStream!11778) Bool)

(assert (=> b!266680 (isPrefixOf!0 lt!407385 w2!580)))

(declare-fun lt!407379 () Unit!18944)

(assert (=> b!266680 (= lt!407379 (lemmaIsPrefixTransitive!0 lt!407385 w1!584 w2!580))))

(declare-fun res!222705 () Bool)

(declare-fun e!186628 () Bool)

(assert (=> start!58052 (=> (not res!222705) (not e!186628))))

(assert (=> start!58052 (= res!222705 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58052 e!186628))

(declare-fun e!186630 () Bool)

(declare-fun inv!12 (BitStream!11778) Bool)

(assert (=> start!58052 (and (inv!12 w1!584) e!186630)))

(declare-fun e!186623 () Bool)

(assert (=> start!58052 (and (inv!12 w2!580) e!186623)))

(declare-fun b!266681 () Bool)

(declare-fun e!186624 () Bool)

(assert (=> b!266681 (= e!186624 (not (arrayBitRangesEq!0 (buf!6950 w1!584) (buf!6950 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)))))))

(declare-fun b!266682 () Bool)

(declare-fun Unit!18946 () Unit!18944)

(assert (=> b!266682 (= e!186626 Unit!18946)))

(declare-fun b!266683 () Bool)

(declare-fun res!222704 () Bool)

(assert (=> b!266683 (=> res!222704 e!186627)))

(assert (=> b!266683 (= res!222704 (not (isPrefixOf!0 lt!407385 w1!584)))))

(declare-fun b!266684 () Bool)

(declare-fun array_inv!6206 (array!14866) Bool)

(assert (=> b!266684 (= e!186623 (array_inv!6206 (buf!6950 w2!580)))))

(declare-fun b!266685 () Bool)

(assert (=> b!266685 (= e!186630 (array_inv!6206 (buf!6950 w1!584)))))

(declare-fun b!266686 () Bool)

(declare-fun lt!407386 () Unit!18944)

(assert (=> b!266686 (= e!186626 lt!407386)))

(declare-fun lt!407384 () (_ BitVec 64))

(assert (=> b!266686 (= lt!407384 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14866 array!14866 (_ BitVec 64) (_ BitVec 64)) Unit!18944)

(assert (=> b!266686 (= lt!407386 (arrayBitRangesEqSymmetric!0 (buf!6950 w1!584) (buf!6950 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384))))

(assert (=> b!266686 (arrayBitRangesEq!0 (buf!6950 w2!580) (buf!6950 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384)))

(declare-fun b!266687 () Bool)

(assert (=> b!266687 (= e!186628 (not e!186621))))

(declare-fun res!222709 () Bool)

(assert (=> b!266687 (=> res!222709 e!186621)))

(assert (=> b!266687 (= res!222709 e!186624)))

(declare-fun res!222706 () Bool)

(assert (=> b!266687 (=> (not res!222706) (not e!186624))))

(assert (=> b!266687 (= res!222706 (not (= (size!6482 (buf!6950 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266687 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407387 () Unit!18944)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11778) Unit!18944)

(assert (=> b!266687 (= lt!407387 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266687 (isPrefixOf!0 lt!407385 lt!407385)))

(declare-fun lt!407388 () Unit!18944)

(assert (=> b!266687 (= lt!407388 (lemmaIsPrefixRefl!0 lt!407385))))

(assert (=> b!266687 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407390 () Unit!18944)

(assert (=> b!266687 (= lt!407390 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266687 (= lt!407385 (BitStream!11779 (buf!6950 w2!580) (currentByte!12844 w1!584) (currentBit!12839 w1!584)))))

(assert (= (and start!58052 res!222705) b!266687))

(assert (= (and b!266687 res!222706) b!266681))

(assert (= (and b!266687 (not res!222709)) b!266678))

(assert (= (and b!266678 c!12285) b!266686))

(assert (= (and b!266678 (not c!12285)) b!266682))

(assert (= (and b!266678 res!222707) b!266679))

(assert (= (and b!266678 (not res!222708)) b!266683))

(assert (= (and b!266683 (not res!222704)) b!266680))

(assert (= start!58052 b!266685))

(assert (= start!58052 b!266684))

(declare-fun m!397553 () Bool)

(assert (=> b!266681 m!397553))

(assert (=> b!266681 m!397553))

(declare-fun m!397555 () Bool)

(assert (=> b!266681 m!397555))

(assert (=> b!266679 m!397553))

(assert (=> b!266679 m!397553))

(declare-fun m!397557 () Bool)

(assert (=> b!266679 m!397557))

(declare-fun m!397559 () Bool)

(assert (=> b!266684 m!397559))

(declare-fun m!397561 () Bool)

(assert (=> start!58052 m!397561))

(declare-fun m!397563 () Bool)

(assert (=> start!58052 m!397563))

(declare-fun m!397565 () Bool)

(assert (=> start!58052 m!397565))

(assert (=> b!266680 m!397553))

(declare-fun m!397567 () Bool)

(assert (=> b!266680 m!397567))

(declare-fun m!397569 () Bool)

(assert (=> b!266680 m!397569))

(declare-fun m!397571 () Bool)

(assert (=> b!266680 m!397571))

(declare-fun m!397573 () Bool)

(assert (=> b!266680 m!397573))

(declare-fun m!397575 () Bool)

(assert (=> b!266683 m!397575))

(declare-fun m!397577 () Bool)

(assert (=> b!266687 m!397577))

(declare-fun m!397579 () Bool)

(assert (=> b!266687 m!397579))

(declare-fun m!397581 () Bool)

(assert (=> b!266687 m!397581))

(declare-fun m!397583 () Bool)

(assert (=> b!266687 m!397583))

(declare-fun m!397585 () Bool)

(assert (=> b!266687 m!397585))

(declare-fun m!397587 () Bool)

(assert (=> b!266687 m!397587))

(declare-fun m!397589 () Bool)

(assert (=> b!266685 m!397589))

(assert (=> b!266686 m!397553))

(declare-fun m!397591 () Bool)

(assert (=> b!266686 m!397591))

(declare-fun m!397593 () Bool)

(assert (=> b!266686 m!397593))

(check-sat (not b!266680) (not b!266687) (not b!266683) (not start!58052) (not b!266684) (not b!266685) (not b!266686) (not b!266681) (not b!266679))
(check-sat)
(get-model)

(declare-fun d!89952 () Bool)

(declare-fun e!186681 () Bool)

(assert (=> d!89952 e!186681))

(declare-fun res!222747 () Bool)

(assert (=> d!89952 (=> (not res!222747) (not e!186681))))

(declare-fun lt!407448 () (_ BitVec 64))

(declare-fun lt!407452 () (_ BitVec 64))

(declare-fun lt!407449 () (_ BitVec 64))

(assert (=> d!89952 (= res!222747 (= lt!407452 (bvsub lt!407448 lt!407449)))))

(assert (=> d!89952 (or (= (bvand lt!407448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407449 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407448 lt!407449) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89952 (= lt!407449 (remainingBits!0 ((_ sign_extend 32) (size!6482 (buf!6950 w1!584))) ((_ sign_extend 32) (currentByte!12844 w1!584)) ((_ sign_extend 32) (currentBit!12839 w1!584))))))

(declare-fun lt!407453 () (_ BitVec 64))

(declare-fun lt!407450 () (_ BitVec 64))

(assert (=> d!89952 (= lt!407448 (bvmul lt!407453 lt!407450))))

(assert (=> d!89952 (or (= lt!407453 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407450 (bvsdiv (bvmul lt!407453 lt!407450) lt!407453)))))

(assert (=> d!89952 (= lt!407450 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89952 (= lt!407453 ((_ sign_extend 32) (size!6482 (buf!6950 w1!584))))))

(assert (=> d!89952 (= lt!407452 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12844 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12839 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89952 (invariant!0 (currentBit!12839 w1!584) (currentByte!12844 w1!584) (size!6482 (buf!6950 w1!584)))))

(assert (=> d!89952 (= (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)) lt!407452)))

(declare-fun b!266743 () Bool)

(declare-fun res!222748 () Bool)

(assert (=> b!266743 (=> (not res!222748) (not e!186681))))

(assert (=> b!266743 (= res!222748 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407452))))

(declare-fun b!266744 () Bool)

(declare-fun lt!407451 () (_ BitVec 64))

(assert (=> b!266744 (= e!186681 (bvsle lt!407452 (bvmul lt!407451 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266744 (or (= lt!407451 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407451 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407451)))))

(assert (=> b!266744 (= lt!407451 ((_ sign_extend 32) (size!6482 (buf!6950 w1!584))))))

(assert (= (and d!89952 res!222747) b!266743))

(assert (= (and b!266743 res!222748) b!266744))

(declare-fun m!397653 () Bool)

(assert (=> d!89952 m!397653))

(declare-fun m!397655 () Bool)

(assert (=> d!89952 m!397655))

(assert (=> b!266686 d!89952))

(declare-fun d!89962 () Bool)

(assert (=> d!89962 (arrayBitRangesEq!0 (buf!6950 w2!580) (buf!6950 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384)))

(declare-fun lt!407456 () Unit!18944)

(declare-fun choose!8 (array!14866 array!14866 (_ BitVec 64) (_ BitVec 64)) Unit!18944)

(assert (=> d!89962 (= lt!407456 (choose!8 (buf!6950 w1!584) (buf!6950 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384))))

(assert (=> d!89962 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384))))

(assert (=> d!89962 (= (arrayBitRangesEqSymmetric!0 (buf!6950 w1!584) (buf!6950 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384) lt!407456)))

(declare-fun bs!22848 () Bool)

(assert (= bs!22848 d!89962))

(assert (=> bs!22848 m!397593))

(declare-fun m!397657 () Bool)

(assert (=> bs!22848 m!397657))

(assert (=> b!266686 d!89962))

(declare-datatypes ((tuple4!394 0))(
  ( (tuple4!395 (_1!12177 (_ BitVec 32)) (_2!12177 (_ BitVec 32)) (_3!977 (_ BitVec 32)) (_4!197 (_ BitVec 32))) )
))
(declare-fun lt!407522 () tuple4!394)

(declare-fun b!266816 () Bool)

(declare-fun e!186740 () Bool)

(declare-fun lt!407521 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266816 (= e!186740 (byteRangesEq!0 (select (arr!7469 (buf!6950 w2!580)) (_4!197 lt!407522)) (select (arr!7469 (buf!6950 w1!584)) (_4!197 lt!407522)) #b00000000000000000000000000000000 lt!407521))))

(declare-fun b!266817 () Bool)

(declare-fun e!186735 () Bool)

(declare-fun call!4176 () Bool)

(assert (=> b!266817 (= e!186735 call!4176)))

(declare-fun b!266818 () Bool)

(declare-fun e!186738 () Bool)

(assert (=> b!266818 (= e!186735 e!186738)))

(declare-fun res!222810 () Bool)

(assert (=> b!266818 (= res!222810 call!4176)))

(assert (=> b!266818 (=> (not res!222810) (not e!186738))))

(declare-fun b!266819 () Bool)

(declare-fun res!222809 () Bool)

(assert (=> b!266819 (= res!222809 (= lt!407521 #b00000000000000000000000000000000))))

(assert (=> b!266819 (=> res!222809 e!186740)))

(assert (=> b!266819 (= e!186738 e!186740)))

(declare-fun d!89964 () Bool)

(declare-fun res!222811 () Bool)

(declare-fun e!186736 () Bool)

(assert (=> d!89964 (=> res!222811 e!186736)))

(assert (=> d!89964 (= res!222811 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384))))

(assert (=> d!89964 (= (arrayBitRangesEq!0 (buf!6950 w2!580) (buf!6950 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384) e!186736)))

(declare-fun bm!4173 () Bool)

(declare-fun lt!407523 () (_ BitVec 32))

(declare-fun c!12298 () Bool)

(assert (=> bm!4173 (= call!4176 (byteRangesEq!0 (select (arr!7469 (buf!6950 w2!580)) (_3!977 lt!407522)) (select (arr!7469 (buf!6950 w1!584)) (_3!977 lt!407522)) lt!407523 (ite c!12298 lt!407521 #b00000000000000000000000000001000)))))

(declare-fun b!266820 () Bool)

(declare-fun e!186737 () Bool)

(assert (=> b!266820 (= e!186737 e!186735)))

(assert (=> b!266820 (= c!12298 (= (_3!977 lt!407522) (_4!197 lt!407522)))))

(declare-fun b!266821 () Bool)

(assert (=> b!266821 (= e!186736 e!186737)))

(declare-fun res!222812 () Bool)

(assert (=> b!266821 (=> (not res!222812) (not e!186737))))

(declare-fun e!186739 () Bool)

(assert (=> b!266821 (= res!222812 e!186739)))

(declare-fun res!222808 () Bool)

(assert (=> b!266821 (=> res!222808 e!186739)))

(assert (=> b!266821 (= res!222808 (bvsge (_1!12177 lt!407522) (_2!12177 lt!407522)))))

(assert (=> b!266821 (= lt!407521 ((_ extract 31 0) (bvsrem lt!407384 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266821 (= lt!407523 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!394)

(assert (=> b!266821 (= lt!407522 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407384))))

(declare-fun b!266822 () Bool)

(declare-fun arrayRangesEq!1033 (array!14866 array!14866 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266822 (= e!186739 (arrayRangesEq!1033 (buf!6950 w2!580) (buf!6950 w1!584) (_1!12177 lt!407522) (_2!12177 lt!407522)))))

(assert (= (and d!89964 (not res!222811)) b!266821))

(assert (= (and b!266821 (not res!222808)) b!266822))

(assert (= (and b!266821 res!222812) b!266820))

(assert (= (and b!266820 c!12298) b!266817))

(assert (= (and b!266820 (not c!12298)) b!266818))

(assert (= (and b!266818 res!222810) b!266819))

(assert (= (and b!266819 (not res!222809)) b!266816))

(assert (= (or b!266817 b!266818) bm!4173))

(declare-fun m!397711 () Bool)

(assert (=> b!266816 m!397711))

(declare-fun m!397713 () Bool)

(assert (=> b!266816 m!397713))

(assert (=> b!266816 m!397711))

(assert (=> b!266816 m!397713))

(declare-fun m!397717 () Bool)

(assert (=> b!266816 m!397717))

(declare-fun m!397719 () Bool)

(assert (=> bm!4173 m!397719))

(declare-fun m!397721 () Bool)

(assert (=> bm!4173 m!397721))

(assert (=> bm!4173 m!397719))

(assert (=> bm!4173 m!397721))

(declare-fun m!397725 () Bool)

(assert (=> bm!4173 m!397725))

(declare-fun m!397727 () Bool)

(assert (=> b!266821 m!397727))

(declare-fun m!397729 () Bool)

(assert (=> b!266822 m!397729))

(assert (=> b!266686 d!89964))

(declare-fun e!186746 () Bool)

(declare-fun b!266823 () Bool)

(declare-fun lt!407528 () (_ BitVec 32))

(declare-fun lt!407529 () tuple4!394)

(assert (=> b!266823 (= e!186746 (byteRangesEq!0 (select (arr!7469 (buf!6950 w1!584)) (_4!197 lt!407529)) (select (arr!7469 (buf!6950 w2!580)) (_4!197 lt!407529)) #b00000000000000000000000000000000 lt!407528))))

(declare-fun b!266824 () Bool)

(declare-fun e!186741 () Bool)

(declare-fun call!4177 () Bool)

(assert (=> b!266824 (= e!186741 call!4177)))

(declare-fun b!266825 () Bool)

(declare-fun e!186744 () Bool)

(assert (=> b!266825 (= e!186741 e!186744)))

(declare-fun res!222815 () Bool)

(assert (=> b!266825 (= res!222815 call!4177)))

(assert (=> b!266825 (=> (not res!222815) (not e!186744))))

(declare-fun b!266826 () Bool)

(declare-fun res!222814 () Bool)

(assert (=> b!266826 (= res!222814 (= lt!407528 #b00000000000000000000000000000000))))

(assert (=> b!266826 (=> res!222814 e!186746)))

(assert (=> b!266826 (= e!186744 e!186746)))

(declare-fun d!89996 () Bool)

(declare-fun res!222816 () Bool)

(declare-fun e!186742 () Bool)

(assert (=> d!89996 (=> res!222816 e!186742)))

(assert (=> d!89996 (= res!222816 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))))))

(assert (=> d!89996 (= (arrayBitRangesEq!0 (buf!6950 w1!584) (buf!6950 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))) e!186742)))

(declare-fun lt!407530 () (_ BitVec 32))

(declare-fun bm!4174 () Bool)

(declare-fun c!12299 () Bool)

(assert (=> bm!4174 (= call!4177 (byteRangesEq!0 (select (arr!7469 (buf!6950 w1!584)) (_3!977 lt!407529)) (select (arr!7469 (buf!6950 w2!580)) (_3!977 lt!407529)) lt!407530 (ite c!12299 lt!407528 #b00000000000000000000000000001000)))))

(declare-fun b!266827 () Bool)

(declare-fun e!186743 () Bool)

(assert (=> b!266827 (= e!186743 e!186741)))

(assert (=> b!266827 (= c!12299 (= (_3!977 lt!407529) (_4!197 lt!407529)))))

(declare-fun b!266828 () Bool)

(assert (=> b!266828 (= e!186742 e!186743)))

(declare-fun res!222817 () Bool)

(assert (=> b!266828 (=> (not res!222817) (not e!186743))))

(declare-fun e!186745 () Bool)

(assert (=> b!266828 (= res!222817 e!186745)))

(declare-fun res!222813 () Bool)

(assert (=> b!266828 (=> res!222813 e!186745)))

(assert (=> b!266828 (= res!222813 (bvsge (_1!12177 lt!407529) (_2!12177 lt!407529)))))

(assert (=> b!266828 (= lt!407528 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266828 (= lt!407530 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266828 (= lt!407529 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))))))

(declare-fun b!266829 () Bool)

(assert (=> b!266829 (= e!186745 (arrayRangesEq!1033 (buf!6950 w1!584) (buf!6950 w2!580) (_1!12177 lt!407529) (_2!12177 lt!407529)))))

(assert (= (and d!89996 (not res!222816)) b!266828))

(assert (= (and b!266828 (not res!222813)) b!266829))

(assert (= (and b!266828 res!222817) b!266827))

(assert (= (and b!266827 c!12299) b!266824))

(assert (= (and b!266827 (not c!12299)) b!266825))

(assert (= (and b!266825 res!222815) b!266826))

(assert (= (and b!266826 (not res!222814)) b!266823))

(assert (= (or b!266824 b!266825) bm!4174))

(declare-fun m!397731 () Bool)

(assert (=> b!266823 m!397731))

(declare-fun m!397733 () Bool)

(assert (=> b!266823 m!397733))

(assert (=> b!266823 m!397731))

(assert (=> b!266823 m!397733))

(declare-fun m!397735 () Bool)

(assert (=> b!266823 m!397735))

(declare-fun m!397737 () Bool)

(assert (=> bm!4174 m!397737))

(declare-fun m!397739 () Bool)

(assert (=> bm!4174 m!397739))

(assert (=> bm!4174 m!397737))

(assert (=> bm!4174 m!397739))

(declare-fun m!397741 () Bool)

(assert (=> bm!4174 m!397741))

(assert (=> b!266828 m!397553))

(declare-fun m!397743 () Bool)

(assert (=> b!266828 m!397743))

(declare-fun m!397745 () Bool)

(assert (=> b!266829 m!397745))

(assert (=> b!266681 d!89996))

(assert (=> b!266681 d!89952))

(declare-fun d!89998 () Bool)

(assert (=> d!89998 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407538 () Unit!18944)

(declare-fun choose!11 (BitStream!11778) Unit!18944)

(assert (=> d!89998 (= lt!407538 (choose!11 w2!580))))

(assert (=> d!89998 (= (lemmaIsPrefixRefl!0 w2!580) lt!407538)))

(declare-fun bs!22861 () Bool)

(assert (= bs!22861 d!89998))

(assert (=> bs!22861 m!397585))

(declare-fun m!397763 () Bool)

(assert (=> bs!22861 m!397763))

(assert (=> b!266687 d!89998))

(declare-fun d!90014 () Bool)

(assert (=> d!90014 (isPrefixOf!0 lt!407385 lt!407385)))

(declare-fun lt!407540 () Unit!18944)

(assert (=> d!90014 (= lt!407540 (choose!11 lt!407385))))

(assert (=> d!90014 (= (lemmaIsPrefixRefl!0 lt!407385) lt!407540)))

(declare-fun bs!22863 () Bool)

(assert (= bs!22863 d!90014))

(assert (=> bs!22863 m!397583))

(declare-fun m!397767 () Bool)

(assert (=> bs!22863 m!397767))

(assert (=> b!266687 d!90014))

(declare-fun d!90018 () Bool)

(declare-fun res!222866 () Bool)

(declare-fun e!186784 () Bool)

(assert (=> d!90018 (=> (not res!222866) (not e!186784))))

(assert (=> d!90018 (= res!222866 (= (size!6482 (buf!6950 lt!407385)) (size!6482 (buf!6950 lt!407385))))))

(assert (=> d!90018 (= (isPrefixOf!0 lt!407385 lt!407385) e!186784)))

(declare-fun b!266880 () Bool)

(declare-fun res!222865 () Bool)

(assert (=> b!266880 (=> (not res!222865) (not e!186784))))

(assert (=> b!266880 (= res!222865 (bvsle (bitIndex!0 (size!6482 (buf!6950 lt!407385)) (currentByte!12844 lt!407385) (currentBit!12839 lt!407385)) (bitIndex!0 (size!6482 (buf!6950 lt!407385)) (currentByte!12844 lt!407385) (currentBit!12839 lt!407385))))))

(declare-fun b!266881 () Bool)

(declare-fun e!186783 () Bool)

(assert (=> b!266881 (= e!186784 e!186783)))

(declare-fun res!222864 () Bool)

(assert (=> b!266881 (=> res!222864 e!186783)))

(assert (=> b!266881 (= res!222864 (= (size!6482 (buf!6950 lt!407385)) #b00000000000000000000000000000000))))

(declare-fun b!266882 () Bool)

(assert (=> b!266882 (= e!186783 (arrayBitRangesEq!0 (buf!6950 lt!407385) (buf!6950 lt!407385) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 lt!407385)) (currentByte!12844 lt!407385) (currentBit!12839 lt!407385))))))

(assert (= (and d!90018 res!222866) b!266880))

(assert (= (and b!266880 res!222865) b!266881))

(assert (= (and b!266881 (not res!222864)) b!266882))

(declare-fun m!397811 () Bool)

(assert (=> b!266880 m!397811))

(assert (=> b!266880 m!397811))

(assert (=> b!266882 m!397811))

(assert (=> b!266882 m!397811))

(declare-fun m!397815 () Bool)

(assert (=> b!266882 m!397815))

(assert (=> b!266687 d!90018))

(declare-fun d!90042 () Bool)

(assert (=> d!90042 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407556 () Unit!18944)

(assert (=> d!90042 (= lt!407556 (choose!11 w1!584))))

(assert (=> d!90042 (= (lemmaIsPrefixRefl!0 w1!584) lt!407556)))

(declare-fun bs!22868 () Bool)

(assert (= bs!22868 d!90042))

(assert (=> bs!22868 m!397581))

(declare-fun m!397817 () Bool)

(assert (=> bs!22868 m!397817))

(assert (=> b!266687 d!90042))

(declare-fun d!90044 () Bool)

(declare-fun res!222874 () Bool)

(declare-fun e!186792 () Bool)

(assert (=> d!90044 (=> (not res!222874) (not e!186792))))

(assert (=> d!90044 (= res!222874 (= (size!6482 (buf!6950 w1!584)) (size!6482 (buf!6950 w1!584))))))

(assert (=> d!90044 (= (isPrefixOf!0 w1!584 w1!584) e!186792)))

(declare-fun b!266890 () Bool)

(declare-fun res!222873 () Bool)

(assert (=> b!266890 (=> (not res!222873) (not e!186792))))

(assert (=> b!266890 (= res!222873 (bvsle (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)) (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))))))

(declare-fun b!266891 () Bool)

(declare-fun e!186791 () Bool)

(assert (=> b!266891 (= e!186792 e!186791)))

(declare-fun res!222872 () Bool)

(assert (=> b!266891 (=> res!222872 e!186791)))

(assert (=> b!266891 (= res!222872 (= (size!6482 (buf!6950 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266892 () Bool)

(assert (=> b!266892 (= e!186791 (arrayBitRangesEq!0 (buf!6950 w1!584) (buf!6950 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))))))

(assert (= (and d!90044 res!222874) b!266890))

(assert (= (and b!266890 res!222873) b!266891))

(assert (= (and b!266891 (not res!222872)) b!266892))

(assert (=> b!266890 m!397553))

(assert (=> b!266890 m!397553))

(assert (=> b!266892 m!397553))

(assert (=> b!266892 m!397553))

(declare-fun m!397835 () Bool)

(assert (=> b!266892 m!397835))

(assert (=> b!266687 d!90044))

(declare-fun d!90050 () Bool)

(declare-fun res!222882 () Bool)

(declare-fun e!186797 () Bool)

(assert (=> d!90050 (=> (not res!222882) (not e!186797))))

(assert (=> d!90050 (= res!222882 (= (size!6482 (buf!6950 w2!580)) (size!6482 (buf!6950 w2!580))))))

(assert (=> d!90050 (= (isPrefixOf!0 w2!580 w2!580) e!186797)))

(declare-fun b!266898 () Bool)

(declare-fun res!222881 () Bool)

(assert (=> b!266898 (=> (not res!222881) (not e!186797))))

(assert (=> b!266898 (= res!222881 (bvsle (bitIndex!0 (size!6482 (buf!6950 w2!580)) (currentByte!12844 w2!580) (currentBit!12839 w2!580)) (bitIndex!0 (size!6482 (buf!6950 w2!580)) (currentByte!12844 w2!580) (currentBit!12839 w2!580))))))

(declare-fun b!266899 () Bool)

(declare-fun e!186796 () Bool)

(assert (=> b!266899 (= e!186797 e!186796)))

(declare-fun res!222880 () Bool)

(assert (=> b!266899 (=> res!222880 e!186796)))

(assert (=> b!266899 (= res!222880 (= (size!6482 (buf!6950 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!266900 () Bool)

(assert (=> b!266900 (= e!186796 (arrayBitRangesEq!0 (buf!6950 w2!580) (buf!6950 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w2!580)) (currentByte!12844 w2!580) (currentBit!12839 w2!580))))))

(assert (= (and d!90050 res!222882) b!266898))

(assert (= (and b!266898 res!222881) b!266899))

(assert (= (and b!266899 (not res!222880)) b!266900))

(assert (=> b!266898 m!397569))

(assert (=> b!266898 m!397569))

(assert (=> b!266900 m!397569))

(assert (=> b!266900 m!397569))

(declare-fun m!397839 () Bool)

(assert (=> b!266900 m!397839))

(assert (=> b!266687 d!90050))

(declare-fun d!90054 () Bool)

(assert (=> d!90054 (= (array_inv!6206 (buf!6950 w1!584)) (bvsge (size!6482 (buf!6950 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!266685 d!90054))

(declare-fun d!90056 () Bool)

(assert (=> d!90056 (isPrefixOf!0 lt!407385 w2!580)))

(declare-fun lt!407569 () Unit!18944)

(declare-fun choose!30 (BitStream!11778 BitStream!11778 BitStream!11778) Unit!18944)

(assert (=> d!90056 (= lt!407569 (choose!30 lt!407385 w1!584 w2!580))))

(assert (=> d!90056 (isPrefixOf!0 lt!407385 w1!584)))

(assert (=> d!90056 (= (lemmaIsPrefixTransitive!0 lt!407385 w1!584 w2!580) lt!407569)))

(declare-fun bs!22871 () Bool)

(assert (= bs!22871 d!90056))

(assert (=> bs!22871 m!397571))

(declare-fun m!397845 () Bool)

(assert (=> bs!22871 m!397845))

(assert (=> bs!22871 m!397575))

(assert (=> b!266680 d!90056))

(declare-fun d!90060 () Bool)

(declare-fun e!186798 () Bool)

(assert (=> d!90060 e!186798))

(declare-fun res!222883 () Bool)

(assert (=> d!90060 (=> (not res!222883) (not e!186798))))

(declare-fun lt!407571 () (_ BitVec 64))

(declare-fun lt!407574 () (_ BitVec 64))

(declare-fun lt!407570 () (_ BitVec 64))

(assert (=> d!90060 (= res!222883 (= lt!407574 (bvsub lt!407570 lt!407571)))))

(assert (=> d!90060 (or (= (bvand lt!407570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407571 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407570 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407570 lt!407571) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90060 (= lt!407571 (remainingBits!0 ((_ sign_extend 32) (size!6482 (buf!6950 w2!580))) ((_ sign_extend 32) (currentByte!12844 w2!580)) ((_ sign_extend 32) (currentBit!12839 w2!580))))))

(declare-fun lt!407575 () (_ BitVec 64))

(declare-fun lt!407572 () (_ BitVec 64))

(assert (=> d!90060 (= lt!407570 (bvmul lt!407575 lt!407572))))

(assert (=> d!90060 (or (= lt!407575 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407572 (bvsdiv (bvmul lt!407575 lt!407572) lt!407575)))))

(assert (=> d!90060 (= lt!407572 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90060 (= lt!407575 ((_ sign_extend 32) (size!6482 (buf!6950 w2!580))))))

(assert (=> d!90060 (= lt!407574 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12844 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12839 w2!580))))))

(assert (=> d!90060 (invariant!0 (currentBit!12839 w2!580) (currentByte!12844 w2!580) (size!6482 (buf!6950 w2!580)))))

(assert (=> d!90060 (= (bitIndex!0 (size!6482 (buf!6950 w2!580)) (currentByte!12844 w2!580) (currentBit!12839 w2!580)) lt!407574)))

(declare-fun b!266901 () Bool)

(declare-fun res!222884 () Bool)

(assert (=> b!266901 (=> (not res!222884) (not e!186798))))

(assert (=> b!266901 (= res!222884 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407574))))

(declare-fun b!266902 () Bool)

(declare-fun lt!407573 () (_ BitVec 64))

(assert (=> b!266902 (= e!186798 (bvsle lt!407574 (bvmul lt!407573 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266902 (or (= lt!407573 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407573 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407573)))))

(assert (=> b!266902 (= lt!407573 ((_ sign_extend 32) (size!6482 (buf!6950 w2!580))))))

(assert (= (and d!90060 res!222883) b!266901))

(assert (= (and b!266901 res!222884) b!266902))

(declare-fun m!397847 () Bool)

(assert (=> d!90060 m!397847))

(declare-fun m!397849 () Bool)

(assert (=> d!90060 m!397849))

(assert (=> b!266680 d!90060))

(assert (=> b!266680 d!89952))

(declare-fun d!90062 () Bool)

(declare-fun res!222887 () Bool)

(declare-fun e!186800 () Bool)

(assert (=> d!90062 (=> (not res!222887) (not e!186800))))

(assert (=> d!90062 (= res!222887 (= (size!6482 (buf!6950 lt!407385)) (size!6482 (buf!6950 w2!580))))))

(assert (=> d!90062 (= (isPrefixOf!0 lt!407385 w2!580) e!186800)))

(declare-fun b!266903 () Bool)

(declare-fun res!222886 () Bool)

(assert (=> b!266903 (=> (not res!222886) (not e!186800))))

(assert (=> b!266903 (= res!222886 (bvsle (bitIndex!0 (size!6482 (buf!6950 lt!407385)) (currentByte!12844 lt!407385) (currentBit!12839 lt!407385)) (bitIndex!0 (size!6482 (buf!6950 w2!580)) (currentByte!12844 w2!580) (currentBit!12839 w2!580))))))

(declare-fun b!266904 () Bool)

(declare-fun e!186799 () Bool)

(assert (=> b!266904 (= e!186800 e!186799)))

(declare-fun res!222885 () Bool)

(assert (=> b!266904 (=> res!222885 e!186799)))

(assert (=> b!266904 (= res!222885 (= (size!6482 (buf!6950 lt!407385)) #b00000000000000000000000000000000))))

(declare-fun b!266905 () Bool)

(assert (=> b!266905 (= e!186799 (arrayBitRangesEq!0 (buf!6950 lt!407385) (buf!6950 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 lt!407385)) (currentByte!12844 lt!407385) (currentBit!12839 lt!407385))))))

(assert (= (and d!90062 res!222887) b!266903))

(assert (= (and b!266903 res!222886) b!266904))

(assert (= (and b!266904 (not res!222885)) b!266905))

(assert (=> b!266903 m!397811))

(assert (=> b!266903 m!397569))

(assert (=> b!266905 m!397811))

(assert (=> b!266905 m!397811))

(declare-fun m!397851 () Bool)

(assert (=> b!266905 m!397851))

(assert (=> b!266680 d!90062))

(declare-fun d!90064 () Bool)

(assert (=> d!90064 (isPrefixOf!0 lt!407385 w2!580)))

(declare-fun lt!407576 () Unit!18944)

(assert (=> d!90064 (= lt!407576 (choose!30 lt!407385 w2!580 w2!580))))

(assert (=> d!90064 (isPrefixOf!0 lt!407385 w2!580)))

(assert (=> d!90064 (= (lemmaIsPrefixTransitive!0 lt!407385 w2!580 w2!580) lt!407576)))

(declare-fun bs!22872 () Bool)

(assert (= bs!22872 d!90064))

(assert (=> bs!22872 m!397571))

(declare-fun m!397853 () Bool)

(assert (=> bs!22872 m!397853))

(assert (=> bs!22872 m!397571))

(assert (=> b!266680 d!90064))

(declare-fun d!90066 () Bool)

(assert (=> d!90066 (= (array_inv!6206 (buf!6950 w2!580)) (bvsge (size!6482 (buf!6950 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!266684 d!90066))

(declare-fun lt!407577 () (_ BitVec 32))

(declare-fun e!186806 () Bool)

(declare-fun b!266906 () Bool)

(declare-fun lt!407578 () tuple4!394)

(assert (=> b!266906 (= e!186806 (byteRangesEq!0 (select (arr!7469 (buf!6950 w2!580)) (_4!197 lt!407578)) (select (arr!7469 (buf!6950 w1!584)) (_4!197 lt!407578)) #b00000000000000000000000000000000 lt!407577))))

(declare-fun b!266907 () Bool)

(declare-fun e!186801 () Bool)

(declare-fun call!4181 () Bool)

(assert (=> b!266907 (= e!186801 call!4181)))

(declare-fun b!266908 () Bool)

(declare-fun e!186804 () Bool)

(assert (=> b!266908 (= e!186801 e!186804)))

(declare-fun res!222890 () Bool)

(assert (=> b!266908 (= res!222890 call!4181)))

(assert (=> b!266908 (=> (not res!222890) (not e!186804))))

(declare-fun b!266909 () Bool)

(declare-fun res!222889 () Bool)

(assert (=> b!266909 (= res!222889 (= lt!407577 #b00000000000000000000000000000000))))

(assert (=> b!266909 (=> res!222889 e!186806)))

(assert (=> b!266909 (= e!186804 e!186806)))

(declare-fun d!90068 () Bool)

(declare-fun res!222891 () Bool)

(declare-fun e!186802 () Bool)

(assert (=> d!90068 (=> res!222891 e!186802)))

(assert (=> d!90068 (= res!222891 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))))))

(assert (=> d!90068 (= (arrayBitRangesEq!0 (buf!6950 w2!580) (buf!6950 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))) e!186802)))

(declare-fun c!12303 () Bool)

(declare-fun lt!407579 () (_ BitVec 32))

(declare-fun bm!4178 () Bool)

(assert (=> bm!4178 (= call!4181 (byteRangesEq!0 (select (arr!7469 (buf!6950 w2!580)) (_3!977 lt!407578)) (select (arr!7469 (buf!6950 w1!584)) (_3!977 lt!407578)) lt!407579 (ite c!12303 lt!407577 #b00000000000000000000000000001000)))))

(declare-fun b!266910 () Bool)

(declare-fun e!186803 () Bool)

(assert (=> b!266910 (= e!186803 e!186801)))

(assert (=> b!266910 (= c!12303 (= (_3!977 lt!407578) (_4!197 lt!407578)))))

(declare-fun b!266911 () Bool)

(assert (=> b!266911 (= e!186802 e!186803)))

(declare-fun res!222892 () Bool)

(assert (=> b!266911 (=> (not res!222892) (not e!186803))))

(declare-fun e!186805 () Bool)

(assert (=> b!266911 (= res!222892 e!186805)))

(declare-fun res!222888 () Bool)

(assert (=> b!266911 (=> res!222888 e!186805)))

(assert (=> b!266911 (= res!222888 (bvsge (_1!12177 lt!407578) (_2!12177 lt!407578)))))

(assert (=> b!266911 (= lt!407577 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266911 (= lt!407579 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266911 (= lt!407578 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))))))

(declare-fun b!266912 () Bool)

(assert (=> b!266912 (= e!186805 (arrayRangesEq!1033 (buf!6950 w2!580) (buf!6950 w1!584) (_1!12177 lt!407578) (_2!12177 lt!407578)))))

(assert (= (and d!90068 (not res!222891)) b!266911))

(assert (= (and b!266911 (not res!222888)) b!266912))

(assert (= (and b!266911 res!222892) b!266910))

(assert (= (and b!266910 c!12303) b!266907))

(assert (= (and b!266910 (not c!12303)) b!266908))

(assert (= (and b!266908 res!222890) b!266909))

(assert (= (and b!266909 (not res!222889)) b!266906))

(assert (= (or b!266907 b!266908) bm!4178))

(declare-fun m!397855 () Bool)

(assert (=> b!266906 m!397855))

(declare-fun m!397857 () Bool)

(assert (=> b!266906 m!397857))

(assert (=> b!266906 m!397855))

(assert (=> b!266906 m!397857))

(declare-fun m!397859 () Bool)

(assert (=> b!266906 m!397859))

(declare-fun m!397861 () Bool)

(assert (=> bm!4178 m!397861))

(declare-fun m!397863 () Bool)

(assert (=> bm!4178 m!397863))

(assert (=> bm!4178 m!397861))

(assert (=> bm!4178 m!397863))

(declare-fun m!397865 () Bool)

(assert (=> bm!4178 m!397865))

(assert (=> b!266911 m!397553))

(assert (=> b!266911 m!397743))

(declare-fun m!397867 () Bool)

(assert (=> b!266912 m!397867))

(assert (=> b!266679 d!90068))

(assert (=> b!266679 d!89952))

(declare-fun d!90070 () Bool)

(declare-fun res!222895 () Bool)

(declare-fun e!186808 () Bool)

(assert (=> d!90070 (=> (not res!222895) (not e!186808))))

(assert (=> d!90070 (= res!222895 (= (size!6482 (buf!6950 w1!584)) (size!6482 (buf!6950 w2!580))))))

(assert (=> d!90070 (= (isPrefixOf!0 w1!584 w2!580) e!186808)))

(declare-fun b!266913 () Bool)

(declare-fun res!222894 () Bool)

(assert (=> b!266913 (=> (not res!222894) (not e!186808))))

(assert (=> b!266913 (= res!222894 (bvsle (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584)) (bitIndex!0 (size!6482 (buf!6950 w2!580)) (currentByte!12844 w2!580) (currentBit!12839 w2!580))))))

(declare-fun b!266914 () Bool)

(declare-fun e!186807 () Bool)

(assert (=> b!266914 (= e!186808 e!186807)))

(declare-fun res!222893 () Bool)

(assert (=> b!266914 (=> res!222893 e!186807)))

(assert (=> b!266914 (= res!222893 (= (size!6482 (buf!6950 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266915 () Bool)

(assert (=> b!266915 (= e!186807 (arrayBitRangesEq!0 (buf!6950 w1!584) (buf!6950 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))))))

(assert (= (and d!90070 res!222895) b!266913))

(assert (= (and b!266913 res!222894) b!266914))

(assert (= (and b!266914 (not res!222893)) b!266915))

(assert (=> b!266913 m!397553))

(assert (=> b!266913 m!397569))

(assert (=> b!266915 m!397553))

(assert (=> b!266915 m!397553))

(assert (=> b!266915 m!397555))

(assert (=> start!58052 d!90070))

(declare-fun d!90072 () Bool)

(assert (=> d!90072 (= (inv!12 w1!584) (invariant!0 (currentBit!12839 w1!584) (currentByte!12844 w1!584) (size!6482 (buf!6950 w1!584))))))

(declare-fun bs!22873 () Bool)

(assert (= bs!22873 d!90072))

(assert (=> bs!22873 m!397655))

(assert (=> start!58052 d!90072))

(declare-fun d!90074 () Bool)

(assert (=> d!90074 (= (inv!12 w2!580) (invariant!0 (currentBit!12839 w2!580) (currentByte!12844 w2!580) (size!6482 (buf!6950 w2!580))))))

(declare-fun bs!22874 () Bool)

(assert (= bs!22874 d!90074))

(assert (=> bs!22874 m!397849))

(assert (=> start!58052 d!90074))

(declare-fun d!90076 () Bool)

(declare-fun res!222898 () Bool)

(declare-fun e!186810 () Bool)

(assert (=> d!90076 (=> (not res!222898) (not e!186810))))

(assert (=> d!90076 (= res!222898 (= (size!6482 (buf!6950 lt!407385)) (size!6482 (buf!6950 w1!584))))))

(assert (=> d!90076 (= (isPrefixOf!0 lt!407385 w1!584) e!186810)))

(declare-fun b!266916 () Bool)

(declare-fun res!222897 () Bool)

(assert (=> b!266916 (=> (not res!222897) (not e!186810))))

(assert (=> b!266916 (= res!222897 (bvsle (bitIndex!0 (size!6482 (buf!6950 lt!407385)) (currentByte!12844 lt!407385) (currentBit!12839 lt!407385)) (bitIndex!0 (size!6482 (buf!6950 w1!584)) (currentByte!12844 w1!584) (currentBit!12839 w1!584))))))

(declare-fun b!266917 () Bool)

(declare-fun e!186809 () Bool)

(assert (=> b!266917 (= e!186810 e!186809)))

(declare-fun res!222896 () Bool)

(assert (=> b!266917 (=> res!222896 e!186809)))

(assert (=> b!266917 (= res!222896 (= (size!6482 (buf!6950 lt!407385)) #b00000000000000000000000000000000))))

(declare-fun b!266918 () Bool)

(assert (=> b!266918 (= e!186809 (arrayBitRangesEq!0 (buf!6950 lt!407385) (buf!6950 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6482 (buf!6950 lt!407385)) (currentByte!12844 lt!407385) (currentBit!12839 lt!407385))))))

(assert (= (and d!90076 res!222898) b!266916))

(assert (= (and b!266916 res!222897) b!266917))

(assert (= (and b!266917 (not res!222896)) b!266918))

(assert (=> b!266916 m!397811))

(assert (=> b!266916 m!397553))

(assert (=> b!266918 m!397811))

(assert (=> b!266918 m!397811))

(declare-fun m!397869 () Bool)

(assert (=> b!266918 m!397869))

(assert (=> b!266683 d!90076))

(check-sat (not b!266911) (not bm!4174) (not b!266915) (not d!90056) (not d!89998) (not b!266822) (not b!266890) (not b!266816) (not d!89962) (not bm!4173) (not b!266823) (not b!266892) (not b!266882) (not b!266912) (not b!266898) (not b!266913) (not b!266821) (not b!266918) (not d!90060) (not b!266880) (not d!90072) (not b!266906) (not d!90064) (not b!266903) (not d!89952) (not b!266916) (not d!90074) (not b!266900) (not b!266828) (not b!266905) (not d!90014) (not bm!4178) (not d!90042) (not b!266829))
