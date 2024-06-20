; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62156 () Bool)

(assert start!62156)

(declare-fun b!278814 () Bool)

(declare-fun e!198641 () Bool)

(declare-fun e!198639 () Bool)

(assert (=> b!278814 (= e!198641 e!198639)))

(declare-fun res!231516 () Bool)

(assert (=> b!278814 (=> (not res!231516) (not e!198639))))

(declare-datatypes ((tuple4!668 0))(
  ( (tuple4!669 (_1!12409 (_ BitVec 32)) (_2!12409 (_ BitVec 32)) (_3!1114 (_ BitVec 32)) (_4!334 (_ BitVec 32))) )
))
(declare-fun lt!416124 () tuple4!668)

(assert (=> b!278814 (= res!231516 (bvslt (_1!12409 lt!416124) (_2!12409 lt!416124)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!668)

(assert (=> b!278814 (= lt!416124 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278812 () Bool)

(declare-fun res!231518 () Bool)

(assert (=> b!278812 (=> (not res!231518) (not e!198641))))

(declare-datatypes ((array!16077 0))(
  ( (array!16078 (arr!7955 (Array (_ BitVec 32) (_ BitVec 8))) (size!6959 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16077)

(declare-fun a2!699 () array!16077)

(declare-fun arrayBitRangesEq!0 (array!16077 array!16077 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278812 (= res!231518 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun res!231515 () Bool)

(assert (=> start!62156 (=> (not res!231515) (not e!198641))))

(assert (=> start!62156 (= res!231515 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6959 a1!699) (size!6959 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6959 a1!699))))))))

(assert (=> start!62156 e!198641))

(assert (=> start!62156 true))

(declare-fun array_inv!6683 (array!16077) Bool)

(assert (=> start!62156 (array_inv!6683 a1!699)))

(assert (=> start!62156 (array_inv!6683 a2!699)))

(declare-fun b!278815 () Bool)

(declare-fun arrayRangesEq!1227 (array!16077 array!16077 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278815 (= e!198639 (not (arrayRangesEq!1227 a1!699 a2!699 (_1!12409 lt!416124) (_2!12409 lt!416124))))))

(declare-fun b!278813 () Bool)

(declare-fun res!231517 () Bool)

(assert (=> b!278813 (=> (not res!231517) (not e!198641))))

(assert (=> b!278813 (= res!231517 (bvslt from!822 to!789))))

(assert (= (and start!62156 res!231515) b!278812))

(assert (= (and b!278812 res!231518) b!278813))

(assert (= (and b!278813 res!231517) b!278814))

(assert (= (and b!278814 res!231516) b!278815))

(declare-fun m!411935 () Bool)

(assert (=> b!278814 m!411935))

(declare-fun m!411937 () Bool)

(assert (=> b!278812 m!411937))

(declare-fun m!411939 () Bool)

(assert (=> start!62156 m!411939))

(declare-fun m!411941 () Bool)

(assert (=> start!62156 m!411941))

(declare-fun m!411943 () Bool)

(assert (=> b!278815 m!411943))

(check-sat (not b!278814) (not b!278815) (not start!62156) (not b!278812))
(check-sat)
(get-model)

(declare-fun d!95944 () Bool)

(assert (=> d!95944 (= (arrayBitIndices!0 from!822 to!789) (tuple4!669 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!278814 d!95944))

(declare-fun d!95952 () Bool)

(declare-fun res!231577 () Bool)

(declare-fun e!198707 () Bool)

(assert (=> d!95952 (=> res!231577 e!198707)))

(assert (=> d!95952 (= res!231577 (= (_1!12409 lt!416124) (_2!12409 lt!416124)))))

(assert (=> d!95952 (= (arrayRangesEq!1227 a1!699 a2!699 (_1!12409 lt!416124) (_2!12409 lt!416124)) e!198707)))

(declare-fun b!278886 () Bool)

(declare-fun e!198708 () Bool)

(assert (=> b!278886 (= e!198707 e!198708)))

(declare-fun res!231578 () Bool)

(assert (=> b!278886 (=> (not res!231578) (not e!198708))))

(assert (=> b!278886 (= res!231578 (= (select (arr!7955 a1!699) (_1!12409 lt!416124)) (select (arr!7955 a2!699) (_1!12409 lt!416124))))))

(declare-fun b!278887 () Bool)

(assert (=> b!278887 (= e!198708 (arrayRangesEq!1227 a1!699 a2!699 (bvadd (_1!12409 lt!416124) #b00000000000000000000000000000001) (_2!12409 lt!416124)))))

(assert (= (and d!95952 (not res!231577)) b!278886))

(assert (= (and b!278886 res!231578) b!278887))

(declare-fun m!411995 () Bool)

(assert (=> b!278886 m!411995))

(declare-fun m!411997 () Bool)

(assert (=> b!278886 m!411997))

(declare-fun m!411999 () Bool)

(assert (=> b!278887 m!411999))

(assert (=> b!278815 d!95952))

(declare-fun d!95954 () Bool)

(assert (=> d!95954 (= (array_inv!6683 a1!699) (bvsge (size!6959 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62156 d!95954))

(declare-fun d!95956 () Bool)

(assert (=> d!95956 (= (array_inv!6683 a2!699) (bvsge (size!6959 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62156 d!95956))

(declare-fun lt!416152 () (_ BitVec 32))

(declare-fun bm!4532 () Bool)

(declare-fun lt!416154 () (_ BitVec 32))

(declare-fun call!4535 () Bool)

(declare-fun c!12828 () Bool)

(declare-fun lt!416153 () tuple4!668)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4532 (= call!4535 (byteRangesEq!0 (select (arr!7955 a1!699) (_3!1114 lt!416153)) (select (arr!7955 a2!699) (_3!1114 lt!416153)) lt!416152 (ite c!12828 lt!416154 #b00000000000000000000000000001000)))))

(declare-fun d!95958 () Bool)

(declare-fun res!231589 () Bool)

(declare-fun e!198726 () Bool)

(assert (=> d!95958 (=> res!231589 e!198726)))

(assert (=> d!95958 (= res!231589 (bvsge from!822 to!789))))

(assert (=> d!95958 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!198726)))

(declare-fun b!278902 () Bool)

(declare-fun e!198721 () Bool)

(declare-fun e!198723 () Bool)

(assert (=> b!278902 (= e!198721 e!198723)))

(declare-fun res!231592 () Bool)

(assert (=> b!278902 (= res!231592 call!4535)))

(assert (=> b!278902 (=> (not res!231592) (not e!198723))))

(declare-fun b!278903 () Bool)

(declare-fun e!198724 () Bool)

(assert (=> b!278903 (= e!198724 e!198721)))

(assert (=> b!278903 (= c!12828 (= (_3!1114 lt!416153) (_4!334 lt!416153)))))

(declare-fun b!278904 () Bool)

(declare-fun e!198725 () Bool)

(assert (=> b!278904 (= e!198725 (arrayRangesEq!1227 a1!699 a2!699 (_1!12409 lt!416153) (_2!12409 lt!416153)))))

(declare-fun b!278905 () Bool)

(assert (=> b!278905 (= e!198721 call!4535)))

(declare-fun e!198722 () Bool)

(declare-fun b!278906 () Bool)

(assert (=> b!278906 (= e!198722 (byteRangesEq!0 (select (arr!7955 a1!699) (_4!334 lt!416153)) (select (arr!7955 a2!699) (_4!334 lt!416153)) #b00000000000000000000000000000000 lt!416154))))

(declare-fun b!278907 () Bool)

(declare-fun res!231593 () Bool)

(assert (=> b!278907 (= res!231593 (= lt!416154 #b00000000000000000000000000000000))))

(assert (=> b!278907 (=> res!231593 e!198722)))

(assert (=> b!278907 (= e!198723 e!198722)))

(declare-fun b!278908 () Bool)

(assert (=> b!278908 (= e!198726 e!198724)))

(declare-fun res!231590 () Bool)

(assert (=> b!278908 (=> (not res!231590) (not e!198724))))

(assert (=> b!278908 (= res!231590 e!198725)))

(declare-fun res!231591 () Bool)

(assert (=> b!278908 (=> res!231591 e!198725)))

(assert (=> b!278908 (= res!231591 (bvsge (_1!12409 lt!416153) (_2!12409 lt!416153)))))

(assert (=> b!278908 (= lt!416154 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278908 (= lt!416152 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278908 (= lt!416153 (arrayBitIndices!0 from!822 to!789))))

(assert (= (and d!95958 (not res!231589)) b!278908))

(assert (= (and b!278908 (not res!231591)) b!278904))

(assert (= (and b!278908 res!231590) b!278903))

(assert (= (and b!278903 c!12828) b!278905))

(assert (= (and b!278903 (not c!12828)) b!278902))

(assert (= (and b!278902 res!231592) b!278907))

(assert (= (and b!278907 (not res!231593)) b!278906))

(assert (= (or b!278905 b!278902) bm!4532))

(declare-fun m!412001 () Bool)

(assert (=> bm!4532 m!412001))

(declare-fun m!412003 () Bool)

(assert (=> bm!4532 m!412003))

(assert (=> bm!4532 m!412001))

(assert (=> bm!4532 m!412003))

(declare-fun m!412005 () Bool)

(assert (=> bm!4532 m!412005))

(declare-fun m!412007 () Bool)

(assert (=> b!278904 m!412007))

(declare-fun m!412009 () Bool)

(assert (=> b!278906 m!412009))

(declare-fun m!412011 () Bool)

(assert (=> b!278906 m!412011))

(assert (=> b!278906 m!412009))

(assert (=> b!278906 m!412011))

(declare-fun m!412013 () Bool)

(assert (=> b!278906 m!412013))

(assert (=> b!278908 m!411935))

(assert (=> b!278812 d!95958))

(check-sat (not b!278887) (not b!278908) (not b!278904) (not bm!4532) (not b!278906))
(check-sat)
