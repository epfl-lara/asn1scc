; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58802 () Bool)

(assert start!58802)

(declare-fun b!269893 () Bool)

(declare-fun e!189778 () Bool)

(declare-datatypes ((array!15037 0))(
  ( (array!15038 (arr!7538 (Array (_ BitVec 32) (_ BitVec 8))) (size!6551 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11916 0))(
  ( (BitStream!11917 (buf!7019 array!15037) (currentByte!12978 (_ BitVec 32)) (currentBit!12973 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11916)

(declare-fun w2!587 () BitStream!11916)

(assert (=> b!269893 (= e!189778 (not (or (bvsge (currentByte!12978 w1!591) (size!6551 (buf!7019 w1!591))) (bvsge (currentByte!12978 w1!591) (currentByte!12978 w2!587)) (bvsle #b00000000000000000000000000000000 (currentByte!12978 w2!587)))))))

(declare-fun w3!25 () BitStream!11916)

(declare-fun arrayRangesEq!1083 (array!15037 array!15037 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269893 (arrayRangesEq!1083 (buf!7019 w1!591) (buf!7019 w3!25) #b00000000000000000000000000000000 (currentByte!12978 w1!591))))

(declare-datatypes ((Unit!19057 0))(
  ( (Unit!19058) )
))
(declare-fun lt!409241 () Unit!19057)

(declare-fun arrayRangesEqTransitive!346 (array!15037 array!15037 array!15037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19057)

(assert (=> b!269893 (= lt!409241 (arrayRangesEqTransitive!346 (buf!7019 w1!591) (buf!7019 w2!587) (buf!7019 w3!25) #b00000000000000000000000000000000 (currentByte!12978 w1!591) (currentByte!12978 w2!587)))))

(declare-fun b!269894 () Bool)

(declare-fun e!189775 () Bool)

(declare-fun array_inv!6275 (array!15037) Bool)

(assert (=> b!269894 (= e!189775 (array_inv!6275 (buf!7019 w3!25)))))

(declare-fun b!269895 () Bool)

(declare-fun res!224964 () Bool)

(assert (=> b!269895 (=> (not res!224964) (not e!189778))))

(declare-fun isPrefixOf!0 (BitStream!11916 BitStream!11916) Bool)

(assert (=> b!269895 (= res!224964 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!224965 () Bool)

(assert (=> start!58802 (=> (not res!224965) (not e!189778))))

(assert (=> start!58802 (= res!224965 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58802 e!189778))

(declare-fun e!189777 () Bool)

(declare-fun inv!12 (BitStream!11916) Bool)

(assert (=> start!58802 (and (inv!12 w1!591) e!189777)))

(declare-fun e!189774 () Bool)

(assert (=> start!58802 (and (inv!12 w2!587) e!189774)))

(assert (=> start!58802 (and (inv!12 w3!25) e!189775)))

(declare-fun b!269896 () Bool)

(assert (=> b!269896 (= e!189774 (array_inv!6275 (buf!7019 w2!587)))))

(declare-fun b!269897 () Bool)

(assert (=> b!269897 (= e!189777 (array_inv!6275 (buf!7019 w1!591)))))

(assert (= (and start!58802 res!224965) b!269895))

(assert (= (and b!269895 res!224964) b!269893))

(assert (= start!58802 b!269897))

(assert (= start!58802 b!269896))

(assert (= start!58802 b!269894))

(declare-fun m!401663 () Bool)

(assert (=> b!269897 m!401663))

(declare-fun m!401665 () Bool)

(assert (=> b!269895 m!401665))

(declare-fun m!401667 () Bool)

(assert (=> b!269893 m!401667))

(declare-fun m!401669 () Bool)

(assert (=> b!269893 m!401669))

(declare-fun m!401671 () Bool)

(assert (=> b!269894 m!401671))

(declare-fun m!401673 () Bool)

(assert (=> start!58802 m!401673))

(declare-fun m!401675 () Bool)

(assert (=> start!58802 m!401675))

(declare-fun m!401677 () Bool)

(assert (=> start!58802 m!401677))

(declare-fun m!401679 () Bool)

(assert (=> start!58802 m!401679))

(declare-fun m!401681 () Bool)

(assert (=> b!269896 m!401681))

(check-sat (not b!269897) (not b!269895) (not b!269894) (not b!269896) (not start!58802) (not b!269893))
(check-sat)
(get-model)

(declare-fun d!91546 () Bool)

(declare-fun res!224985 () Bool)

(declare-fun e!189811 () Bool)

(assert (=> d!91546 (=> (not res!224985) (not e!189811))))

(assert (=> d!91546 (= res!224985 (= (size!6551 (buf!7019 w1!591)) (size!6551 (buf!7019 w2!587))))))

(assert (=> d!91546 (= (isPrefixOf!0 w1!591 w2!587) e!189811)))

(declare-fun b!269925 () Bool)

(declare-fun res!224984 () Bool)

(assert (=> b!269925 (=> (not res!224984) (not e!189811))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269925 (= res!224984 (bvsle (bitIndex!0 (size!6551 (buf!7019 w1!591)) (currentByte!12978 w1!591) (currentBit!12973 w1!591)) (bitIndex!0 (size!6551 (buf!7019 w2!587)) (currentByte!12978 w2!587) (currentBit!12973 w2!587))))))

(declare-fun b!269926 () Bool)

(declare-fun e!189810 () Bool)

(assert (=> b!269926 (= e!189811 e!189810)))

(declare-fun res!224986 () Bool)

(assert (=> b!269926 (=> res!224986 e!189810)))

(assert (=> b!269926 (= res!224986 (= (size!6551 (buf!7019 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269927 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15037 array!15037 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269927 (= e!189810 (arrayBitRangesEq!0 (buf!7019 w1!591) (buf!7019 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6551 (buf!7019 w1!591)) (currentByte!12978 w1!591) (currentBit!12973 w1!591))))))

(assert (= (and d!91546 res!224985) b!269925))

(assert (= (and b!269925 res!224984) b!269926))

(assert (= (and b!269926 (not res!224986)) b!269927))

(declare-fun m!401704 () Bool)

(assert (=> b!269925 m!401704))

(declare-fun m!401709 () Bool)

(assert (=> b!269925 m!401709))

(assert (=> b!269927 m!401704))

(assert (=> b!269927 m!401704))

(declare-fun m!401713 () Bool)

(assert (=> b!269927 m!401713))

(assert (=> start!58802 d!91546))

(declare-fun d!91552 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91552 (= (inv!12 w1!591) (invariant!0 (currentBit!12973 w1!591) (currentByte!12978 w1!591) (size!6551 (buf!7019 w1!591))))))

(declare-fun bs!23150 () Bool)

(assert (= bs!23150 d!91552))

(declare-fun m!401715 () Bool)

(assert (=> bs!23150 m!401715))

(assert (=> start!58802 d!91552))

(declare-fun d!91556 () Bool)

(assert (=> d!91556 (= (inv!12 w2!587) (invariant!0 (currentBit!12973 w2!587) (currentByte!12978 w2!587) (size!6551 (buf!7019 w2!587))))))

(declare-fun bs!23151 () Bool)

(assert (= bs!23151 d!91556))

(declare-fun m!401719 () Bool)

(assert (=> bs!23151 m!401719))

(assert (=> start!58802 d!91556))

(declare-fun d!91558 () Bool)

(assert (=> d!91558 (= (inv!12 w3!25) (invariant!0 (currentBit!12973 w3!25) (currentByte!12978 w3!25) (size!6551 (buf!7019 w3!25))))))

(declare-fun bs!23152 () Bool)

(assert (= bs!23152 d!91558))

(declare-fun m!401723 () Bool)

(assert (=> bs!23152 m!401723))

(assert (=> start!58802 d!91558))

(declare-fun d!91562 () Bool)

(declare-fun res!224994 () Bool)

(declare-fun e!189817 () Bool)

(assert (=> d!91562 (=> (not res!224994) (not e!189817))))

(assert (=> d!91562 (= res!224994 (= (size!6551 (buf!7019 w2!587)) (size!6551 (buf!7019 w3!25))))))

(assert (=> d!91562 (= (isPrefixOf!0 w2!587 w3!25) e!189817)))

(declare-fun b!269934 () Bool)

(declare-fun res!224993 () Bool)

(assert (=> b!269934 (=> (not res!224993) (not e!189817))))

(assert (=> b!269934 (= res!224993 (bvsle (bitIndex!0 (size!6551 (buf!7019 w2!587)) (currentByte!12978 w2!587) (currentBit!12973 w2!587)) (bitIndex!0 (size!6551 (buf!7019 w3!25)) (currentByte!12978 w3!25) (currentBit!12973 w3!25))))))

(declare-fun b!269935 () Bool)

(declare-fun e!189816 () Bool)

(assert (=> b!269935 (= e!189817 e!189816)))

(declare-fun res!224995 () Bool)

(assert (=> b!269935 (=> res!224995 e!189816)))

(assert (=> b!269935 (= res!224995 (= (size!6551 (buf!7019 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269936 () Bool)

(assert (=> b!269936 (= e!189816 (arrayBitRangesEq!0 (buf!7019 w2!587) (buf!7019 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6551 (buf!7019 w2!587)) (currentByte!12978 w2!587) (currentBit!12973 w2!587))))))

(assert (= (and d!91562 res!224994) b!269934))

(assert (= (and b!269934 res!224993) b!269935))

(assert (= (and b!269935 (not res!224995)) b!269936))

(assert (=> b!269934 m!401709))

(declare-fun m!401725 () Bool)

(assert (=> b!269934 m!401725))

(assert (=> b!269936 m!401709))

(assert (=> b!269936 m!401709))

(declare-fun m!401727 () Bool)

(assert (=> b!269936 m!401727))

(assert (=> b!269895 d!91562))

(declare-fun d!91564 () Bool)

(assert (=> d!91564 (= (array_inv!6275 (buf!7019 w3!25)) (bvsge (size!6551 (buf!7019 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269894 d!91564))

(declare-fun d!91572 () Bool)

(declare-fun res!225004 () Bool)

(declare-fun e!189826 () Bool)

(assert (=> d!91572 (=> res!225004 e!189826)))

(assert (=> d!91572 (= res!225004 (= #b00000000000000000000000000000000 (currentByte!12978 w1!591)))))

(assert (=> d!91572 (= (arrayRangesEq!1083 (buf!7019 w1!591) (buf!7019 w3!25) #b00000000000000000000000000000000 (currentByte!12978 w1!591)) e!189826)))

(declare-fun b!269945 () Bool)

(declare-fun e!189827 () Bool)

(assert (=> b!269945 (= e!189826 e!189827)))

(declare-fun res!225005 () Bool)

(assert (=> b!269945 (=> (not res!225005) (not e!189827))))

(assert (=> b!269945 (= res!225005 (= (select (arr!7538 (buf!7019 w1!591)) #b00000000000000000000000000000000) (select (arr!7538 (buf!7019 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!269946 () Bool)

(assert (=> b!269946 (= e!189827 (arrayRangesEq!1083 (buf!7019 w1!591) (buf!7019 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12978 w1!591)))))

(assert (= (and d!91572 (not res!225004)) b!269945))

(assert (= (and b!269945 res!225005) b!269946))

(declare-fun m!401735 () Bool)

(assert (=> b!269945 m!401735))

(declare-fun m!401737 () Bool)

(assert (=> b!269945 m!401737))

(declare-fun m!401739 () Bool)

(assert (=> b!269946 m!401739))

(assert (=> b!269893 d!91572))

(declare-fun d!91578 () Bool)

(assert (=> d!91578 (arrayRangesEq!1083 (buf!7019 w1!591) (buf!7019 w3!25) #b00000000000000000000000000000000 (currentByte!12978 w1!591))))

(declare-fun lt!409249 () Unit!19057)

(declare-fun choose!384 (array!15037 array!15037 array!15037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19057)

(assert (=> d!91578 (= lt!409249 (choose!384 (buf!7019 w1!591) (buf!7019 w2!587) (buf!7019 w3!25) #b00000000000000000000000000000000 (currentByte!12978 w1!591) (currentByte!12978 w2!587)))))

(assert (=> d!91578 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12978 w1!591)) (bvsle (currentByte!12978 w1!591) (currentByte!12978 w2!587)))))

(assert (=> d!91578 (= (arrayRangesEqTransitive!346 (buf!7019 w1!591) (buf!7019 w2!587) (buf!7019 w3!25) #b00000000000000000000000000000000 (currentByte!12978 w1!591) (currentByte!12978 w2!587)) lt!409249)))

(declare-fun bs!23156 () Bool)

(assert (= bs!23156 d!91578))

(assert (=> bs!23156 m!401667))

(declare-fun m!401747 () Bool)

(assert (=> bs!23156 m!401747))

(assert (=> b!269893 d!91578))

(declare-fun d!91586 () Bool)

(assert (=> d!91586 (= (array_inv!6275 (buf!7019 w1!591)) (bvsge (size!6551 (buf!7019 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269897 d!91586))

(declare-fun d!91588 () Bool)

(assert (=> d!91588 (= (array_inv!6275 (buf!7019 w2!587)) (bvsge (size!6551 (buf!7019 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269896 d!91588))

(check-sat (not d!91556) (not b!269927) (not d!91558) (not b!269946) (not b!269934) (not b!269936) (not b!269925) (not d!91552) (not d!91578))
(check-sat)
