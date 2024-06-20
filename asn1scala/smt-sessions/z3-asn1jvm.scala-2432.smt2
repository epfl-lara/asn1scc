; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61946 () Bool)

(assert start!61946)

(declare-fun b!277634 () Bool)

(declare-fun res!230609 () Bool)

(declare-fun e!197580 () Bool)

(assert (=> b!277634 (=> (not res!230609) (not e!197580))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277634 (= res!230609 (bvslt from!822 to!789))))

(declare-fun b!277633 () Bool)

(declare-fun res!230606 () Bool)

(assert (=> b!277633 (=> (not res!230606) (not e!197580))))

(declare-datatypes ((array!15954 0))(
  ( (array!15955 (arr!7898 (Array (_ BitVec 32) (_ BitVec 8))) (size!6902 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15954)

(declare-fun a2!699 () array!15954)

(declare-fun arrayBitRangesEq!0 (array!15954 array!15954 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277633 (= res!230606 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277636 () Bool)

(declare-datatypes ((tuple4!590 0))(
  ( (tuple4!591 (_1!12370 (_ BitVec 32)) (_2!12370 (_ BitVec 32)) (_3!1075 (_ BitVec 32)) (_4!295 (_ BitVec 32))) )
))
(declare-fun lt!415500 () tuple4!590)

(declare-fun e!197578 () Bool)

(assert (=> b!277636 (= e!197578 (not (or (bvsgt #b00000000000000000000000000000000 (_1!12370 lt!415500)) (bvsgt (_1!12370 lt!415500) (_2!12370 lt!415500)) (bvsgt (size!6902 a2!699) (size!6902 a1!699)) (bvsle (_2!12370 lt!415500) (size!6902 a2!699)))))))

(declare-fun arrayRangesEq!1188 (array!15954 array!15954 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277636 (arrayRangesEq!1188 a2!699 a1!699 (_1!12370 lt!415500) (_2!12370 lt!415500))))

(declare-datatypes ((Unit!19403 0))(
  ( (Unit!19404) )
))
(declare-fun lt!415499 () Unit!19403)

(declare-fun arrayRangesEqSymmetricLemma!107 (array!15954 array!15954 (_ BitVec 32) (_ BitVec 32)) Unit!19403)

(assert (=> b!277636 (= lt!415499 (arrayRangesEqSymmetricLemma!107 a1!699 a2!699 (_1!12370 lt!415500) (_2!12370 lt!415500)))))

(assert (=> b!277636 (arrayRangesEq!1188 a1!699 a2!699 (_1!12370 lt!415500) (_2!12370 lt!415500))))

(declare-fun b!277635 () Bool)

(assert (=> b!277635 (= e!197580 e!197578)))

(declare-fun res!230608 () Bool)

(assert (=> b!277635 (=> (not res!230608) (not e!197578))))

(assert (=> b!277635 (= res!230608 (bvslt (_1!12370 lt!415500) (_2!12370 lt!415500)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!590)

(assert (=> b!277635 (= lt!415500 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!230607 () Bool)

(assert (=> start!61946 (=> (not res!230607) (not e!197580))))

(assert (=> start!61946 (= res!230607 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6902 a1!699) (size!6902 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6902 a1!699))))))))

(assert (=> start!61946 e!197580))

(assert (=> start!61946 true))

(declare-fun array_inv!6626 (array!15954) Bool)

(assert (=> start!61946 (array_inv!6626 a1!699)))

(assert (=> start!61946 (array_inv!6626 a2!699)))

(assert (= (and start!61946 res!230607) b!277633))

(assert (= (and b!277633 res!230606) b!277634))

(assert (= (and b!277634 res!230609) b!277635))

(assert (= (and b!277635 res!230608) b!277636))

(declare-fun m!410769 () Bool)

(assert (=> b!277633 m!410769))

(declare-fun m!410771 () Bool)

(assert (=> b!277636 m!410771))

(declare-fun m!410773 () Bool)

(assert (=> b!277636 m!410773))

(declare-fun m!410775 () Bool)

(assert (=> b!277636 m!410775))

(declare-fun m!410777 () Bool)

(assert (=> b!277635 m!410777))

(declare-fun m!410779 () Bool)

(assert (=> start!61946 m!410779))

(declare-fun m!410781 () Bool)

(assert (=> start!61946 m!410781))

(check-sat (not b!277635) (not b!277633) (not start!61946) (not b!277636))
(check-sat)
(get-model)

(declare-fun d!95762 () Bool)

(assert (=> d!95762 (= (arrayBitIndices!0 from!822 to!789) (tuple4!591 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277635 d!95762))

(declare-fun b!277685 () Bool)

(declare-fun lt!415524 () tuple4!590)

(declare-fun e!197629 () Bool)

(assert (=> b!277685 (= e!197629 (arrayRangesEq!1188 a1!699 a2!699 (_1!12370 lt!415524) (_2!12370 lt!415524)))))

(declare-fun d!95764 () Bool)

(declare-fun res!230654 () Bool)

(declare-fun e!197630 () Bool)

(assert (=> d!95764 (=> res!230654 e!197630)))

(assert (=> d!95764 (= res!230654 (bvsge from!822 to!789))))

(assert (=> d!95764 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197630)))

(declare-fun b!277686 () Bool)

(declare-fun e!197626 () Bool)

(assert (=> b!277686 (= e!197630 e!197626)))

(declare-fun res!230650 () Bool)

(assert (=> b!277686 (=> (not res!230650) (not e!197626))))

(assert (=> b!277686 (= res!230650 e!197629)))

(declare-fun res!230652 () Bool)

(assert (=> b!277686 (=> res!230652 e!197629)))

(assert (=> b!277686 (= res!230652 (bvsge (_1!12370 lt!415524) (_2!12370 lt!415524)))))

(declare-fun lt!415523 () (_ BitVec 32))

(assert (=> b!277686 (= lt!415523 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415522 () (_ BitVec 32))

(assert (=> b!277686 (= lt!415522 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277686 (= lt!415524 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277687 () Bool)

(declare-fun e!197627 () Bool)

(assert (=> b!277687 (= e!197626 e!197627)))

(declare-fun c!12689 () Bool)

(assert (=> b!277687 (= c!12689 (= (_3!1075 lt!415524) (_4!295 lt!415524)))))

(declare-fun b!277688 () Bool)

(declare-fun res!230653 () Bool)

(assert (=> b!277688 (= res!230653 (= lt!415523 #b00000000000000000000000000000000))))

(declare-fun e!197628 () Bool)

(assert (=> b!277688 (=> res!230653 e!197628)))

(declare-fun e!197625 () Bool)

(assert (=> b!277688 (= e!197625 e!197628)))

(declare-fun call!4504 () Bool)

(declare-fun bm!4501 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4501 (= call!4504 (byteRangesEq!0 (ite c!12689 (select (arr!7898 a1!699) (_3!1075 lt!415524)) (select (arr!7898 a1!699) (_4!295 lt!415524))) (ite c!12689 (select (arr!7898 a2!699) (_3!1075 lt!415524)) (select (arr!7898 a2!699) (_4!295 lt!415524))) (ite c!12689 lt!415522 #b00000000000000000000000000000000) lt!415523))))

(declare-fun b!277689 () Bool)

(assert (=> b!277689 (= e!197627 call!4504)))

(declare-fun b!277690 () Bool)

(assert (=> b!277690 (= e!197628 call!4504)))

(declare-fun b!277691 () Bool)

(assert (=> b!277691 (= e!197627 e!197625)))

(declare-fun res!230651 () Bool)

(assert (=> b!277691 (= res!230651 (byteRangesEq!0 (select (arr!7898 a1!699) (_3!1075 lt!415524)) (select (arr!7898 a2!699) (_3!1075 lt!415524)) lt!415522 #b00000000000000000000000000001000))))

(assert (=> b!277691 (=> (not res!230651) (not e!197625))))

(assert (= (and d!95764 (not res!230654)) b!277686))

(assert (= (and b!277686 (not res!230652)) b!277685))

(assert (= (and b!277686 res!230650) b!277687))

(assert (= (and b!277687 c!12689) b!277689))

(assert (= (and b!277687 (not c!12689)) b!277691))

(assert (= (and b!277691 res!230651) b!277688))

(assert (= (and b!277688 (not res!230653)) b!277690))

(assert (= (or b!277689 b!277690) bm!4501))

(declare-fun m!410807 () Bool)

(assert (=> b!277685 m!410807))

(assert (=> b!277686 m!410777))

(declare-fun m!410809 () Bool)

(assert (=> bm!4501 m!410809))

(declare-fun m!410811 () Bool)

(assert (=> bm!4501 m!410811))

(declare-fun m!410813 () Bool)

(assert (=> bm!4501 m!410813))

(declare-fun m!410815 () Bool)

(assert (=> bm!4501 m!410815))

(declare-fun m!410817 () Bool)

(assert (=> bm!4501 m!410817))

(assert (=> b!277691 m!410811))

(assert (=> b!277691 m!410813))

(assert (=> b!277691 m!410811))

(assert (=> b!277691 m!410813))

(declare-fun m!410819 () Bool)

(assert (=> b!277691 m!410819))

(assert (=> b!277633 d!95764))

(declare-fun d!95780 () Bool)

(assert (=> d!95780 (= (array_inv!6626 a1!699) (bvsge (size!6902 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!61946 d!95780))

(declare-fun d!95782 () Bool)

(assert (=> d!95782 (= (array_inv!6626 a2!699) (bvsge (size!6902 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!61946 d!95782))

(declare-fun d!95784 () Bool)

(declare-fun res!230664 () Bool)

(declare-fun e!197641 () Bool)

(assert (=> d!95784 (=> res!230664 e!197641)))

(assert (=> d!95784 (= res!230664 (= (_1!12370 lt!415500) (_2!12370 lt!415500)))))

(assert (=> d!95784 (= (arrayRangesEq!1188 a2!699 a1!699 (_1!12370 lt!415500) (_2!12370 lt!415500)) e!197641)))

(declare-fun b!277703 () Bool)

(declare-fun e!197642 () Bool)

(assert (=> b!277703 (= e!197641 e!197642)))

(declare-fun res!230665 () Bool)

(assert (=> b!277703 (=> (not res!230665) (not e!197642))))

(assert (=> b!277703 (= res!230665 (= (select (arr!7898 a2!699) (_1!12370 lt!415500)) (select (arr!7898 a1!699) (_1!12370 lt!415500))))))

(declare-fun b!277704 () Bool)

(assert (=> b!277704 (= e!197642 (arrayRangesEq!1188 a2!699 a1!699 (bvadd (_1!12370 lt!415500) #b00000000000000000000000000000001) (_2!12370 lt!415500)))))

(assert (= (and d!95784 (not res!230664)) b!277703))

(assert (= (and b!277703 res!230665) b!277704))

(declare-fun m!410835 () Bool)

(assert (=> b!277703 m!410835))

(declare-fun m!410837 () Bool)

(assert (=> b!277703 m!410837))

(declare-fun m!410839 () Bool)

(assert (=> b!277704 m!410839))

(assert (=> b!277636 d!95784))

(declare-fun d!95790 () Bool)

(assert (=> d!95790 (arrayRangesEq!1188 a2!699 a1!699 (_1!12370 lt!415500) (_2!12370 lt!415500))))

(declare-fun lt!415532 () Unit!19403)

(declare-fun choose!450 (array!15954 array!15954 (_ BitVec 32) (_ BitVec 32)) Unit!19403)

(assert (=> d!95790 (= lt!415532 (choose!450 a1!699 a2!699 (_1!12370 lt!415500) (_2!12370 lt!415500)))))

(assert (=> d!95790 (and (bvsle #b00000000000000000000000000000000 (_1!12370 lt!415500)) (bvsle (_1!12370 lt!415500) (_2!12370 lt!415500)) (bvsle (_2!12370 lt!415500) (size!6902 a1!699)))))

(assert (=> d!95790 (= (arrayRangesEqSymmetricLemma!107 a1!699 a2!699 (_1!12370 lt!415500) (_2!12370 lt!415500)) lt!415532)))

(declare-fun bs!24153 () Bool)

(assert (= bs!24153 d!95790))

(assert (=> bs!24153 m!410771))

(declare-fun m!410841 () Bool)

(assert (=> bs!24153 m!410841))

(assert (=> b!277636 d!95790))

(declare-fun d!95794 () Bool)

(declare-fun res!230672 () Bool)

(declare-fun e!197649 () Bool)

(assert (=> d!95794 (=> res!230672 e!197649)))

(assert (=> d!95794 (= res!230672 (= (_1!12370 lt!415500) (_2!12370 lt!415500)))))

(assert (=> d!95794 (= (arrayRangesEq!1188 a1!699 a2!699 (_1!12370 lt!415500) (_2!12370 lt!415500)) e!197649)))

(declare-fun b!277711 () Bool)

(declare-fun e!197650 () Bool)

(assert (=> b!277711 (= e!197649 e!197650)))

(declare-fun res!230673 () Bool)

(assert (=> b!277711 (=> (not res!230673) (not e!197650))))

(assert (=> b!277711 (= res!230673 (= (select (arr!7898 a1!699) (_1!12370 lt!415500)) (select (arr!7898 a2!699) (_1!12370 lt!415500))))))

(declare-fun b!277712 () Bool)

(assert (=> b!277712 (= e!197650 (arrayRangesEq!1188 a1!699 a2!699 (bvadd (_1!12370 lt!415500) #b00000000000000000000000000000001) (_2!12370 lt!415500)))))

(assert (= (and d!95794 (not res!230672)) b!277711))

(assert (= (and b!277711 res!230673) b!277712))

(assert (=> b!277711 m!410837))

(assert (=> b!277711 m!410835))

(declare-fun m!410843 () Bool)

(assert (=> b!277712 m!410843))

(assert (=> b!277636 d!95794))

(check-sat (not d!95790) (not b!277712) (not b!277704) (not b!277685) (not b!277691) (not bm!4501) (not b!277686))
(check-sat)
