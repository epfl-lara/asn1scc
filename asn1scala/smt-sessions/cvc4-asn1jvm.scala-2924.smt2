; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69698 () Bool)

(assert start!69698)

(declare-fun res!256669 () Bool)

(declare-fun e!225670 () Bool)

(assert (=> start!69698 (=> (not res!256669) (not e!225670))))

(declare-fun mid!77 () (_ BitVec 64))

(declare-datatypes ((array!19271 0))(
  ( (array!19272 (arr!9441 (Array (_ BitVec 32) (_ BitVec 8))) (size!8361 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19271)

(declare-fun a2!799 () array!19271)

(declare-fun a3!74 () array!19271)

(declare-fun from!870 () (_ BitVec 64))

(declare-fun to!837 () (_ BitVec 64))

(assert (=> start!69698 (= res!256669 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8361 a1!799) (size!8361 a2!799)) (= (size!8361 a2!799) (size!8361 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8361 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8361 a2!799))))))))

(assert (=> start!69698 e!225670))

(assert (=> start!69698 true))

(declare-fun array_inv!7913 (array!19271) Bool)

(assert (=> start!69698 (array_inv!7913 a1!799)))

(assert (=> start!69698 (array_inv!7913 a2!799)))

(assert (=> start!69698 (array_inv!7913 a3!74)))

(declare-fun b!313492 () Bool)

(declare-fun res!256668 () Bool)

(assert (=> b!313492 (=> (not res!256668) (not e!225670))))

(declare-fun arrayBitRangesEq!0 (array!19271 array!19271 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313492 (= res!256668 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun b!313493 () Bool)

(declare-fun res!256670 () Bool)

(assert (=> b!313493 (=> (not res!256670) (not e!225670))))

(assert (=> b!313493 (= res!256670 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313494 () Bool)

(assert (=> b!313494 (= e!225670 (not (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870)))))

(assert (= (and start!69698 res!256669) b!313492))

(assert (= (and b!313492 res!256668) b!313493))

(assert (= (and b!313493 res!256670) b!313494))

(declare-fun m!451091 () Bool)

(assert (=> start!69698 m!451091))

(declare-fun m!451093 () Bool)

(assert (=> start!69698 m!451093))

(declare-fun m!451095 () Bool)

(assert (=> start!69698 m!451095))

(declare-fun m!451097 () Bool)

(assert (=> b!313492 m!451097))

(declare-fun m!451099 () Bool)

(assert (=> b!313493 m!451099))

(declare-fun m!451101 () Bool)

(assert (=> b!313494 m!451101))

(push 1)

(assert (not b!313494))

(assert (not b!313493))

(assert (not b!313492))

(assert (not start!69698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!313572 () Bool)

(declare-fun e!225741 () Bool)

(declare-fun e!225743 () Bool)

(assert (=> b!313572 (= e!225741 e!225743)))

(declare-fun res!256729 () Bool)

(assert (=> b!313572 (=> (not res!256729) (not e!225743))))

(declare-fun e!225742 () Bool)

(assert (=> b!313572 (= res!256729 e!225742)))

(declare-fun res!256726 () Bool)

(assert (=> b!313572 (=> res!256726 e!225742)))

(declare-datatypes ((tuple4!1276 0))(
  ( (tuple4!1277 (_1!13317 (_ BitVec 32)) (_2!13317 (_ BitVec 32)) (_3!1595 (_ BitVec 32)) (_4!638 (_ BitVec 32))) )
))
(declare-fun lt!442322 () tuple4!1276)

(assert (=> b!313572 (= res!256726 (bvsge (_1!13317 lt!442322) (_2!13317 lt!442322)))))

(declare-fun lt!442320 () (_ BitVec 32))

(assert (=> b!313572 (= lt!442320 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!442321 () (_ BitVec 32))

(assert (=> b!313572 (= lt!442321 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1276)

(assert (=> b!313572 (= lt!442322 (arrayBitIndices!0 from!870 from!870))))

(declare-fun b!313573 () Bool)

(declare-fun arrayRangesEq!1792 (array!19271 array!19271 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!313573 (= e!225742 (arrayRangesEq!1792 a1!799 a3!74 (_1!13317 lt!442322) (_2!13317 lt!442322)))))

(declare-fun b!313574 () Bool)

(declare-fun res!256727 () Bool)

(assert (=> b!313574 (= res!256727 (= lt!442320 #b00000000000000000000000000000000))))

(declare-fun e!225745 () Bool)

(assert (=> b!313574 (=> res!256727 e!225745)))

(declare-fun e!225744 () Bool)

(assert (=> b!313574 (= e!225744 e!225745)))

(declare-fun b!313575 () Bool)

(declare-fun e!225740 () Bool)

(declare-fun call!5927 () Bool)

(assert (=> b!313575 (= e!225740 call!5927)))

(declare-fun b!313576 () Bool)

(assert (=> b!313576 (= e!225745 call!5927)))

(declare-fun b!313577 () Bool)

(assert (=> b!313577 (= e!225740 e!225744)))

(declare-fun res!256730 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!313577 (= res!256730 (byteRangesEq!0 (select (arr!9441 a1!799) (_3!1595 lt!442322)) (select (arr!9441 a3!74) (_3!1595 lt!442322)) lt!442321 #b00000000000000000000000000001000))))

(assert (=> b!313577 (=> (not res!256730) (not e!225744))))

(declare-fun d!103882 () Bool)

(declare-fun res!256728 () Bool)

(assert (=> d!103882 (=> res!256728 e!225741)))

(assert (=> d!103882 (= res!256728 (bvsge from!870 from!870))))

(assert (=> d!103882 (= (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870) e!225741)))

(declare-fun c!15208 () Bool)

(declare-fun bm!5924 () Bool)

(assert (=> bm!5924 (= call!5927 (byteRangesEq!0 (ite c!15208 (select (arr!9441 a1!799) (_3!1595 lt!442322)) (select (arr!9441 a1!799) (_4!638 lt!442322))) (ite c!15208 (select (arr!9441 a3!74) (_3!1595 lt!442322)) (select (arr!9441 a3!74) (_4!638 lt!442322))) (ite c!15208 lt!442321 #b00000000000000000000000000000000) lt!442320))))

(declare-fun b!313578 () Bool)

(assert (=> b!313578 (= e!225743 e!225740)))

(assert (=> b!313578 (= c!15208 (= (_3!1595 lt!442322) (_4!638 lt!442322)))))

(assert (= (and d!103882 (not res!256728)) b!313572))

(assert (= (and b!313572 (not res!256726)) b!313573))

(assert (= (and b!313572 res!256729) b!313578))

(assert (= (and b!313578 c!15208) b!313575))

(assert (= (and b!313578 (not c!15208)) b!313577))

(assert (= (and b!313577 res!256730) b!313574))

(assert (= (and b!313574 (not res!256727)) b!313576))

(assert (= (or b!313575 b!313576) bm!5924))

(declare-fun m!451181 () Bool)

(assert (=> b!313572 m!451181))

(declare-fun m!451183 () Bool)

(assert (=> b!313573 m!451183))

(declare-fun m!451185 () Bool)

(assert (=> b!313577 m!451185))

(declare-fun m!451187 () Bool)

(assert (=> b!313577 m!451187))

(assert (=> b!313577 m!451185))

(assert (=> b!313577 m!451187))

(declare-fun m!451191 () Bool)

(assert (=> b!313577 m!451191))

(declare-fun m!451193 () Bool)

(assert (=> bm!5924 m!451193))

(declare-fun m!451195 () Bool)

(assert (=> bm!5924 m!451195))

(assert (=> bm!5924 m!451185))

(declare-fun m!451197 () Bool)

(assert (=> bm!5924 m!451197))

(assert (=> bm!5924 m!451187))

(assert (=> b!313494 d!103882))

(declare-fun b!313586 () Bool)

(declare-fun e!225753 () Bool)

(declare-fun e!225755 () Bool)

(assert (=> b!313586 (= e!225753 e!225755)))

(declare-fun res!256739 () Bool)

(assert (=> b!313586 (=> (not res!256739) (not e!225755))))

(declare-fun e!225754 () Bool)

(assert (=> b!313586 (= res!256739 e!225754)))

(declare-fun res!256736 () Bool)

(assert (=> b!313586 (=> res!256736 e!225754)))

(declare-fun lt!442328 () tuple4!1276)

(assert (=> b!313586 (= res!256736 (bvsge (_1!13317 lt!442328) (_2!13317 lt!442328)))))

(declare-fun lt!442326 () (_ BitVec 32))

(assert (=> b!313586 (= lt!442326 ((_ extract 31 0) (bvsrem to!837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!442327 () (_ BitVec 32))

(assert (=> b!313586 (= lt!442327 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313586 (= lt!442328 (arrayBitIndices!0 from!870 to!837))))

(declare-fun b!313587 () Bool)

(assert (=> b!313587 (= e!225754 (arrayRangesEq!1792 a2!799 a3!74 (_1!13317 lt!442328) (_2!13317 lt!442328)))))

(declare-fun b!313588 () Bool)

(declare-fun res!256737 () Bool)

(assert (=> b!313588 (= res!256737 (= lt!442326 #b00000000000000000000000000000000))))

(declare-fun e!225757 () Bool)

(assert (=> b!313588 (=> res!256737 e!225757)))

(declare-fun e!225756 () Bool)

(assert (=> b!313588 (= e!225756 e!225757)))

(declare-fun b!313589 () Bool)

(declare-fun e!225752 () Bool)

(declare-fun call!5929 () Bool)

(assert (=> b!313589 (= e!225752 call!5929)))

(declare-fun b!313590 () Bool)

(assert (=> b!313590 (= e!225757 call!5929)))

(declare-fun b!313591 () Bool)

(assert (=> b!313591 (= e!225752 e!225756)))

(declare-fun res!256740 () Bool)

(assert (=> b!313591 (= res!256740 (byteRangesEq!0 (select (arr!9441 a2!799) (_3!1595 lt!442328)) (select (arr!9441 a3!74) (_3!1595 lt!442328)) lt!442327 #b00000000000000000000000000001000))))

(assert (=> b!313591 (=> (not res!256740) (not e!225756))))

(declare-fun d!103898 () Bool)

(declare-fun res!256738 () Bool)

(assert (=> d!103898 (=> res!256738 e!225753)))

(assert (=> d!103898 (= res!256738 (bvsge from!870 to!837))))

(assert (=> d!103898 (= (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837) e!225753)))

(declare-fun bm!5926 () Bool)

(declare-fun c!15210 () Bool)

(assert (=> bm!5926 (= call!5929 (byteRangesEq!0 (ite c!15210 (select (arr!9441 a2!799) (_3!1595 lt!442328)) (select (arr!9441 a2!799) (_4!638 lt!442328))) (ite c!15210 (select (arr!9441 a3!74) (_3!1595 lt!442328)) (select (arr!9441 a3!74) (_4!638 lt!442328))) (ite c!15210 lt!442327 #b00000000000000000000000000000000) lt!442326))))

(declare-fun b!313592 () Bool)

(assert (=> b!313592 (= e!225755 e!225752)))

(assert (=> b!313592 (= c!15210 (= (_3!1595 lt!442328) (_4!638 lt!442328)))))

(assert (= (and d!103898 (not res!256738)) b!313586))

(assert (= (and b!313586 (not res!256736)) b!313587))

(assert (= (and b!313586 res!256739) b!313592))

(assert (= (and b!313592 c!15210) b!313589))

(assert (= (and b!313592 (not c!15210)) b!313591))

(assert (= (and b!313591 res!256740) b!313588))

(assert (= (and b!313588 (not res!256737)) b!313590))

(assert (= (or b!313589 b!313590) bm!5926))

(declare-fun m!451201 () Bool)

(assert (=> b!313586 m!451201))

(declare-fun m!451203 () Bool)

(assert (=> b!313587 m!451203))

(declare-fun m!451207 () Bool)

(assert (=> b!313591 m!451207))

(declare-fun m!451209 () Bool)

(assert (=> b!313591 m!451209))

(assert (=> b!313591 m!451207))

(assert (=> b!313591 m!451209))

(declare-fun m!451211 () Bool)

(assert (=> b!313591 m!451211))

(declare-fun m!451215 () Bool)

(assert (=> bm!5926 m!451215))

(declare-fun m!451219 () Bool)

(assert (=> bm!5926 m!451219))

(assert (=> bm!5926 m!451207))

(declare-fun m!451227 () Bool)

(assert (=> bm!5926 m!451227))

(assert (=> bm!5926 m!451209))

(assert (=> b!313493 d!103898))

(declare-fun b!313593 () Bool)

(declare-fun e!225759 () Bool)

(declare-fun e!225761 () Bool)

(assert (=> b!313593 (= e!225759 e!225761)))

(declare-fun res!256744 () Bool)

(assert (=> b!313593 (=> (not res!256744) (not e!225761))))

(declare-fun e!225760 () Bool)

(assert (=> b!313593 (= res!256744 e!225760)))

(declare-fun res!256741 () Bool)

(assert (=> b!313593 (=> res!256741 e!225760)))

(declare-fun lt!442331 () tuple4!1276)

(assert (=> b!313593 (= res!256741 (bvsge (_1!13317 lt!442331) (_2!13317 lt!442331)))))

(declare-fun lt!442329 () (_ BitVec 32))

(assert (=> b!313593 (= lt!442329 ((_ extract 31 0) (bvsrem mid!77 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!442330 () (_ BitVec 32))

(assert (=> b!313593 (= lt!442330 ((_ extract 31 0) (bvsrem from!870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!313593 (= lt!442331 (arrayBitIndices!0 from!870 mid!77))))

(declare-fun b!313594 () Bool)

(assert (=> b!313594 (= e!225760 (arrayRangesEq!1792 a1!799 a2!799 (_1!13317 lt!442331) (_2!13317 lt!442331)))))

(declare-fun b!313595 () Bool)

(declare-fun res!256742 () Bool)

(assert (=> b!313595 (= res!256742 (= lt!442329 #b00000000000000000000000000000000))))

(declare-fun e!225763 () Bool)

(assert (=> b!313595 (=> res!256742 e!225763)))

(declare-fun e!225762 () Bool)

(assert (=> b!313595 (= e!225762 e!225763)))

(declare-fun b!313596 () Bool)

(declare-fun e!225758 () Bool)

(declare-fun call!5930 () Bool)

(assert (=> b!313596 (= e!225758 call!5930)))

(declare-fun b!313597 () Bool)

(assert (=> b!313597 (= e!225763 call!5930)))

(declare-fun b!313598 () Bool)

(assert (=> b!313598 (= e!225758 e!225762)))

(declare-fun res!256745 () Bool)

(assert (=> b!313598 (= res!256745 (byteRangesEq!0 (select (arr!9441 a1!799) (_3!1595 lt!442331)) (select (arr!9441 a2!799) (_3!1595 lt!442331)) lt!442330 #b00000000000000000000000000001000))))

(assert (=> b!313598 (=> (not res!256745) (not e!225762))))

(declare-fun d!103900 () Bool)

(declare-fun res!256743 () Bool)

(assert (=> d!103900 (=> res!256743 e!225759)))

(assert (=> d!103900 (= res!256743 (bvsge from!870 mid!77))))

(assert (=> d!103900 (= (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77) e!225759)))

(declare-fun c!15211 () Bool)

(declare-fun bm!5927 () Bool)

(assert (=> bm!5927 (= call!5930 (byteRangesEq!0 (ite c!15211 (select (arr!9441 a1!799) (_3!1595 lt!442331)) (select (arr!9441 a1!799) (_4!638 lt!442331))) (ite c!15211 (select (arr!9441 a2!799) (_3!1595 lt!442331)) (select (arr!9441 a2!799) (_4!638 lt!442331))) (ite c!15211 lt!442330 #b00000000000000000000000000000000) lt!442329))))

