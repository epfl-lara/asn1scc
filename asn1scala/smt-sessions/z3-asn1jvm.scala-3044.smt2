; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70634 () Bool)

(assert start!70634)

(declare-fun res!262711 () Bool)

(declare-fun e!229910 () Bool)

(assert (=> start!70634 (=> (not res!262711) (not e!229910))))

(declare-fun lt!443615 () (_ BitVec 64))

(assert (=> start!70634 (= res!262711 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443615))))

(declare-datatypes ((array!20011 0))(
  ( (array!20012 (arr!9812 (Array (_ BitVec 32) (_ BitVec 8))) (size!8720 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20011)

(assert (=> start!70634 (= lt!443615 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8720 a!422))))))

(assert (=> start!70634 e!229910))

(declare-fun array_inv!8272 (array!20011) Bool)

(assert (=> start!70634 (array_inv!8272 a!422)))

(declare-fun b!319733 () Bool)

(declare-fun arrayBitRangesEq!0 (array!20011 array!20011 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319733 (= e!229910 (not (arrayBitRangesEq!0 a!422 a!422 lt!443615 lt!443615)))))

(assert (= (and start!70634 res!262711) b!319733))

(declare-fun m!458217 () Bool)

(assert (=> start!70634 m!458217))

(declare-fun m!458219 () Bool)

(assert (=> b!319733 m!458219))

(check-sat (not b!319733) (not start!70634))
(check-sat)
(get-model)

(declare-fun b!319793 () Bool)

(declare-fun res!262756 () Bool)

(declare-fun lt!443643 () (_ BitVec 32))

(assert (=> b!319793 (= res!262756 (= lt!443643 #b00000000000000000000000000000000))))

(declare-fun e!229969 () Bool)

(assert (=> b!319793 (=> res!262756 e!229969)))

(declare-fun e!229970 () Bool)

(assert (=> b!319793 (= e!229970 e!229969)))

(declare-fun b!319794 () Bool)

(declare-fun e!229966 () Bool)

(declare-fun e!229968 () Bool)

(assert (=> b!319794 (= e!229966 e!229968)))

(declare-fun res!262758 () Bool)

(assert (=> b!319794 (=> (not res!262758) (not e!229968))))

(declare-fun e!229967 () Bool)

(assert (=> b!319794 (= res!262758 e!229967)))

(declare-fun res!262759 () Bool)

(assert (=> b!319794 (=> res!262759 e!229967)))

(declare-datatypes ((tuple4!1316 0))(
  ( (tuple4!1317 (_1!13337 (_ BitVec 32)) (_2!13337 (_ BitVec 32)) (_3!1615 (_ BitVec 32)) (_4!658 (_ BitVec 32))) )
))
(declare-fun lt!443645 () tuple4!1316)

(assert (=> b!319794 (= res!262759 (bvsge (_1!13337 lt!443645) (_2!13337 lt!443645)))))

(assert (=> b!319794 (= lt!443643 ((_ extract 31 0) (bvsrem lt!443615 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!443644 () (_ BitVec 32))

(assert (=> b!319794 (= lt!443644 ((_ extract 31 0) (bvsrem lt!443615 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1316)

(assert (=> b!319794 (= lt!443645 (arrayBitIndices!0 lt!443615 lt!443615))))

(declare-fun call!6023 () Bool)

(declare-fun c!15304 () Bool)

(declare-fun bm!6020 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6020 (= call!6023 (byteRangesEq!0 (ite c!15304 (select (arr!9812 a!422) (_3!1615 lt!443645)) (select (arr!9812 a!422) (_4!658 lt!443645))) (ite c!15304 (select (arr!9812 a!422) (_3!1615 lt!443645)) (select (arr!9812 a!422) (_4!658 lt!443645))) (ite c!15304 lt!443644 #b00000000000000000000000000000000) lt!443643))))

(declare-fun d!104768 () Bool)

(declare-fun res!262757 () Bool)

(assert (=> d!104768 (=> res!262757 e!229966)))

(assert (=> d!104768 (= res!262757 (bvsge lt!443615 lt!443615))))

(assert (=> d!104768 (= (arrayBitRangesEq!0 a!422 a!422 lt!443615 lt!443615) e!229966)))

(declare-fun b!319795 () Bool)

(declare-fun arrayRangesEq!1813 (array!20011 array!20011 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319795 (= e!229967 (arrayRangesEq!1813 a!422 a!422 (_1!13337 lt!443645) (_2!13337 lt!443645)))))

(declare-fun b!319796 () Bool)

(assert (=> b!319796 (= e!229969 call!6023)))

(declare-fun b!319797 () Bool)

(declare-fun e!229971 () Bool)

(assert (=> b!319797 (= e!229971 call!6023)))

(declare-fun b!319798 () Bool)

(assert (=> b!319798 (= e!229968 e!229971)))

(assert (=> b!319798 (= c!15304 (= (_3!1615 lt!443645) (_4!658 lt!443645)))))

(declare-fun b!319799 () Bool)

(assert (=> b!319799 (= e!229971 e!229970)))

(declare-fun res!262755 () Bool)

(assert (=> b!319799 (= res!262755 (byteRangesEq!0 (select (arr!9812 a!422) (_3!1615 lt!443645)) (select (arr!9812 a!422) (_3!1615 lt!443645)) lt!443644 #b00000000000000000000000000001000))))

(assert (=> b!319799 (=> (not res!262755) (not e!229970))))

(assert (= (and d!104768 (not res!262757)) b!319794))

(assert (= (and b!319794 (not res!262759)) b!319795))

(assert (= (and b!319794 res!262758) b!319798))

(assert (= (and b!319798 c!15304) b!319797))

(assert (= (and b!319798 (not c!15304)) b!319799))

(assert (= (and b!319799 res!262755) b!319793))

(assert (= (and b!319793 (not res!262756)) b!319796))

(assert (= (or b!319797 b!319796) bm!6020))

(declare-fun m!458237 () Bool)

(assert (=> b!319794 m!458237))

(declare-fun m!458243 () Bool)

(assert (=> bm!6020 m!458243))

(assert (=> bm!6020 m!458243))

(declare-fun m!458249 () Bool)

(assert (=> bm!6020 m!458249))

(declare-fun m!458251 () Bool)

(assert (=> bm!6020 m!458251))

(assert (=> bm!6020 m!458249))

(declare-fun m!458255 () Bool)

(assert (=> b!319795 m!458255))

(assert (=> b!319799 m!458249))

(assert (=> b!319799 m!458249))

(assert (=> b!319799 m!458249))

(assert (=> b!319799 m!458249))

(declare-fun m!458259 () Bool)

(assert (=> b!319799 m!458259))

(assert (=> b!319733 d!104768))

(declare-fun d!104774 () Bool)

(assert (=> d!104774 (= (array_inv!8272 a!422) (bvsge (size!8720 a!422) #b00000000000000000000000000000000))))

(assert (=> start!70634 d!104774))

(check-sat (not b!319794) (not b!319799) (not bm!6020) (not b!319795))
(check-sat)
