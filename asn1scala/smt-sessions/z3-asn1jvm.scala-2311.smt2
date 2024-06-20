; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58610 () Bool)

(assert start!58610)

(declare-fun b!269104 () Bool)

(declare-fun e!189070 () Bool)

(declare-datatypes ((array!15001 0))(
  ( (array!15002 (arr!7526 (Array (_ BitVec 32) (_ BitVec 8))) (size!6539 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11892 0))(
  ( (BitStream!11893 (buf!7007 array!15001) (currentByte!12943 (_ BitVec 32)) (currentBit!12938 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11892)

(declare-fun array_inv!6263 (array!15001) Bool)

(assert (=> b!269104 (= e!189070 (array_inv!6263 (buf!7007 w1!591)))))

(declare-fun b!269105 () Bool)

(declare-fun e!189074 () Bool)

(declare-fun w2!587 () BitStream!11892)

(assert (=> b!269105 (= e!189074 (array_inv!6263 (buf!7007 w2!587)))))

(declare-fun b!269106 () Bool)

(declare-fun res!224355 () Bool)

(declare-fun e!189075 () Bool)

(assert (=> b!269106 (=> (not res!224355) (not e!189075))))

(declare-fun w3!25 () BitStream!11892)

(declare-fun isPrefixOf!0 (BitStream!11892 BitStream!11892) Bool)

(assert (=> b!269106 (= res!224355 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!224356 () Bool)

(assert (=> start!58610 (=> (not res!224356) (not e!189075))))

(assert (=> start!58610 (= res!224356 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58610 e!189075))

(declare-fun inv!12 (BitStream!11892) Bool)

(assert (=> start!58610 (and (inv!12 w1!591) e!189070)))

(assert (=> start!58610 (and (inv!12 w2!587) e!189074)))

(declare-fun e!189072 () Bool)

(assert (=> start!58610 (and (inv!12 w3!25) e!189072)))

(declare-fun b!269107 () Bool)

(assert (=> b!269107 (= e!189075 (and (bvsle #b00000000000000000000000000000000 (currentByte!12943 w1!591)) (bvsle (currentByte!12943 w1!591) (currentByte!12943 w2!587)) (or (bvsgt (size!6539 (buf!7007 w1!591)) (size!6539 (buf!7007 w2!587))) (bvsgt (size!6539 (buf!7007 w2!587)) (size!6539 (buf!7007 w3!25))))))))

(declare-fun b!269108 () Bool)

(assert (=> b!269108 (= e!189072 (array_inv!6263 (buf!7007 w3!25)))))

(assert (= (and start!58610 res!224356) b!269106))

(assert (= (and b!269106 res!224355) b!269107))

(assert (= start!58610 b!269104))

(assert (= start!58610 b!269105))

(assert (= start!58610 b!269108))

(declare-fun m!400647 () Bool)

(assert (=> b!269106 m!400647))

(declare-fun m!400649 () Bool)

(assert (=> b!269104 m!400649))

(declare-fun m!400651 () Bool)

(assert (=> start!58610 m!400651))

(declare-fun m!400653 () Bool)

(assert (=> start!58610 m!400653))

(declare-fun m!400655 () Bool)

(assert (=> start!58610 m!400655))

(declare-fun m!400657 () Bool)

(assert (=> start!58610 m!400657))

(declare-fun m!400659 () Bool)

(assert (=> b!269108 m!400659))

(declare-fun m!400661 () Bool)

(assert (=> b!269105 m!400661))

(check-sat (not b!269106) (not b!269108) (not b!269105) (not start!58610) (not b!269104))
(check-sat)
(get-model)

(declare-fun d!91040 () Bool)

(declare-fun res!224369 () Bool)

(declare-fun e!189102 () Bool)

(assert (=> d!91040 (=> (not res!224369) (not e!189102))))

(assert (=> d!91040 (= res!224369 (= (size!6539 (buf!7007 w1!591)) (size!6539 (buf!7007 w2!587))))))

(assert (=> d!91040 (= (isPrefixOf!0 w1!591 w2!587) e!189102)))

(declare-fun b!269130 () Bool)

(declare-fun res!224371 () Bool)

(assert (=> b!269130 (=> (not res!224371) (not e!189102))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269130 (= res!224371 (bvsle (bitIndex!0 (size!6539 (buf!7007 w1!591)) (currentByte!12943 w1!591) (currentBit!12938 w1!591)) (bitIndex!0 (size!6539 (buf!7007 w2!587)) (currentByte!12943 w2!587) (currentBit!12938 w2!587))))))

(declare-fun b!269131 () Bool)

(declare-fun e!189101 () Bool)

(assert (=> b!269131 (= e!189102 e!189101)))

(declare-fun res!224370 () Bool)

(assert (=> b!269131 (=> res!224370 e!189101)))

(assert (=> b!269131 (= res!224370 (= (size!6539 (buf!7007 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269132 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15001 array!15001 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269132 (= e!189101 (arrayBitRangesEq!0 (buf!7007 w1!591) (buf!7007 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6539 (buf!7007 w1!591)) (currentByte!12943 w1!591) (currentBit!12938 w1!591))))))

(assert (= (and d!91040 res!224369) b!269130))

(assert (= (and b!269130 res!224371) b!269131))

(assert (= (and b!269131 (not res!224370)) b!269132))

(declare-fun m!400679 () Bool)

(assert (=> b!269130 m!400679))

(declare-fun m!400681 () Bool)

(assert (=> b!269130 m!400681))

(assert (=> b!269132 m!400679))

(assert (=> b!269132 m!400679))

(declare-fun m!400683 () Bool)

(assert (=> b!269132 m!400683))

(assert (=> start!58610 d!91040))

(declare-fun d!91044 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91044 (= (inv!12 w1!591) (invariant!0 (currentBit!12938 w1!591) (currentByte!12943 w1!591) (size!6539 (buf!7007 w1!591))))))

(declare-fun bs!23082 () Bool)

(assert (= bs!23082 d!91044))

(declare-fun m!400685 () Bool)

(assert (=> bs!23082 m!400685))

(assert (=> start!58610 d!91044))

(declare-fun d!91046 () Bool)

(assert (=> d!91046 (= (inv!12 w2!587) (invariant!0 (currentBit!12938 w2!587) (currentByte!12943 w2!587) (size!6539 (buf!7007 w2!587))))))

(declare-fun bs!23083 () Bool)

(assert (= bs!23083 d!91046))

(declare-fun m!400687 () Bool)

(assert (=> bs!23083 m!400687))

(assert (=> start!58610 d!91046))

(declare-fun d!91048 () Bool)

(assert (=> d!91048 (= (inv!12 w3!25) (invariant!0 (currentBit!12938 w3!25) (currentByte!12943 w3!25) (size!6539 (buf!7007 w3!25))))))

(declare-fun bs!23084 () Bool)

(assert (= bs!23084 d!91048))

(declare-fun m!400689 () Bool)

(assert (=> bs!23084 m!400689))

(assert (=> start!58610 d!91048))

(declare-fun d!91050 () Bool)

(assert (=> d!91050 (= (array_inv!6263 (buf!7007 w3!25)) (bvsge (size!6539 (buf!7007 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269108 d!91050))

(declare-fun d!91052 () Bool)

(assert (=> d!91052 (= (array_inv!6263 (buf!7007 w1!591)) (bvsge (size!6539 (buf!7007 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269104 d!91052))

(declare-fun d!91054 () Bool)

(declare-fun res!224378 () Bool)

(declare-fun e!189108 () Bool)

(assert (=> d!91054 (=> (not res!224378) (not e!189108))))

(assert (=> d!91054 (= res!224378 (= (size!6539 (buf!7007 w2!587)) (size!6539 (buf!7007 w3!25))))))

(assert (=> d!91054 (= (isPrefixOf!0 w2!587 w3!25) e!189108)))

(declare-fun b!269137 () Bool)

(declare-fun res!224380 () Bool)

(assert (=> b!269137 (=> (not res!224380) (not e!189108))))

(assert (=> b!269137 (= res!224380 (bvsle (bitIndex!0 (size!6539 (buf!7007 w2!587)) (currentByte!12943 w2!587) (currentBit!12938 w2!587)) (bitIndex!0 (size!6539 (buf!7007 w3!25)) (currentByte!12943 w3!25) (currentBit!12938 w3!25))))))

(declare-fun b!269138 () Bool)

(declare-fun e!189107 () Bool)

(assert (=> b!269138 (= e!189108 e!189107)))

(declare-fun res!224379 () Bool)

(assert (=> b!269138 (=> res!224379 e!189107)))

(assert (=> b!269138 (= res!224379 (= (size!6539 (buf!7007 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269139 () Bool)

(assert (=> b!269139 (= e!189107 (arrayBitRangesEq!0 (buf!7007 w2!587) (buf!7007 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6539 (buf!7007 w2!587)) (currentByte!12943 w2!587) (currentBit!12938 w2!587))))))

(assert (= (and d!91054 res!224378) b!269137))

(assert (= (and b!269137 res!224380) b!269138))

(assert (= (and b!269138 (not res!224379)) b!269139))

(assert (=> b!269137 m!400681))

(declare-fun m!400691 () Bool)

(assert (=> b!269137 m!400691))

(assert (=> b!269139 m!400681))

(assert (=> b!269139 m!400681))

(declare-fun m!400693 () Bool)

(assert (=> b!269139 m!400693))

(assert (=> b!269106 d!91054))

(declare-fun d!91058 () Bool)

(assert (=> d!91058 (= (array_inv!6263 (buf!7007 w2!587)) (bvsge (size!6539 (buf!7007 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269105 d!91058))

(check-sat (not b!269139) (not d!91044) (not d!91046) (not b!269130) (not d!91048) (not b!269132) (not b!269137))
(check-sat)
