; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57588 () Bool)

(assert start!57588)

(declare-fun b!264203 () Bool)

(declare-datatypes ((Unit!18830 0))(
  ( (Unit!18831) )
))
(declare-fun e!184384 () Unit!18830)

(declare-fun lt!405538 () Unit!18830)

(assert (=> b!264203 (= e!184384 lt!405538)))

(declare-fun lt!405534 () (_ BitVec 64))

(declare-datatypes ((array!14741 0))(
  ( (array!14742 (arr!7420 (Array (_ BitVec 32) (_ BitVec 8))) (size!6433 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11680 0))(
  ( (BitStream!11681 (buf!6901 array!14741) (currentByte!12765 (_ BitVec 32)) (currentBit!12760 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11680)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264203 (= lt!405534 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584)))))

(declare-fun w2!580 () BitStream!11680)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14741 array!14741 (_ BitVec 64) (_ BitVec 64)) Unit!18830)

(assert (=> b!264203 (= lt!405538 (arrayBitRangesEqSymmetric!0 (buf!6901 w1!584) (buf!6901 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534))))

(declare-fun arrayBitRangesEq!0 (array!14741 array!14741 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!264203 (arrayBitRangesEq!0 (buf!6901 w2!580) (buf!6901 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534)))

(declare-fun res!220886 () Bool)

(declare-fun e!184379 () Bool)

(assert (=> start!57588 (=> (not res!220886) (not e!184379))))

(declare-fun isPrefixOf!0 (BitStream!11680 BitStream!11680) Bool)

(assert (=> start!57588 (= res!220886 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57588 e!184379))

(declare-fun e!184385 () Bool)

(declare-fun inv!12 (BitStream!11680) Bool)

(assert (=> start!57588 (and (inv!12 w1!584) e!184385)))

(declare-fun e!184380 () Bool)

(assert (=> start!57588 (and (inv!12 w2!580) e!184380)))

(declare-fun b!264204 () Bool)

(declare-fun array_inv!6157 (array!14741) Bool)

(assert (=> b!264204 (= e!184380 (array_inv!6157 (buf!6901 w2!580)))))

(declare-fun b!264205 () Bool)

(declare-fun e!184377 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264205 (= e!184377 (invariant!0 (currentBit!12760 w1!584) (currentByte!12765 w1!584) (size!6433 (buf!6901 w1!584))))))

(declare-fun lt!405541 () Unit!18830)

(declare-fun lt!405535 () BitStream!11680)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11680 BitStream!11680 BitStream!11680) Unit!18830)

(assert (=> b!264205 (= lt!405541 (lemmaIsPrefixTransitive!0 lt!405535 w2!580 w2!580))))

(assert (=> b!264205 (isPrefixOf!0 lt!405535 w2!580)))

(declare-fun lt!405537 () Unit!18830)

(assert (=> b!264205 (= lt!405537 (lemmaIsPrefixTransitive!0 lt!405535 w1!584 w2!580))))

(declare-fun b!264206 () Bool)

(declare-fun res!220889 () Bool)

(assert (=> b!264206 (=> res!220889 e!184377)))

(assert (=> b!264206 (= res!220889 (not (isPrefixOf!0 lt!405535 w1!584)))))

(declare-fun b!264207 () Bool)

(declare-fun e!184381 () Bool)

(assert (=> b!264207 (= e!184381 e!184377)))

(declare-fun res!220887 () Bool)

(assert (=> b!264207 (=> res!220887 e!184377)))

(declare-fun e!184378 () Bool)

(assert (=> b!264207 (= res!220887 e!184378)))

(declare-fun res!220888 () Bool)

(assert (=> b!264207 (=> (not res!220888) (not e!184378))))

(assert (=> b!264207 (= res!220888 (not (= (size!6433 (buf!6901 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405542 () Unit!18830)

(assert (=> b!264207 (= lt!405542 e!184384)))

(declare-fun c!12105 () Bool)

(assert (=> b!264207 (= c!12105 (not (= (size!6433 (buf!6901 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264208 () Bool)

(assert (=> b!264208 (= e!184379 (not e!184381))))

(declare-fun res!220890 () Bool)

(assert (=> b!264208 (=> res!220890 e!184381)))

(declare-fun e!184383 () Bool)

(assert (=> b!264208 (= res!220890 e!184383)))

(declare-fun res!220891 () Bool)

(assert (=> b!264208 (=> (not res!220891) (not e!184383))))

(assert (=> b!264208 (= res!220891 (not (= (size!6433 (buf!6901 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264208 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405536 () Unit!18830)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11680) Unit!18830)

(assert (=> b!264208 (= lt!405536 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264208 (isPrefixOf!0 lt!405535 lt!405535)))

(declare-fun lt!405539 () Unit!18830)

(assert (=> b!264208 (= lt!405539 (lemmaIsPrefixRefl!0 lt!405535))))

(assert (=> b!264208 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405540 () Unit!18830)

(assert (=> b!264208 (= lt!405540 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264208 (= lt!405535 (BitStream!11681 (buf!6901 w2!580) (currentByte!12765 w1!584) (currentBit!12760 w1!584)))))

(declare-fun b!264209 () Bool)

(assert (=> b!264209 (= e!184378 (not (arrayBitRangesEq!0 (buf!6901 w2!580) (buf!6901 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584)))))))

(declare-fun b!264210 () Bool)

(declare-fun Unit!18832 () Unit!18830)

(assert (=> b!264210 (= e!184384 Unit!18832)))

(declare-fun b!264211 () Bool)

(assert (=> b!264211 (= e!184385 (array_inv!6157 (buf!6901 w1!584)))))

(declare-fun b!264212 () Bool)

(assert (=> b!264212 (= e!184383 (not (arrayBitRangesEq!0 (buf!6901 w1!584) (buf!6901 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584)))))))

(assert (= (and start!57588 res!220886) b!264208))

(assert (= (and b!264208 res!220891) b!264212))

(assert (= (and b!264208 (not res!220890)) b!264207))

(assert (= (and b!264207 c!12105) b!264203))

(assert (= (and b!264207 (not c!12105)) b!264210))

(assert (= (and b!264207 res!220888) b!264209))

(assert (= (and b!264207 (not res!220887)) b!264206))

(assert (= (and b!264206 (not res!220889)) b!264205))

(assert (= start!57588 b!264211))

(assert (= start!57588 b!264204))

(declare-fun m!394637 () Bool)

(assert (=> b!264211 m!394637))

(declare-fun m!394639 () Bool)

(assert (=> b!264209 m!394639))

(assert (=> b!264209 m!394639))

(declare-fun m!394641 () Bool)

(assert (=> b!264209 m!394641))

(declare-fun m!394643 () Bool)

(assert (=> b!264206 m!394643))

(declare-fun m!394645 () Bool)

(assert (=> b!264205 m!394645))

(declare-fun m!394647 () Bool)

(assert (=> b!264205 m!394647))

(declare-fun m!394649 () Bool)

(assert (=> b!264205 m!394649))

(declare-fun m!394651 () Bool)

(assert (=> b!264205 m!394651))

(declare-fun m!394653 () Bool)

(assert (=> b!264204 m!394653))

(assert (=> b!264203 m!394639))

(declare-fun m!394655 () Bool)

(assert (=> b!264203 m!394655))

(declare-fun m!394657 () Bool)

(assert (=> b!264203 m!394657))

(declare-fun m!394659 () Bool)

(assert (=> start!57588 m!394659))

(declare-fun m!394661 () Bool)

(assert (=> start!57588 m!394661))

(declare-fun m!394663 () Bool)

(assert (=> start!57588 m!394663))

(assert (=> b!264212 m!394639))

(assert (=> b!264212 m!394639))

(declare-fun m!394665 () Bool)

(assert (=> b!264212 m!394665))

(declare-fun m!394667 () Bool)

(assert (=> b!264208 m!394667))

(declare-fun m!394669 () Bool)

(assert (=> b!264208 m!394669))

(declare-fun m!394671 () Bool)

(assert (=> b!264208 m!394671))

(declare-fun m!394673 () Bool)

(assert (=> b!264208 m!394673))

(declare-fun m!394675 () Bool)

(assert (=> b!264208 m!394675))

(declare-fun m!394677 () Bool)

(assert (=> b!264208 m!394677))

(push 1)

(assert (not b!264206))

(assert (not b!264203))

(assert (not b!264212))

(assert (not start!57588))

(assert (not b!264205))

(assert (not b!264208))

(assert (not b!264204))

(assert (not b!264209))

(assert (not b!264211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!264316 () Bool)

(declare-fun e!184484 () Bool)

(declare-fun e!184483 () Bool)

(assert (=> b!264316 (= e!184484 e!184483)))

(declare-fun res!220965 () Bool)

(assert (=> b!264316 (=> (not res!220965) (not e!184483))))

(declare-fun e!184481 () Bool)

(assert (=> b!264316 (= res!220965 e!184481)))

(declare-fun res!220966 () Bool)

(assert (=> b!264316 (=> res!220966 e!184481)))

(declare-datatypes ((tuple4!346 0))(
  ( (tuple4!347 (_1!12153 (_ BitVec 32)) (_2!12153 (_ BitVec 32)) (_3!953 (_ BitVec 32)) (_4!173 (_ BitVec 32))) )
))
(declare-fun lt!405632 () tuple4!346)

(assert (=> b!264316 (= res!220966 (bvsge (_1!12153 lt!405632) (_2!12153 lt!405632)))))

(declare-fun lt!405630 () (_ BitVec 32))

(assert (=> b!264316 (= lt!405630 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405631 () (_ BitVec 32))

(assert (=> b!264316 (= lt!405631 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!346)

(assert (=> b!264316 (= lt!405632 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))))))

(declare-fun b!264317 () Bool)

(declare-fun e!184485 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264317 (= e!184485 (byteRangesEq!0 (select (arr!7420 (buf!6901 w1!584)) (_4!173 lt!405632)) (select (arr!7420 (buf!6901 w2!580)) (_4!173 lt!405632)) #b00000000000000000000000000000000 lt!405630))))

(declare-fun b!264318 () Bool)

(declare-fun e!184482 () Bool)

(declare-fun call!4075 () Bool)

(assert (=> b!264318 (= e!184482 call!4075)))

(declare-fun b!264319 () Bool)

(declare-fun res!220964 () Bool)

(assert (=> b!264319 (= res!220964 (= lt!405630 #b00000000000000000000000000000000))))

(assert (=> b!264319 (=> res!220964 e!184485)))

(declare-fun e!184480 () Bool)

(assert (=> b!264319 (= e!184480 e!184485)))

(declare-fun b!264320 () Bool)

(assert (=> b!264320 (= e!184483 e!184482)))

(declare-fun c!12116 () Bool)

(assert (=> b!264320 (= c!12116 (= (_3!953 lt!405632) (_4!173 lt!405632)))))

(declare-fun d!89088 () Bool)

(declare-fun res!220967 () Bool)

(assert (=> d!89088 (=> res!220967 e!184484)))

(assert (=> d!89088 (= res!220967 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))))))

(assert (=> d!89088 (= (arrayBitRangesEq!0 (buf!6901 w1!584) (buf!6901 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))) e!184484)))

(declare-fun bm!4072 () Bool)

(assert (=> bm!4072 (= call!4075 (byteRangesEq!0 (select (arr!7420 (buf!6901 w1!584)) (_3!953 lt!405632)) (select (arr!7420 (buf!6901 w2!580)) (_3!953 lt!405632)) lt!405631 (ite c!12116 lt!405630 #b00000000000000000000000000001000)))))

(declare-fun b!264321 () Bool)

(declare-fun arrayRangesEq!1009 (array!14741 array!14741 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264321 (= e!184481 (arrayRangesEq!1009 (buf!6901 w1!584) (buf!6901 w2!580) (_1!12153 lt!405632) (_2!12153 lt!405632)))))

(declare-fun b!264322 () Bool)

(assert (=> b!264322 (= e!184482 e!184480)))

(declare-fun res!220963 () Bool)

(assert (=> b!264322 (= res!220963 call!4075)))

(assert (=> b!264322 (=> (not res!220963) (not e!184480))))

(assert (= (and d!89088 (not res!220967)) b!264316))

(assert (= (and b!264316 (not res!220966)) b!264321))

(assert (= (and b!264316 res!220965) b!264320))

(assert (= (and b!264320 c!12116) b!264318))

(assert (= (and b!264320 (not c!12116)) b!264322))

(assert (= (and b!264322 res!220963) b!264319))

(assert (= (and b!264319 (not res!220964)) b!264317))

(assert (= (or b!264318 b!264322) bm!4072))

(assert (=> b!264316 m!394639))

(declare-fun m!394771 () Bool)

(assert (=> b!264316 m!394771))

(declare-fun m!394773 () Bool)

(assert (=> b!264317 m!394773))

(declare-fun m!394775 () Bool)

(assert (=> b!264317 m!394775))

(assert (=> b!264317 m!394773))

(assert (=> b!264317 m!394775))

(declare-fun m!394777 () Bool)

(assert (=> b!264317 m!394777))

(declare-fun m!394779 () Bool)

(assert (=> bm!4072 m!394779))

(declare-fun m!394783 () Bool)

(assert (=> bm!4072 m!394783))

(assert (=> bm!4072 m!394779))

(assert (=> bm!4072 m!394783))

(declare-fun m!394787 () Bool)

(assert (=> bm!4072 m!394787))

(declare-fun m!394791 () Bool)

(assert (=> b!264321 m!394791))

(assert (=> b!264212 d!89088))

(declare-fun d!89100 () Bool)

(declare-fun e!184523 () Bool)

(assert (=> d!89100 e!184523))

(declare-fun res!221006 () Bool)

(assert (=> d!89100 (=> (not res!221006) (not e!184523))))

(declare-fun lt!405682 () (_ BitVec 64))

(declare-fun lt!405678 () (_ BitVec 64))

(declare-fun lt!405683 () (_ BitVec 64))

(assert (=> d!89100 (= res!221006 (= lt!405678 (bvsub lt!405683 lt!405682)))))

(assert (=> d!89100 (or (= (bvand lt!405683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405683 lt!405682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89100 (= lt!405682 (remainingBits!0 ((_ sign_extend 32) (size!6433 (buf!6901 w1!584))) ((_ sign_extend 32) (currentByte!12765 w1!584)) ((_ sign_extend 32) (currentBit!12760 w1!584))))))

(declare-fun lt!405680 () (_ BitVec 64))

(declare-fun lt!405681 () (_ BitVec 64))

(assert (=> d!89100 (= lt!405683 (bvmul lt!405680 lt!405681))))

(assert (=> d!89100 (or (= lt!405680 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405681 (bvsdiv (bvmul lt!405680 lt!405681) lt!405680)))))

(assert (=> d!89100 (= lt!405681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89100 (= lt!405680 ((_ sign_extend 32) (size!6433 (buf!6901 w1!584))))))

(assert (=> d!89100 (= lt!405678 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12765 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12760 w1!584))))))

(assert (=> d!89100 (invariant!0 (currentBit!12760 w1!584) (currentByte!12765 w1!584) (size!6433 (buf!6901 w1!584)))))

(assert (=> d!89100 (= (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584)) lt!405678)))

(declare-fun b!264371 () Bool)

(declare-fun res!221007 () Bool)

(assert (=> b!264371 (=> (not res!221007) (not e!184523))))

(assert (=> b!264371 (= res!221007 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405678))))

(declare-fun b!264372 () Bool)

(declare-fun lt!405679 () (_ BitVec 64))

(assert (=> b!264372 (= e!184523 (bvsle lt!405678 (bvmul lt!405679 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264372 (or (= lt!405679 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405679 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405679)))))

(assert (=> b!264372 (= lt!405679 ((_ sign_extend 32) (size!6433 (buf!6901 w1!584))))))

(assert (= (and d!89100 res!221006) b!264371))

(assert (= (and b!264371 res!221007) b!264372))

(declare-fun m!394841 () Bool)

(assert (=> d!89100 m!394841))

(assert (=> d!89100 m!394645))

(assert (=> b!264212 d!89100))

(declare-fun b!264373 () Bool)

(declare-fun e!184528 () Bool)

(declare-fun e!184527 () Bool)

(assert (=> b!264373 (= e!184528 e!184527)))

(declare-fun res!221010 () Bool)

(assert (=> b!264373 (=> (not res!221010) (not e!184527))))

(declare-fun e!184525 () Bool)

(assert (=> b!264373 (= res!221010 e!184525)))

(declare-fun res!221011 () Bool)

(assert (=> b!264373 (=> res!221011 e!184525)))

(declare-fun lt!405686 () tuple4!346)

(assert (=> b!264373 (= res!221011 (bvsge (_1!12153 lt!405686) (_2!12153 lt!405686)))))

(declare-fun lt!405684 () (_ BitVec 32))

(assert (=> b!264373 (= lt!405684 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405685 () (_ BitVec 32))

(assert (=> b!264373 (= lt!405685 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264373 (= lt!405686 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))))))

(declare-fun e!184529 () Bool)

(declare-fun b!264374 () Bool)

(assert (=> b!264374 (= e!184529 (byteRangesEq!0 (select (arr!7420 (buf!6901 w2!580)) (_4!173 lt!405686)) (select (arr!7420 (buf!6901 w1!584)) (_4!173 lt!405686)) #b00000000000000000000000000000000 lt!405684))))

(declare-fun b!264375 () Bool)

(declare-fun e!184526 () Bool)

(declare-fun call!4081 () Bool)

(assert (=> b!264375 (= e!184526 call!4081)))

(declare-fun b!264376 () Bool)

(declare-fun res!221009 () Bool)

(assert (=> b!264376 (= res!221009 (= lt!405684 #b00000000000000000000000000000000))))

(assert (=> b!264376 (=> res!221009 e!184529)))

(declare-fun e!184524 () Bool)

(assert (=> b!264376 (= e!184524 e!184529)))

(declare-fun b!264377 () Bool)

(assert (=> b!264377 (= e!184527 e!184526)))

(declare-fun c!12122 () Bool)

(assert (=> b!264377 (= c!12122 (= (_3!953 lt!405686) (_4!173 lt!405686)))))

(declare-fun d!89118 () Bool)

(declare-fun res!221012 () Bool)

(assert (=> d!89118 (=> res!221012 e!184528)))

(assert (=> d!89118 (= res!221012 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))))))

(assert (=> d!89118 (= (arrayBitRangesEq!0 (buf!6901 w2!580) (buf!6901 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))) e!184528)))

(declare-fun bm!4078 () Bool)

(assert (=> bm!4078 (= call!4081 (byteRangesEq!0 (select (arr!7420 (buf!6901 w2!580)) (_3!953 lt!405686)) (select (arr!7420 (buf!6901 w1!584)) (_3!953 lt!405686)) lt!405685 (ite c!12122 lt!405684 #b00000000000000000000000000001000)))))

(declare-fun b!264378 () Bool)

(assert (=> b!264378 (= e!184525 (arrayRangesEq!1009 (buf!6901 w2!580) (buf!6901 w1!584) (_1!12153 lt!405686) (_2!12153 lt!405686)))))

(declare-fun b!264379 () Bool)

(assert (=> b!264379 (= e!184526 e!184524)))

(declare-fun res!221008 () Bool)

(assert (=> b!264379 (= res!221008 call!4081)))

(assert (=> b!264379 (=> (not res!221008) (not e!184524))))

(assert (= (and d!89118 (not res!221012)) b!264373))

(assert (= (and b!264373 (not res!221011)) b!264378))

(assert (= (and b!264373 res!221010) b!264377))

(assert (= (and b!264377 c!12122) b!264375))

(assert (= (and b!264377 (not c!12122)) b!264379))

(assert (= (and b!264379 res!221008) b!264376))

(assert (= (and b!264376 (not res!221009)) b!264374))

(assert (= (or b!264375 b!264379) bm!4078))

(assert (=> b!264373 m!394639))

(assert (=> b!264373 m!394771))

(declare-fun m!394845 () Bool)

(assert (=> b!264374 m!394845))

(declare-fun m!394847 () Bool)

(assert (=> b!264374 m!394847))

(assert (=> b!264374 m!394845))

(assert (=> b!264374 m!394847))

(declare-fun m!394849 () Bool)

(assert (=> b!264374 m!394849))

(declare-fun m!394853 () Bool)

(assert (=> bm!4078 m!394853))

(declare-fun m!394855 () Bool)

(assert (=> bm!4078 m!394855))

(assert (=> bm!4078 m!394853))

(assert (=> bm!4078 m!394855))

(declare-fun m!394857 () Bool)

(assert (=> bm!4078 m!394857))

(declare-fun m!394859 () Bool)

(assert (=> b!264378 m!394859))

(assert (=> b!264209 d!89118))

(assert (=> b!264209 d!89100))

(assert (=> b!264203 d!89100))

(declare-fun d!89124 () Bool)

(assert (=> d!89124 (arrayBitRangesEq!0 (buf!6901 w2!580) (buf!6901 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534)))

(declare-fun lt!405701 () Unit!18830)

(declare-fun choose!8 (array!14741 array!14741 (_ BitVec 64) (_ BitVec 64)) Unit!18830)

(assert (=> d!89124 (= lt!405701 (choose!8 (buf!6901 w1!584) (buf!6901 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534))))

(assert (=> d!89124 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534))))

(assert (=> d!89124 (= (arrayBitRangesEqSymmetric!0 (buf!6901 w1!584) (buf!6901 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534) lt!405701)))

(declare-fun bs!22625 () Bool)

(assert (= bs!22625 d!89124))

(assert (=> bs!22625 m!394657))

(declare-fun m!394881 () Bool)

(assert (=> bs!22625 m!394881))

(assert (=> b!264203 d!89124))

(declare-fun b!264399 () Bool)

(declare-fun e!184548 () Bool)

(declare-fun e!184547 () Bool)

(assert (=> b!264399 (= e!184548 e!184547)))

(declare-fun res!221032 () Bool)

(assert (=> b!264399 (=> (not res!221032) (not e!184547))))

(declare-fun e!184545 () Bool)

(assert (=> b!264399 (= res!221032 e!184545)))

(declare-fun res!221033 () Bool)

(assert (=> b!264399 (=> res!221033 e!184545)))

(declare-fun lt!405706 () tuple4!346)

(assert (=> b!264399 (= res!221033 (bvsge (_1!12153 lt!405706) (_2!12153 lt!405706)))))

(declare-fun lt!405704 () (_ BitVec 32))

(assert (=> b!264399 (= lt!405704 ((_ extract 31 0) (bvsrem lt!405534 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405705 () (_ BitVec 32))

(assert (=> b!264399 (= lt!405705 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264399 (= lt!405706 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534))))

(declare-fun e!184549 () Bool)

(declare-fun b!264400 () Bool)

(assert (=> b!264400 (= e!184549 (byteRangesEq!0 (select (arr!7420 (buf!6901 w2!580)) (_4!173 lt!405706)) (select (arr!7420 (buf!6901 w1!584)) (_4!173 lt!405706)) #b00000000000000000000000000000000 lt!405704))))

(declare-fun b!264401 () Bool)

(declare-fun e!184546 () Bool)

(declare-fun call!4083 () Bool)

(assert (=> b!264401 (= e!184546 call!4083)))

(declare-fun b!264402 () Bool)

(declare-fun res!221031 () Bool)

(assert (=> b!264402 (= res!221031 (= lt!405704 #b00000000000000000000000000000000))))

(assert (=> b!264402 (=> res!221031 e!184549)))

(declare-fun e!184544 () Bool)

(assert (=> b!264402 (= e!184544 e!184549)))

(declare-fun b!264403 () Bool)

(assert (=> b!264403 (= e!184547 e!184546)))

(declare-fun c!12124 () Bool)

(assert (=> b!264403 (= c!12124 (= (_3!953 lt!405706) (_4!173 lt!405706)))))

(declare-fun d!89132 () Bool)

(declare-fun res!221034 () Bool)

(assert (=> d!89132 (=> res!221034 e!184548)))

(assert (=> d!89132 (= res!221034 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534))))

(assert (=> d!89132 (= (arrayBitRangesEq!0 (buf!6901 w2!580) (buf!6901 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405534) e!184548)))

(declare-fun bm!4080 () Bool)

(assert (=> bm!4080 (= call!4083 (byteRangesEq!0 (select (arr!7420 (buf!6901 w2!580)) (_3!953 lt!405706)) (select (arr!7420 (buf!6901 w1!584)) (_3!953 lt!405706)) lt!405705 (ite c!12124 lt!405704 #b00000000000000000000000000001000)))))

(declare-fun b!264404 () Bool)

(assert (=> b!264404 (= e!184545 (arrayRangesEq!1009 (buf!6901 w2!580) (buf!6901 w1!584) (_1!12153 lt!405706) (_2!12153 lt!405706)))))

(declare-fun b!264405 () Bool)

(assert (=> b!264405 (= e!184546 e!184544)))

(declare-fun res!221030 () Bool)

(assert (=> b!264405 (= res!221030 call!4083)))

(assert (=> b!264405 (=> (not res!221030) (not e!184544))))

(assert (= (and d!89132 (not res!221034)) b!264399))

(assert (= (and b!264399 (not res!221033)) b!264404))

(assert (= (and b!264399 res!221032) b!264403))

(assert (= (and b!264403 c!12124) b!264401))

(assert (= (and b!264403 (not c!12124)) b!264405))

(assert (= (and b!264405 res!221030) b!264402))

(assert (= (and b!264402 (not res!221031)) b!264400))

(assert (= (or b!264401 b!264405) bm!4080))

(declare-fun m!394897 () Bool)

(assert (=> b!264399 m!394897))

(declare-fun m!394899 () Bool)

(assert (=> b!264400 m!394899))

(declare-fun m!394901 () Bool)

(assert (=> b!264400 m!394901))

(assert (=> b!264400 m!394899))

(assert (=> b!264400 m!394901))

(declare-fun m!394903 () Bool)

(assert (=> b!264400 m!394903))

(declare-fun m!394905 () Bool)

(assert (=> bm!4080 m!394905))

(declare-fun m!394907 () Bool)

(assert (=> bm!4080 m!394907))

(assert (=> bm!4080 m!394905))

(assert (=> bm!4080 m!394907))

(declare-fun m!394913 () Bool)

(assert (=> bm!4080 m!394913))

(declare-fun m!394915 () Bool)

(assert (=> b!264404 m!394915))

(assert (=> b!264203 d!89132))

(declare-fun d!89150 () Bool)

(assert (=> d!89150 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405714 () Unit!18830)

(declare-fun choose!11 (BitStream!11680) Unit!18830)

(assert (=> d!89150 (= lt!405714 (choose!11 w2!580))))

(assert (=> d!89150 (= (lemmaIsPrefixRefl!0 w2!580) lt!405714)))

(declare-fun bs!22633 () Bool)

(assert (= bs!22633 d!89150))

(assert (=> bs!22633 m!394675))

(declare-fun m!394923 () Bool)

(assert (=> bs!22633 m!394923))

(assert (=> b!264208 d!89150))

(declare-fun d!89164 () Bool)

(assert (=> d!89164 (isPrefixOf!0 lt!405535 lt!405535)))

(declare-fun lt!405715 () Unit!18830)

(assert (=> d!89164 (= lt!405715 (choose!11 lt!405535))))

(assert (=> d!89164 (= (lemmaIsPrefixRefl!0 lt!405535) lt!405715)))

(declare-fun bs!22634 () Bool)

(assert (= bs!22634 d!89164))

(assert (=> bs!22634 m!394669))

(declare-fun m!394925 () Bool)

(assert (=> bs!22634 m!394925))

(assert (=> b!264208 d!89164))

(declare-fun d!89166 () Bool)

(assert (=> d!89166 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405716 () Unit!18830)

(assert (=> d!89166 (= lt!405716 (choose!11 w1!584))))

(assert (=> d!89166 (= (lemmaIsPrefixRefl!0 w1!584) lt!405716)))

(declare-fun bs!22635 () Bool)

(assert (= bs!22635 d!89166))

(assert (=> bs!22635 m!394673))

(declare-fun m!394927 () Bool)

(assert (=> bs!22635 m!394927))

(assert (=> b!264208 d!89166))

(declare-fun d!89168 () Bool)

(declare-fun res!221076 () Bool)

(declare-fun e!184583 () Bool)

(assert (=> d!89168 (=> (not res!221076) (not e!184583))))

(assert (=> d!89168 (= res!221076 (= (size!6433 (buf!6901 lt!405535)) (size!6433 (buf!6901 lt!405535))))))

(assert (=> d!89168 (= (isPrefixOf!0 lt!405535 lt!405535) e!184583)))

(declare-fun b!264450 () Bool)

(declare-fun res!221077 () Bool)

(assert (=> b!264450 (=> (not res!221077) (not e!184583))))

(assert (=> b!264450 (= res!221077 (bvsle (bitIndex!0 (size!6433 (buf!6901 lt!405535)) (currentByte!12765 lt!405535) (currentBit!12760 lt!405535)) (bitIndex!0 (size!6433 (buf!6901 lt!405535)) (currentByte!12765 lt!405535) (currentBit!12760 lt!405535))))))

(declare-fun b!264451 () Bool)

(declare-fun e!184582 () Bool)

(assert (=> b!264451 (= e!184583 e!184582)))

(declare-fun res!221075 () Bool)

(assert (=> b!264451 (=> res!221075 e!184582)))

(assert (=> b!264451 (= res!221075 (= (size!6433 (buf!6901 lt!405535)) #b00000000000000000000000000000000))))

(declare-fun b!264452 () Bool)

(assert (=> b!264452 (= e!184582 (arrayBitRangesEq!0 (buf!6901 lt!405535) (buf!6901 lt!405535) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 lt!405535)) (currentByte!12765 lt!405535) (currentBit!12760 lt!405535))))))

(assert (= (and d!89168 res!221076) b!264450))

(assert (= (and b!264450 res!221077) b!264451))

(assert (= (and b!264451 (not res!221075)) b!264452))

(declare-fun m!394971 () Bool)

(assert (=> b!264450 m!394971))

(assert (=> b!264450 m!394971))

(assert (=> b!264452 m!394971))

(assert (=> b!264452 m!394971))

(declare-fun m!394973 () Bool)

(assert (=> b!264452 m!394973))

(assert (=> b!264208 d!89168))

(declare-fun d!89188 () Bool)

(declare-fun res!221079 () Bool)

(declare-fun e!184585 () Bool)

(assert (=> d!89188 (=> (not res!221079) (not e!184585))))

(assert (=> d!89188 (= res!221079 (= (size!6433 (buf!6901 w1!584)) (size!6433 (buf!6901 w1!584))))))

(assert (=> d!89188 (= (isPrefixOf!0 w1!584 w1!584) e!184585)))

(declare-fun b!264453 () Bool)

(declare-fun res!221080 () Bool)

(assert (=> b!264453 (=> (not res!221080) (not e!184585))))

(assert (=> b!264453 (= res!221080 (bvsle (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584)) (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))))))

(declare-fun b!264454 () Bool)

(declare-fun e!184584 () Bool)

(assert (=> b!264454 (= e!184585 e!184584)))

(declare-fun res!221078 () Bool)

(assert (=> b!264454 (=> res!221078 e!184584)))

(assert (=> b!264454 (= res!221078 (= (size!6433 (buf!6901 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264455 () Bool)

(assert (=> b!264455 (= e!184584 (arrayBitRangesEq!0 (buf!6901 w1!584) (buf!6901 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))))))

(assert (= (and d!89188 res!221079) b!264453))

(assert (= (and b!264453 res!221080) b!264454))

(assert (= (and b!264454 (not res!221078)) b!264455))

(assert (=> b!264453 m!394639))

(assert (=> b!264453 m!394639))

(assert (=> b!264455 m!394639))

(assert (=> b!264455 m!394639))

(declare-fun m!394975 () Bool)

(assert (=> b!264455 m!394975))

(assert (=> b!264208 d!89188))

(declare-fun d!89190 () Bool)

(declare-fun res!221082 () Bool)

(declare-fun e!184587 () Bool)

(assert (=> d!89190 (=> (not res!221082) (not e!184587))))

(assert (=> d!89190 (= res!221082 (= (size!6433 (buf!6901 w2!580)) (size!6433 (buf!6901 w2!580))))))

(assert (=> d!89190 (= (isPrefixOf!0 w2!580 w2!580) e!184587)))

(declare-fun b!264456 () Bool)

(declare-fun res!221083 () Bool)

(assert (=> b!264456 (=> (not res!221083) (not e!184587))))

(assert (=> b!264456 (= res!221083 (bvsle (bitIndex!0 (size!6433 (buf!6901 w2!580)) (currentByte!12765 w2!580) (currentBit!12760 w2!580)) (bitIndex!0 (size!6433 (buf!6901 w2!580)) (currentByte!12765 w2!580) (currentBit!12760 w2!580))))))

(declare-fun b!264457 () Bool)

(declare-fun e!184586 () Bool)

(assert (=> b!264457 (= e!184587 e!184586)))

(declare-fun res!221081 () Bool)

(assert (=> b!264457 (=> res!221081 e!184586)))

(assert (=> b!264457 (= res!221081 (= (size!6433 (buf!6901 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!264458 () Bool)

(assert (=> b!264458 (= e!184586 (arrayBitRangesEq!0 (buf!6901 w2!580) (buf!6901 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w2!580)) (currentByte!12765 w2!580) (currentBit!12760 w2!580))))))

(assert (= (and d!89190 res!221082) b!264456))

(assert (= (and b!264456 res!221083) b!264457))

(assert (= (and b!264457 (not res!221081)) b!264458))

(declare-fun m!394977 () Bool)

(assert (=> b!264456 m!394977))

(assert (=> b!264456 m!394977))

(assert (=> b!264458 m!394977))

(assert (=> b!264458 m!394977))

(declare-fun m!394979 () Bool)

(assert (=> b!264458 m!394979))

(assert (=> b!264208 d!89190))

(declare-fun d!89192 () Bool)

(assert (=> d!89192 (= (invariant!0 (currentBit!12760 w1!584) (currentByte!12765 w1!584) (size!6433 (buf!6901 w1!584))) (and (bvsge (currentBit!12760 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12760 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12765 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12765 w1!584) (size!6433 (buf!6901 w1!584))) (and (= (currentBit!12760 w1!584) #b00000000000000000000000000000000) (= (currentByte!12765 w1!584) (size!6433 (buf!6901 w1!584)))))))))

(assert (=> b!264205 d!89192))

(declare-fun d!89194 () Bool)

(assert (=> d!89194 (isPrefixOf!0 lt!405535 w2!580)))

(declare-fun lt!405730 () Unit!18830)

(declare-fun choose!30 (BitStream!11680 BitStream!11680 BitStream!11680) Unit!18830)

(assert (=> d!89194 (= lt!405730 (choose!30 lt!405535 w2!580 w2!580))))

(assert (=> d!89194 (isPrefixOf!0 lt!405535 w2!580)))

(assert (=> d!89194 (= (lemmaIsPrefixTransitive!0 lt!405535 w2!580 w2!580) lt!405730)))

(declare-fun bs!22640 () Bool)

(assert (= bs!22640 d!89194))

(assert (=> bs!22640 m!394649))

(declare-fun m!394981 () Bool)

(assert (=> bs!22640 m!394981))

(assert (=> bs!22640 m!394649))

(assert (=> b!264205 d!89194))

(declare-fun d!89196 () Bool)

(declare-fun res!221085 () Bool)

(declare-fun e!184589 () Bool)

(assert (=> d!89196 (=> (not res!221085) (not e!184589))))

(assert (=> d!89196 (= res!221085 (= (size!6433 (buf!6901 lt!405535)) (size!6433 (buf!6901 w2!580))))))

(assert (=> d!89196 (= (isPrefixOf!0 lt!405535 w2!580) e!184589)))

(declare-fun b!264459 () Bool)

(declare-fun res!221086 () Bool)

(assert (=> b!264459 (=> (not res!221086) (not e!184589))))

(assert (=> b!264459 (= res!221086 (bvsle (bitIndex!0 (size!6433 (buf!6901 lt!405535)) (currentByte!12765 lt!405535) (currentBit!12760 lt!405535)) (bitIndex!0 (size!6433 (buf!6901 w2!580)) (currentByte!12765 w2!580) (currentBit!12760 w2!580))))))

(declare-fun b!264460 () Bool)

(declare-fun e!184588 () Bool)

(assert (=> b!264460 (= e!184589 e!184588)))

(declare-fun res!221084 () Bool)

(assert (=> b!264460 (=> res!221084 e!184588)))

(assert (=> b!264460 (= res!221084 (= (size!6433 (buf!6901 lt!405535)) #b00000000000000000000000000000000))))

(declare-fun b!264461 () Bool)

(assert (=> b!264461 (= e!184588 (arrayBitRangesEq!0 (buf!6901 lt!405535) (buf!6901 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 lt!405535)) (currentByte!12765 lt!405535) (currentBit!12760 lt!405535))))))

(assert (= (and d!89196 res!221085) b!264459))

(assert (= (and b!264459 res!221086) b!264460))

(assert (= (and b!264460 (not res!221084)) b!264461))

(assert (=> b!264459 m!394971))

(assert (=> b!264459 m!394977))

(assert (=> b!264461 m!394971))

(assert (=> b!264461 m!394971))

(declare-fun m!394983 () Bool)

(assert (=> b!264461 m!394983))

(assert (=> b!264205 d!89196))

(declare-fun d!89198 () Bool)

(assert (=> d!89198 (isPrefixOf!0 lt!405535 w2!580)))

(declare-fun lt!405731 () Unit!18830)

(assert (=> d!89198 (= lt!405731 (choose!30 lt!405535 w1!584 w2!580))))

(assert (=> d!89198 (isPrefixOf!0 lt!405535 w1!584)))

(assert (=> d!89198 (= (lemmaIsPrefixTransitive!0 lt!405535 w1!584 w2!580) lt!405731)))

(declare-fun bs!22641 () Bool)

(assert (= bs!22641 d!89198))

(assert (=> bs!22641 m!394649))

(declare-fun m!394985 () Bool)

(assert (=> bs!22641 m!394985))

(assert (=> bs!22641 m!394643))

(assert (=> b!264205 d!89198))

(declare-fun d!89200 () Bool)

(assert (=> d!89200 (= (array_inv!6157 (buf!6901 w2!580)) (bvsge (size!6433 (buf!6901 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!264204 d!89200))

(declare-fun d!89202 () Bool)

(declare-fun res!221088 () Bool)

(declare-fun e!184591 () Bool)

(assert (=> d!89202 (=> (not res!221088) (not e!184591))))

(assert (=> d!89202 (= res!221088 (= (size!6433 (buf!6901 lt!405535)) (size!6433 (buf!6901 w1!584))))))

(assert (=> d!89202 (= (isPrefixOf!0 lt!405535 w1!584) e!184591)))

(declare-fun b!264462 () Bool)

(declare-fun res!221089 () Bool)

(assert (=> b!264462 (=> (not res!221089) (not e!184591))))

(assert (=> b!264462 (= res!221089 (bvsle (bitIndex!0 (size!6433 (buf!6901 lt!405535)) (currentByte!12765 lt!405535) (currentBit!12760 lt!405535)) (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))))))

(declare-fun b!264463 () Bool)

(declare-fun e!184590 () Bool)

(assert (=> b!264463 (= e!184591 e!184590)))

(declare-fun res!221087 () Bool)

(assert (=> b!264463 (=> res!221087 e!184590)))

(assert (=> b!264463 (= res!221087 (= (size!6433 (buf!6901 lt!405535)) #b00000000000000000000000000000000))))

(declare-fun b!264464 () Bool)

(assert (=> b!264464 (= e!184590 (arrayBitRangesEq!0 (buf!6901 lt!405535) (buf!6901 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 lt!405535)) (currentByte!12765 lt!405535) (currentBit!12760 lt!405535))))))

(assert (= (and d!89202 res!221088) b!264462))

(assert (= (and b!264462 res!221089) b!264463))

(assert (= (and b!264463 (not res!221087)) b!264464))

(assert (=> b!264462 m!394971))

(assert (=> b!264462 m!394639))

(assert (=> b!264464 m!394971))

(assert (=> b!264464 m!394971))

(declare-fun m!394987 () Bool)

(assert (=> b!264464 m!394987))

(assert (=> b!264206 d!89202))

(declare-fun d!89204 () Bool)

(assert (=> d!89204 (= (array_inv!6157 (buf!6901 w1!584)) (bvsge (size!6433 (buf!6901 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!264211 d!89204))

(declare-fun d!89206 () Bool)

(declare-fun res!221091 () Bool)

(declare-fun e!184593 () Bool)

(assert (=> d!89206 (=> (not res!221091) (not e!184593))))

(assert (=> d!89206 (= res!221091 (= (size!6433 (buf!6901 w1!584)) (size!6433 (buf!6901 w2!580))))))

(assert (=> d!89206 (= (isPrefixOf!0 w1!584 w2!580) e!184593)))

(declare-fun b!264465 () Bool)

(declare-fun res!221092 () Bool)

(assert (=> b!264465 (=> (not res!221092) (not e!184593))))

(assert (=> b!264465 (= res!221092 (bvsle (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584)) (bitIndex!0 (size!6433 (buf!6901 w2!580)) (currentByte!12765 w2!580) (currentBit!12760 w2!580))))))

(declare-fun b!264466 () Bool)

(declare-fun e!184592 () Bool)

(assert (=> b!264466 (= e!184593 e!184592)))

(declare-fun res!221090 () Bool)

(assert (=> b!264466 (=> res!221090 e!184592)))

(assert (=> b!264466 (= res!221090 (= (size!6433 (buf!6901 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264467 () Bool)

(assert (=> b!264467 (= e!184592 (arrayBitRangesEq!0 (buf!6901 w1!584) (buf!6901 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6433 (buf!6901 w1!584)) (currentByte!12765 w1!584) (currentBit!12760 w1!584))))))

(assert (= (and d!89206 res!221091) b!264465))

(assert (= (and b!264465 res!221092) b!264466))

(assert (= (and b!264466 (not res!221090)) b!264467))

(assert (=> b!264465 m!394639))

(assert (=> b!264465 m!394977))

(assert (=> b!264467 m!394639))

(assert (=> b!264467 m!394639))

(assert (=> b!264467 m!394665))

(assert (=> start!57588 d!89206))

(declare-fun d!89208 () Bool)

(assert (=> d!89208 (= (inv!12 w1!584) (invariant!0 (currentBit!12760 w1!584) (currentByte!12765 w1!584) (size!6433 (buf!6901 w1!584))))))

(declare-fun bs!22642 () Bool)

(assert (= bs!22642 d!89208))

(assert (=> bs!22642 m!394645))

(assert (=> start!57588 d!89208))

(declare-fun d!89210 () Bool)

(assert (=> d!89210 (= (inv!12 w2!580) (invariant!0 (currentBit!12760 w2!580) (currentByte!12765 w2!580) (size!6433 (buf!6901 w2!580))))))

(declare-fun bs!22643 () Bool)

(assert (= bs!22643 d!89210))

(declare-fun m!394989 () Bool)

(assert (=> bs!22643 m!394989))

(assert (=> start!57588 d!89210))

(push 1)

(assert (not d!89150))

(assert (not b!264453))

(assert (not b!264462))

(assert (not bm!4072))

(assert (not b!264464))

(assert (not d!89164))

(assert (not d!89124))

(assert (not b!264461))

(assert (not d!89198))

(assert (not b!264316))

(assert (not b!264373))

(assert (not d!89208))

(assert (not b!264399))

(assert (not b!264317))

(assert (not b!264450))

(assert (not b!264400))

(assert (not b!264456))

(assert (not d!89166))

(assert (not bm!4078))

(assert (not b!264321))

(assert (not b!264404))

(assert (not b!264458))

(assert (not b!264455))

(assert (not d!89194))

(assert (not b!264467))

(assert (not b!264374))

