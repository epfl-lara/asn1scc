; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62234 () Bool)

(assert start!62234)

(declare-fun b!279159 () Bool)

(declare-fun e!198964 () Bool)

(declare-datatypes ((tuple4!698 0))(
  ( (tuple4!699 (_1!12424 (_ BitVec 32)) (_2!12424 (_ BitVec 32)) (_3!1129 (_ BitVec 32)) (_4!349 (_ BitVec 32))) )
))
(declare-fun lt!416242 () tuple4!698)

(declare-datatypes ((array!16113 0))(
  ( (array!16114 (arr!7970 (Array (_ BitVec 32) (_ BitVec 8))) (size!6974 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16113)

(assert (=> b!279159 (= e!198964 (and (= (_3!1129 lt!416242) (_4!349 lt!416242)) (or (bvslt (_3!1129 lt!416242) #b00000000000000000000000000000000) (bvsge (_3!1129 lt!416242) (size!6974 a1!699)))))))

(declare-datatypes ((Unit!19561 0))(
  ( (Unit!19562) )
))
(declare-fun lt!416244 () Unit!19561)

(declare-fun e!198965 () Unit!19561)

(assert (=> b!279159 (= lt!416244 e!198965)))

(declare-fun c!12843 () Bool)

(assert (=> b!279159 (= c!12843 (bvslt (_1!12424 lt!416242) (_2!12424 lt!416242)))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!698)

(assert (=> b!279159 (= lt!416242 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279160 () Bool)

(declare-fun res!231817 () Bool)

(assert (=> b!279160 (=> (not res!231817) (not e!198964))))

(declare-fun a2!699 () array!16113)

(declare-fun arrayBitRangesEq!0 (array!16113 array!16113 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!279160 (= res!231817 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!279162 () Bool)

(declare-fun res!231818 () Bool)

(assert (=> b!279162 (=> (not res!231818) (not e!198964))))

(assert (=> b!279162 (= res!231818 (bvslt from!822 to!789))))

(declare-fun b!279163 () Bool)

(declare-fun Unit!19563 () Unit!19561)

(assert (=> b!279163 (= e!198965 Unit!19563)))

(declare-fun arrayRangesEq!1242 (array!16113 array!16113 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279163 (arrayRangesEq!1242 a1!699 a2!699 (_1!12424 lt!416242) (_2!12424 lt!416242))))

(declare-fun lt!416243 () Unit!19561)

(declare-fun arrayRangesEqSymmetricLemma!149 (array!16113 array!16113 (_ BitVec 32) (_ BitVec 32)) Unit!19561)

(assert (=> b!279163 (= lt!416243 (arrayRangesEqSymmetricLemma!149 a1!699 a2!699 (_1!12424 lt!416242) (_2!12424 lt!416242)))))

(assert (=> b!279163 (arrayRangesEq!1242 a2!699 a1!699 (_1!12424 lt!416242) (_2!12424 lt!416242))))

(declare-fun b!279161 () Bool)

(declare-fun Unit!19564 () Unit!19561)

(assert (=> b!279161 (= e!198965 Unit!19564)))

(declare-fun res!231816 () Bool)

(assert (=> start!62234 (=> (not res!231816) (not e!198964))))

(assert (=> start!62234 (= res!231816 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6974 a1!699) (size!6974 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6974 a1!699))))))))

(assert (=> start!62234 e!198964))

(assert (=> start!62234 true))

(declare-fun array_inv!6698 (array!16113) Bool)

(assert (=> start!62234 (array_inv!6698 a1!699)))

(assert (=> start!62234 (array_inv!6698 a2!699)))

(assert (= (and start!62234 res!231816) b!279160))

(assert (= (and b!279160 res!231817) b!279162))

(assert (= (and b!279162 res!231818) b!279159))

(assert (= (and b!279159 c!12843) b!279163))

(assert (= (and b!279159 (not c!12843)) b!279161))

(declare-fun m!412221 () Bool)

(assert (=> b!279159 m!412221))

(declare-fun m!412223 () Bool)

(assert (=> b!279160 m!412223))

(declare-fun m!412225 () Bool)

(assert (=> b!279163 m!412225))

(declare-fun m!412227 () Bool)

(assert (=> b!279163 m!412227))

(declare-fun m!412229 () Bool)

(assert (=> b!279163 m!412229))

(declare-fun m!412231 () Bool)

(assert (=> start!62234 m!412231))

(declare-fun m!412233 () Bool)

(assert (=> start!62234 m!412233))

(check-sat (not start!62234) (not b!279163) (not b!279159) (not b!279160))
(check-sat)
(get-model)

(declare-fun d!96004 () Bool)

(assert (=> d!96004 (= (array_inv!6698 a1!699) (bvsge (size!6974 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62234 d!96004))

(declare-fun d!96008 () Bool)

(assert (=> d!96008 (= (array_inv!6698 a2!699) (bvsge (size!6974 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62234 d!96008))

(declare-fun d!96010 () Bool)

(declare-fun res!231855 () Bool)

(declare-fun e!199009 () Bool)

(assert (=> d!96010 (=> res!231855 e!199009)))

(assert (=> d!96010 (= res!231855 (= (_1!12424 lt!416242) (_2!12424 lt!416242)))))

(assert (=> d!96010 (= (arrayRangesEq!1242 a1!699 a2!699 (_1!12424 lt!416242) (_2!12424 lt!416242)) e!199009)))

(declare-fun b!279212 () Bool)

(declare-fun e!199010 () Bool)

(assert (=> b!279212 (= e!199009 e!199010)))

(declare-fun res!231856 () Bool)

(assert (=> b!279212 (=> (not res!231856) (not e!199010))))

(assert (=> b!279212 (= res!231856 (= (select (arr!7970 a1!699) (_1!12424 lt!416242)) (select (arr!7970 a2!699) (_1!12424 lt!416242))))))

(declare-fun b!279213 () Bool)

(assert (=> b!279213 (= e!199010 (arrayRangesEq!1242 a1!699 a2!699 (bvadd (_1!12424 lt!416242) #b00000000000000000000000000000001) (_2!12424 lt!416242)))))

(assert (= (and d!96010 (not res!231855)) b!279212))

(assert (= (and b!279212 res!231856) b!279213))

(declare-fun m!412273 () Bool)

(assert (=> b!279212 m!412273))

(declare-fun m!412275 () Bool)

(assert (=> b!279212 m!412275))

(declare-fun m!412277 () Bool)

(assert (=> b!279213 m!412277))

(assert (=> b!279163 d!96010))

(declare-fun d!96022 () Bool)

(assert (=> d!96022 (arrayRangesEq!1242 a2!699 a1!699 (_1!12424 lt!416242) (_2!12424 lt!416242))))

(declare-fun lt!416277 () Unit!19561)

(declare-fun choose!460 (array!16113 array!16113 (_ BitVec 32) (_ BitVec 32)) Unit!19561)

(assert (=> d!96022 (= lt!416277 (choose!460 a1!699 a2!699 (_1!12424 lt!416242) (_2!12424 lt!416242)))))

(assert (=> d!96022 (and (bvsle #b00000000000000000000000000000000 (_1!12424 lt!416242)) (bvsle (_1!12424 lt!416242) (_2!12424 lt!416242)) (bvsle (_2!12424 lt!416242) (size!6974 a1!699)))))

(assert (=> d!96022 (= (arrayRangesEqSymmetricLemma!149 a1!699 a2!699 (_1!12424 lt!416242) (_2!12424 lt!416242)) lt!416277)))

(declare-fun bs!24241 () Bool)

(assert (= bs!24241 d!96022))

(assert (=> bs!24241 m!412229))

(declare-fun m!412289 () Bool)

(assert (=> bs!24241 m!412289))

(assert (=> b!279163 d!96022))

(declare-fun d!96030 () Bool)

(declare-fun res!231875 () Bool)

(declare-fun e!199031 () Bool)

(assert (=> d!96030 (=> res!231875 e!199031)))

(assert (=> d!96030 (= res!231875 (= (_1!12424 lt!416242) (_2!12424 lt!416242)))))

(assert (=> d!96030 (= (arrayRangesEq!1242 a2!699 a1!699 (_1!12424 lt!416242) (_2!12424 lt!416242)) e!199031)))

(declare-fun b!279236 () Bool)

(declare-fun e!199032 () Bool)

(assert (=> b!279236 (= e!199031 e!199032)))

(declare-fun res!231876 () Bool)

(assert (=> b!279236 (=> (not res!231876) (not e!199032))))

(assert (=> b!279236 (= res!231876 (= (select (arr!7970 a2!699) (_1!12424 lt!416242)) (select (arr!7970 a1!699) (_1!12424 lt!416242))))))

(declare-fun b!279237 () Bool)

(assert (=> b!279237 (= e!199032 (arrayRangesEq!1242 a2!699 a1!699 (bvadd (_1!12424 lt!416242) #b00000000000000000000000000000001) (_2!12424 lt!416242)))))

(assert (= (and d!96030 (not res!231875)) b!279236))

(assert (= (and b!279236 res!231876) b!279237))

(assert (=> b!279236 m!412275))

(assert (=> b!279236 m!412273))

(declare-fun m!412291 () Bool)

(assert (=> b!279237 m!412291))

(assert (=> b!279163 d!96030))

(declare-fun d!96032 () Bool)

(assert (=> d!96032 (= (arrayBitIndices!0 from!822 to!789) (tuple4!699 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!279159 d!96032))

(declare-fun b!279259 () Bool)

(declare-fun e!199055 () Bool)

(declare-fun call!4553 () Bool)

(assert (=> b!279259 (= e!199055 call!4553)))

(declare-fun b!279260 () Bool)

(declare-fun e!199054 () Bool)

(assert (=> b!279260 (= e!199054 e!199055)))

(declare-fun c!12855 () Bool)

(declare-fun lt!416289 () tuple4!698)

(assert (=> b!279260 (= c!12855 (= (_3!1129 lt!416289) (_4!349 lt!416289)))))

(declare-fun b!279261 () Bool)

(declare-fun e!199056 () Bool)

(assert (=> b!279261 (= e!199056 e!199054)))

(declare-fun res!231896 () Bool)

(assert (=> b!279261 (=> (not res!231896) (not e!199054))))

(declare-fun e!199053 () Bool)

(assert (=> b!279261 (= res!231896 e!199053)))

(declare-fun res!231895 () Bool)

(assert (=> b!279261 (=> res!231895 e!199053)))

(assert (=> b!279261 (= res!231895 (bvsge (_1!12424 lt!416289) (_2!12424 lt!416289)))))

(declare-fun lt!416287 () (_ BitVec 32))

(assert (=> b!279261 (= lt!416287 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416288 () (_ BitVec 32))

(assert (=> b!279261 (= lt!416288 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!279261 (= lt!416289 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!279262 () Bool)

(assert (=> b!279262 (= e!199053 (arrayRangesEq!1242 a1!699 a2!699 (_1!12424 lt!416289) (_2!12424 lt!416289)))))

(declare-fun b!279263 () Bool)

(declare-fun e!199051 () Bool)

(assert (=> b!279263 (= e!199055 e!199051)))

(declare-fun res!231892 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!279263 (= res!231892 (byteRangesEq!0 (select (arr!7970 a1!699) (_3!1129 lt!416289)) (select (arr!7970 a2!699) (_3!1129 lt!416289)) lt!416288 #b00000000000000000000000000001000))))

(assert (=> b!279263 (=> (not res!231892) (not e!199051))))

(declare-fun b!279264 () Bool)

(declare-fun res!231894 () Bool)

(assert (=> b!279264 (= res!231894 (= lt!416287 #b00000000000000000000000000000000))))

(declare-fun e!199052 () Bool)

(assert (=> b!279264 (=> res!231894 e!199052)))

(assert (=> b!279264 (= e!199051 e!199052)))

(declare-fun b!279265 () Bool)

(assert (=> b!279265 (= e!199052 call!4553)))

(declare-fun bm!4550 () Bool)

(assert (=> bm!4550 (= call!4553 (byteRangesEq!0 (ite c!12855 (select (arr!7970 a1!699) (_3!1129 lt!416289)) (select (arr!7970 a1!699) (_4!349 lt!416289))) (ite c!12855 (select (arr!7970 a2!699) (_3!1129 lt!416289)) (select (arr!7970 a2!699) (_4!349 lt!416289))) (ite c!12855 lt!416288 #b00000000000000000000000000000000) lt!416287))))

(declare-fun d!96036 () Bool)

(declare-fun res!231893 () Bool)

(assert (=> d!96036 (=> res!231893 e!199056)))

(assert (=> d!96036 (= res!231893 (bvsge from!822 to!789))))

(assert (=> d!96036 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!199056)))

(assert (= (and d!96036 (not res!231893)) b!279261))

(assert (= (and b!279261 (not res!231895)) b!279262))

(assert (= (and b!279261 res!231896) b!279260))

(assert (= (and b!279260 c!12855) b!279259))

(assert (= (and b!279260 (not c!12855)) b!279263))

(assert (= (and b!279263 res!231892) b!279264))

(assert (= (and b!279264 (not res!231894)) b!279265))

(assert (= (or b!279259 b!279265) bm!4550))

(assert (=> b!279261 m!412221))

(declare-fun m!412307 () Bool)

(assert (=> b!279262 m!412307))

(declare-fun m!412309 () Bool)

(assert (=> b!279263 m!412309))

(declare-fun m!412311 () Bool)

(assert (=> b!279263 m!412311))

(assert (=> b!279263 m!412309))

(assert (=> b!279263 m!412311))

(declare-fun m!412313 () Bool)

(assert (=> b!279263 m!412313))

(declare-fun m!412315 () Bool)

(assert (=> bm!4550 m!412315))

(declare-fun m!412317 () Bool)

(assert (=> bm!4550 m!412317))

(assert (=> bm!4550 m!412309))

(assert (=> bm!4550 m!412311))

(declare-fun m!412319 () Bool)

(assert (=> bm!4550 m!412319))

(assert (=> b!279160 d!96036))

(check-sat (not b!279261) (not b!279262) (not b!279213) (not b!279263) (not d!96022) (not bm!4550) (not b!279237))
(check-sat)
