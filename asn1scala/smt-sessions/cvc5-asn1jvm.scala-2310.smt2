; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58566 () Bool)

(assert start!58566)

(declare-fun b!268894 () Bool)

(declare-fun e!188880 () Bool)

(declare-datatypes ((array!14990 0))(
  ( (array!14991 (arr!7522 (Array (_ BitVec 32) (_ BitVec 8))) (size!6535 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11884 0))(
  ( (BitStream!11885 (buf!7003 array!14990) (currentByte!12933 (_ BitVec 32)) (currentBit!12928 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11884)

(declare-fun array_inv!6259 (array!14990) Bool)

(assert (=> b!268894 (= e!188880 (array_inv!6259 (buf!7003 w3!25)))))

(declare-fun b!268895 () Bool)

(declare-fun e!188877 () Bool)

(declare-fun w1!591 () BitStream!11884)

(declare-fun w2!587 () BitStream!11884)

(assert (=> b!268895 (= e!188877 (or (bvsgt #b00000000000000000000000000000000 (currentByte!12933 w1!591)) (bvsgt (currentByte!12933 w1!591) (currentByte!12933 w2!587))))))

(declare-fun b!268896 () Bool)

(declare-fun e!188874 () Bool)

(assert (=> b!268896 (= e!188874 (array_inv!6259 (buf!7003 w1!591)))))

(declare-fun res!224206 () Bool)

(assert (=> start!58566 (=> (not res!224206) (not e!188877))))

(declare-fun isPrefixOf!0 (BitStream!11884 BitStream!11884) Bool)

(assert (=> start!58566 (= res!224206 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58566 e!188877))

(declare-fun inv!12 (BitStream!11884) Bool)

(assert (=> start!58566 (and (inv!12 w1!591) e!188874)))

(declare-fun e!188878 () Bool)

(assert (=> start!58566 (and (inv!12 w2!587) e!188878)))

(assert (=> start!58566 (and (inv!12 w3!25) e!188880)))

(declare-fun b!268897 () Bool)

(declare-fun res!224205 () Bool)

(assert (=> b!268897 (=> (not res!224205) (not e!188877))))

(assert (=> b!268897 (= res!224205 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268898 () Bool)

(assert (=> b!268898 (= e!188878 (array_inv!6259 (buf!7003 w2!587)))))

(assert (= (and start!58566 res!224206) b!268897))

(assert (= (and b!268897 res!224205) b!268895))

(assert (= start!58566 b!268896))

(assert (= start!58566 b!268898))

(assert (= start!58566 b!268894))

(declare-fun m!400421 () Bool)

(assert (=> b!268898 m!400421))

(declare-fun m!400423 () Bool)

(assert (=> b!268897 m!400423))

(declare-fun m!400425 () Bool)

(assert (=> b!268896 m!400425))

(declare-fun m!400427 () Bool)

(assert (=> start!58566 m!400427))

(declare-fun m!400429 () Bool)

(assert (=> start!58566 m!400429))

(declare-fun m!400431 () Bool)

(assert (=> start!58566 m!400431))

(declare-fun m!400433 () Bool)

(assert (=> start!58566 m!400433))

(declare-fun m!400435 () Bool)

(assert (=> b!268894 m!400435))

(push 1)

(assert (not b!268897))

(assert (not b!268898))

(assert (not start!58566))

(assert (not b!268896))

(assert (not b!268894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90946 () Bool)

(declare-fun res!224238 () Bool)

(declare-fun e!188936 () Bool)

(assert (=> d!90946 (=> (not res!224238) (not e!188936))))

(assert (=> d!90946 (= res!224238 (= (size!6535 (buf!7003 w1!591)) (size!6535 (buf!7003 w2!587))))))

(assert (=> d!90946 (= (isPrefixOf!0 w1!591 w2!587) e!188936)))

(declare-fun b!268947 () Bool)

(declare-fun res!224239 () Bool)

(assert (=> b!268947 (=> (not res!224239) (not e!188936))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!268947 (= res!224239 (bvsle (bitIndex!0 (size!6535 (buf!7003 w1!591)) (currentByte!12933 w1!591) (currentBit!12928 w1!591)) (bitIndex!0 (size!6535 (buf!7003 w2!587)) (currentByte!12933 w2!587) (currentBit!12928 w2!587))))))

(declare-fun b!268948 () Bool)

(declare-fun e!188935 () Bool)

(assert (=> b!268948 (= e!188936 e!188935)))

(declare-fun res!224237 () Bool)

(assert (=> b!268948 (=> res!224237 e!188935)))

(assert (=> b!268948 (= res!224237 (= (size!6535 (buf!7003 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!268949 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14990 array!14990 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!268949 (= e!188935 (arrayBitRangesEq!0 (buf!7003 w1!591) (buf!7003 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6535 (buf!7003 w1!591)) (currentByte!12933 w1!591) (currentBit!12928 w1!591))))))

(assert (= (and d!90946 res!224238) b!268947))

(assert (= (and b!268947 res!224239) b!268948))

(assert (= (and b!268948 (not res!224237)) b!268949))

(declare-fun m!400485 () Bool)

(assert (=> b!268947 m!400485))

(declare-fun m!400487 () Bool)

(assert (=> b!268947 m!400487))

(assert (=> b!268949 m!400485))

(assert (=> b!268949 m!400485))

(declare-fun m!400489 () Bool)

(assert (=> b!268949 m!400489))

(assert (=> start!58566 d!90946))

(declare-fun d!90968 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90968 (= (inv!12 w1!591) (invariant!0 (currentBit!12928 w1!591) (currentByte!12933 w1!591) (size!6535 (buf!7003 w1!591))))))

(declare-fun bs!23073 () Bool)

(assert (= bs!23073 d!90968))

(declare-fun m!400491 () Bool)

(assert (=> bs!23073 m!400491))

(assert (=> start!58566 d!90968))

(declare-fun d!90970 () Bool)

(assert (=> d!90970 (= (inv!12 w2!587) (invariant!0 (currentBit!12928 w2!587) (currentByte!12933 w2!587) (size!6535 (buf!7003 w2!587))))))

(declare-fun bs!23074 () Bool)

(assert (= bs!23074 d!90970))

(declare-fun m!400493 () Bool)

(assert (=> bs!23074 m!400493))

(assert (=> start!58566 d!90970))

(declare-fun d!90972 () Bool)

(assert (=> d!90972 (= (inv!12 w3!25) (invariant!0 (currentBit!12928 w3!25) (currentByte!12933 w3!25) (size!6535 (buf!7003 w3!25))))))

(declare-fun bs!23075 () Bool)

(assert (= bs!23075 d!90972))

(declare-fun m!400495 () Bool)

(assert (=> bs!23075 m!400495))

(assert (=> start!58566 d!90972))

(declare-fun d!90974 () Bool)

(assert (=> d!90974 (= (array_inv!6259 (buf!7003 w3!25)) (bvsge (size!6535 (buf!7003 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!268894 d!90974))

(declare-fun d!90976 () Bool)

(assert (=> d!90976 (= (array_inv!6259 (buf!7003 w2!587)) (bvsge (size!6535 (buf!7003 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!268898 d!90976))

(declare-fun d!90978 () Bool)

(assert (=> d!90978 (= (array_inv!6259 (buf!7003 w1!591)) (bvsge (size!6535 (buf!7003 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!268896 d!90978))

(declare-fun d!90980 () Bool)

(declare-fun res!224247 () Bool)

(declare-fun e!188942 () Bool)

(assert (=> d!90980 (=> (not res!224247) (not e!188942))))

(assert (=> d!90980 (= res!224247 (= (size!6535 (buf!7003 w2!587)) (size!6535 (buf!7003 w3!25))))))

(assert (=> d!90980 (= (isPrefixOf!0 w2!587 w3!25) e!188942)))

(declare-fun b!268956 () Bool)

(declare-fun res!224248 () Bool)

(assert (=> b!268956 (=> (not res!224248) (not e!188942))))

(assert (=> b!268956 (= res!224248 (bvsle (bitIndex!0 (size!6535 (buf!7003 w2!587)) (currentByte!12933 w2!587) (currentBit!12928 w2!587)) (bitIndex!0 (size!6535 (buf!7003 w3!25)) (currentByte!12933 w3!25) (currentBit!12928 w3!25))))))

(declare-fun b!268957 () Bool)

(declare-fun e!188941 () Bool)

(assert (=> b!268957 (= e!188942 e!188941)))

(declare-fun res!224246 () Bool)

(assert (=> b!268957 (=> res!224246 e!188941)))

(assert (=> b!268957 (= res!224246 (= (size!6535 (buf!7003 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!268958 () Bool)

(assert (=> b!268958 (= e!188941 (arrayBitRangesEq!0 (buf!7003 w2!587) (buf!7003 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6535 (buf!7003 w2!587)) (currentByte!12933 w2!587) (currentBit!12928 w2!587))))))

(assert (= (and d!90980 res!224247) b!268956))

(assert (= (and b!268956 res!224248) b!268957))

(assert (= (and b!268957 (not res!224246)) b!268958))

(assert (=> b!268956 m!400487))

(declare-fun m!400497 () Bool)

(assert (=> b!268956 m!400497))

(assert (=> b!268958 m!400487))

(assert (=> b!268958 m!400487))

(declare-fun m!400499 () Bool)

(assert (=> b!268958 m!400499))

(assert (=> b!268897 d!90980))

(push 1)

(assert (not b!268958))

(assert (not d!90972))

(assert (not b!268956))

(assert (not d!90970))

(assert (not d!90968))

(assert (not b!268947))

(assert (not b!268949))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90996 () Bool)

(assert (=> d!90996 (= (invariant!0 (currentBit!12928 w3!25) (currentByte!12933 w3!25) (size!6535 (buf!7003 w3!25))) (and (bvsge (currentBit!12928 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12928 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12933 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12933 w3!25) (size!6535 (buf!7003 w3!25))) (and (= (currentBit!12928 w3!25) #b00000000000000000000000000000000) (= (currentByte!12933 w3!25) (size!6535 (buf!7003 w3!25)))))))))

(assert (=> d!90972 d!90996))

(declare-fun d!91002 () Bool)

(assert (=> d!91002 (= (invariant!0 (currentBit!12928 w2!587) (currentByte!12933 w2!587) (size!6535 (buf!7003 w2!587))) (and (bvsge (currentBit!12928 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12928 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12933 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12933 w2!587) (size!6535 (buf!7003 w2!587))) (and (= (currentBit!12928 w2!587) #b00000000000000000000000000000000) (= (currentByte!12933 w2!587) (size!6535 (buf!7003 w2!587)))))))))

(assert (=> d!90970 d!91002))

(declare-fun b!269025 () Bool)

(declare-fun e!188994 () Bool)

(declare-fun call!4266 () Bool)

(assert (=> b!269025 (= e!188994 call!4266)))

(declare-fun bm!4263 () Bool)

(declare-fun lt!408805 () (_ BitVec 32))

(declare-fun c!12415 () Bool)

(declare-fun lt!408804 () (_ BitVec 32))

(declare-datatypes ((tuple4!428 0))(
  ( (tuple4!429 (_1!12197 (_ BitVec 32)) (_2!12197 (_ BitVec 32)) (_3!994 (_ BitVec 32)) (_4!214 (_ BitVec 32))) )
))
(declare-fun lt!408806 () tuple4!428)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4263 (= call!4266 (byteRangesEq!0 (ite c!12415 (select (arr!7522 (buf!7003 w1!591)) (_3!994 lt!408806)) (select (arr!7522 (buf!7003 w1!591)) (_4!214 lt!408806))) (ite c!12415 (select (arr!7522 (buf!7003 w2!587)) (_3!994 lt!408806)) (select (arr!7522 (buf!7003 w2!587)) (_4!214 lt!408806))) (ite c!12415 lt!408805 #b00000000000000000000000000000000) lt!408804))))

(declare-fun e!188996 () Bool)

(declare-fun b!269026 () Bool)

(declare-fun arrayRangesEq!1071 (array!14990 array!14990 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269026 (= e!188996 (arrayRangesEq!1071 (buf!7003 w1!591) (buf!7003 w2!587) (_1!12197 lt!408806) (_2!12197 lt!408806)))))

(declare-fun b!269027 () Bool)

(declare-fun e!188992 () Bool)

(assert (=> b!269027 (= e!188994 e!188992)))

(declare-fun res!224307 () Bool)

(assert (=> b!269027 (= res!224307 (byteRangesEq!0 (select (arr!7522 (buf!7003 w1!591)) (_3!994 lt!408806)) (select (arr!7522 (buf!7003 w2!587)) (_3!994 lt!408806)) lt!408805 #b00000000000000000000000000001000))))

(assert (=> b!269027 (=> (not res!224307) (not e!188992))))

(declare-fun b!269028 () Bool)

(declare-fun e!188995 () Bool)

(assert (=> b!269028 (= e!188995 call!4266)))

(declare-fun d!91004 () Bool)

(declare-fun res!224303 () Bool)

(declare-fun e!188993 () Bool)

(assert (=> d!91004 (=> res!224303 e!188993)))

(assert (=> d!91004 (= res!224303 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6535 (buf!7003 w1!591)) (currentByte!12933 w1!591) (currentBit!12928 w1!591))))))

(assert (=> d!91004 (= (arrayBitRangesEq!0 (buf!7003 w1!591) (buf!7003 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6535 (buf!7003 w1!591)) (currentByte!12933 w1!591) (currentBit!12928 w1!591))) e!188993)))

(declare-fun b!269029 () Bool)

(declare-fun e!188997 () Bool)

(assert (=> b!269029 (= e!188997 e!188994)))

(assert (=> b!269029 (= c!12415 (= (_3!994 lt!408806) (_4!214 lt!408806)))))

(declare-fun b!269030 () Bool)

(assert (=> b!269030 (= e!188993 e!188997)))

(declare-fun res!224305 () Bool)

(assert (=> b!269030 (=> (not res!224305) (not e!188997))))

(assert (=> b!269030 (= res!224305 e!188996)))

(declare-fun res!224304 () Bool)

(assert (=> b!269030 (=> res!224304 e!188996)))

(assert (=> b!269030 (= res!224304 (bvsge (_1!12197 lt!408806) (_2!12197 lt!408806)))))

(assert (=> b!269030 (= lt!408804 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6535 (buf!7003 w1!591)) (currentByte!12933 w1!591) (currentBit!12928 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269030 (= lt!408805 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!428)

(assert (=> b!269030 (= lt!408806 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6535 (buf!7003 w1!591)) (currentByte!12933 w1!591) (currentBit!12928 w1!591))))))

(declare-fun b!269031 () Bool)

(declare-fun res!224306 () Bool)

(assert (=> b!269031 (= res!224306 (= lt!408804 #b00000000000000000000000000000000))))

(assert (=> b!269031 (=> res!224306 e!188995)))

(assert (=> b!269031 (= e!188992 e!188995)))

(assert (= (and d!91004 (not res!224303)) b!269030))

(assert (= (and b!269030 (not res!224304)) b!269026))

(assert (= (and b!269030 res!224305) b!269029))

(assert (= (and b!269029 c!12415) b!269025))

(assert (= (and b!269029 (not c!12415)) b!269027))

(assert (= (and b!269027 res!224307) b!269031))

(assert (= (and b!269031 (not res!224306)) b!269028))

(assert (= (or b!269025 b!269028) bm!4263))

(declare-fun m!400559 () Bool)

(assert (=> bm!4263 m!400559))

(declare-fun m!400561 () Bool)

(assert (=> bm!4263 m!400561))

(declare-fun m!400563 () Bool)

(assert (=> bm!4263 m!400563))

(declare-fun m!400565 () Bool)

(assert (=> bm!4263 m!400565))

(declare-fun m!400567 () Bool)

(assert (=> bm!4263 m!400567))

(declare-fun m!400569 () Bool)

(assert (=> b!269026 m!400569))

(assert (=> b!269027 m!400567))

(assert (=> b!269027 m!400559))

(assert (=> b!269027 m!400567))

(assert (=> b!269027 m!400559))

(declare-fun m!400571 () Bool)

(assert (=> b!269027 m!400571))

(assert (=> b!269030 m!400485))

(declare-fun m!400573 () Bool)

(assert (=> b!269030 m!400573))

(assert (=> b!268949 d!91004))

(declare-fun d!91022 () Bool)

(declare-fun e!189025 () Bool)

(assert (=> d!91022 e!189025))

(declare-fun res!224334 () Bool)

(assert (=> d!91022 (=> (not res!224334) (not e!189025))))

(declare-fun lt!408839 () (_ BitVec 64))

(declare-fun lt!408842 () (_ BitVec 64))

(declare-fun lt!408841 () (_ BitVec 64))

(assert (=> d!91022 (= res!224334 (= lt!408842 (bvsub lt!408839 lt!408841)))))

(assert (=> d!91022 (or (= (bvand lt!408839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408839 lt!408841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!91022 (= lt!408841 (remainingBits!0 ((_ sign_extend 32) (size!6535 (buf!7003 w1!591))) ((_ sign_extend 32) (currentByte!12933 w1!591)) ((_ sign_extend 32) (currentBit!12928 w1!591))))))

(declare-fun lt!408840 () (_ BitVec 64))

(declare-fun lt!408837 () (_ BitVec 64))

(assert (=> d!91022 (= lt!408839 (bvmul lt!408840 lt!408837))))

(assert (=> d!91022 (or (= lt!408840 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408837 (bvsdiv (bvmul lt!408840 lt!408837) lt!408840)))))

(assert (=> d!91022 (= lt!408837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91022 (= lt!408840 ((_ sign_extend 32) (size!6535 (buf!7003 w1!591))))))

(assert (=> d!91022 (= lt!408842 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12933 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12928 w1!591))))))

(assert (=> d!91022 (invariant!0 (currentBit!12928 w1!591) (currentByte!12933 w1!591) (size!6535 (buf!7003 w1!591)))))

(assert (=> d!91022 (= (bitIndex!0 (size!6535 (buf!7003 w1!591)) (currentByte!12933 w1!591) (currentBit!12928 w1!591)) lt!408842)))

(declare-fun b!269066 () Bool)

(declare-fun res!224335 () Bool)

(assert (=> b!269066 (=> (not res!224335) (not e!189025))))

(assert (=> b!269066 (= res!224335 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408842))))

(declare-fun b!269067 () Bool)

(declare-fun lt!408838 () (_ BitVec 64))

(assert (=> b!269067 (= e!189025 (bvsle lt!408842 (bvmul lt!408838 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269067 (or (= lt!408838 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408838 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408838)))))

(assert (=> b!269067 (= lt!408838 ((_ sign_extend 32) (size!6535 (buf!7003 w1!591))))))

(assert (= (and d!91022 res!224334) b!269066))

(assert (= (and b!269066 res!224335) b!269067))

(declare-fun m!400609 () Bool)

(assert (=> d!91022 m!400609))

(assert (=> d!91022 m!400491))

(assert (=> b!268949 d!91022))

(assert (=> b!268947 d!91022))

(declare-fun d!91030 () Bool)

(declare-fun e!189026 () Bool)

(assert (=> d!91030 e!189026))

(declare-fun res!224336 () Bool)

(assert (=> d!91030 (=> (not res!224336) (not e!189026))))

(declare-fun lt!408847 () (_ BitVec 64))

(declare-fun lt!408848 () (_ BitVec 64))

(declare-fun lt!408845 () (_ BitVec 64))

(assert (=> d!91030 (= res!224336 (= lt!408848 (bvsub lt!408845 lt!408847)))))

(assert (=> d!91030 (or (= (bvand lt!408845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408845 lt!408847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91030 (= lt!408847 (remainingBits!0 ((_ sign_extend 32) (size!6535 (buf!7003 w2!587))) ((_ sign_extend 32) (currentByte!12933 w2!587)) ((_ sign_extend 32) (currentBit!12928 w2!587))))))

(declare-fun lt!408846 () (_ BitVec 64))

(declare-fun lt!408843 () (_ BitVec 64))

(assert (=> d!91030 (= lt!408845 (bvmul lt!408846 lt!408843))))

(assert (=> d!91030 (or (= lt!408846 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408843 (bvsdiv (bvmul lt!408846 lt!408843) lt!408846)))))

(assert (=> d!91030 (= lt!408843 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91030 (= lt!408846 ((_ sign_extend 32) (size!6535 (buf!7003 w2!587))))))

(assert (=> d!91030 (= lt!408848 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12933 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12928 w2!587))))))

(assert (=> d!91030 (invariant!0 (currentBit!12928 w2!587) (currentByte!12933 w2!587) (size!6535 (buf!7003 w2!587)))))

(assert (=> d!91030 (= (bitIndex!0 (size!6535 (buf!7003 w2!587)) (currentByte!12933 w2!587) (currentBit!12928 w2!587)) lt!408848)))

(declare-fun b!269068 () Bool)

(declare-fun res!224337 () Bool)

(assert (=> b!269068 (=> (not res!224337) (not e!189026))))

(assert (=> b!269068 (= res!224337 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408848))))

(declare-fun b!269069 () Bool)

(declare-fun lt!408844 () (_ BitVec 64))

(assert (=> b!269069 (= e!189026 (bvsle lt!408848 (bvmul lt!408844 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269069 (or (= lt!408844 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408844 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408844)))))

(assert (=> b!269069 (= lt!408844 ((_ sign_extend 32) (size!6535 (buf!7003 w2!587))))))

(assert (= (and d!91030 res!224336) b!269068))

(assert (= (and b!269068 res!224337) b!269069))

(declare-fun m!400611 () Bool)

(assert (=> d!91030 m!400611))

(assert (=> d!91030 m!400493))

(assert (=> b!268947 d!91030))

(declare-fun b!269070 () Bool)

(declare-fun e!189029 () Bool)

(declare-fun call!4271 () Bool)

(assert (=> b!269070 (= e!189029 call!4271)))

(declare-fun lt!408849 () (_ BitVec 32))

(declare-fun lt!408850 () (_ BitVec 32))

(declare-fun bm!4268 () Bool)

(declare-fun lt!408851 () tuple4!428)

(declare-fun c!12420 () Bool)

(assert (=> bm!4268 (= call!4271 (byteRangesEq!0 (ite c!12420 (select (arr!7522 (buf!7003 w2!587)) (_3!994 lt!408851)) (select (arr!7522 (buf!7003 w2!587)) (_4!214 lt!408851))) (ite c!12420 (select (arr!7522 (buf!7003 w3!25)) (_3!994 lt!408851)) (select (arr!7522 (buf!7003 w3!25)) (_4!214 lt!408851))) (ite c!12420 lt!408850 #b00000000000000000000000000000000) lt!408849))))

(declare-fun e!189031 () Bool)

(declare-fun b!269071 () Bool)

(assert (=> b!269071 (= e!189031 (arrayRangesEq!1071 (buf!7003 w2!587) (buf!7003 w3!25) (_1!12197 lt!408851) (_2!12197 lt!408851)))))

(declare-fun b!269072 () Bool)

(declare-fun e!189027 () Bool)

(assert (=> b!269072 (= e!189029 e!189027)))

(declare-fun res!224342 () Bool)

(assert (=> b!269072 (= res!224342 (byteRangesEq!0 (select (arr!7522 (buf!7003 w2!587)) (_3!994 lt!408851)) (select (arr!7522 (buf!7003 w3!25)) (_3!994 lt!408851)) lt!408850 #b00000000000000000000000000001000))))

(assert (=> b!269072 (=> (not res!224342) (not e!189027))))

(declare-fun b!269073 () Bool)

(declare-fun e!189030 () Bool)

(assert (=> b!269073 (= e!189030 call!4271)))

(declare-fun d!91032 () Bool)

(declare-fun res!224338 () Bool)

(declare-fun e!189028 () Bool)

(assert (=> d!91032 (=> res!224338 e!189028)))

(assert (=> d!91032 (= res!224338 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6535 (buf!7003 w2!587)) (currentByte!12933 w2!587) (currentBit!12928 w2!587))))))

(assert (=> d!91032 (= (arrayBitRangesEq!0 (buf!7003 w2!587) (buf!7003 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6535 (buf!7003 w2!587)) (currentByte!12933 w2!587) (currentBit!12928 w2!587))) e!189028)))

(declare-fun b!269074 () Bool)

(declare-fun e!189032 () Bool)

(assert (=> b!269074 (= e!189032 e!189029)))

(assert (=> b!269074 (= c!12420 (= (_3!994 lt!408851) (_4!214 lt!408851)))))

(declare-fun b!269075 () Bool)

(assert (=> b!269075 (= e!189028 e!189032)))

(declare-fun res!224340 () Bool)

(assert (=> b!269075 (=> (not res!224340) (not e!189032))))

(assert (=> b!269075 (= res!224340 e!189031)))

(declare-fun res!224339 () Bool)

(assert (=> b!269075 (=> res!224339 e!189031)))

(assert (=> b!269075 (= res!224339 (bvsge (_1!12197 lt!408851) (_2!12197 lt!408851)))))

(assert (=> b!269075 (= lt!408849 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6535 (buf!7003 w2!587)) (currentByte!12933 w2!587) (currentBit!12928 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269075 (= lt!408850 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269075 (= lt!408851 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6535 (buf!7003 w2!587)) (currentByte!12933 w2!587) (currentBit!12928 w2!587))))))

(declare-fun b!269076 () Bool)

(declare-fun res!224341 () Bool)

(assert (=> b!269076 (= res!224341 (= lt!408849 #b00000000000000000000000000000000))))

(assert (=> b!269076 (=> res!224341 e!189030)))

(assert (=> b!269076 (= e!189027 e!189030)))

(assert (= (and d!91032 (not res!224338)) b!269075))

(assert (= (and b!269075 (not res!224339)) b!269071))

(assert (= (and b!269075 res!224340) b!269074))

(assert (= (and b!269074 c!12420) b!269070))

(assert (= (and b!269074 (not c!12420)) b!269072))

(assert (= (and b!269072 res!224342) b!269076))

(assert (= (and b!269076 (not res!224341)) b!269073))

(assert (= (or b!269070 b!269073) bm!4268))

(declare-fun m!400613 () Bool)

(assert (=> bm!4268 m!400613))

(declare-fun m!400615 () Bool)

(assert (=> bm!4268 m!400615))

(declare-fun m!400617 () Bool)

(assert (=> bm!4268 m!400617))

(declare-fun m!400619 () Bool)

(assert (=> bm!4268 m!400619))

(declare-fun m!400621 () Bool)

(assert (=> bm!4268 m!400621))

(declare-fun m!400623 () Bool)

(assert (=> b!269071 m!400623))

(assert (=> b!269072 m!400621))

(assert (=> b!269072 m!400613))

(assert (=> b!269072 m!400621))

(assert (=> b!269072 m!400613))

(declare-fun m!400625 () Bool)

(assert (=> b!269072 m!400625))

(assert (=> b!269075 m!400487))

(declare-fun m!400627 () Bool)

(assert (=> b!269075 m!400627))

(assert (=> b!268958 d!91032))

(assert (=> b!268958 d!91030))

(assert (=> b!268956 d!91030))

(declare-fun d!91034 () Bool)

(declare-fun e!189033 () Bool)

(assert (=> d!91034 e!189033))

(declare-fun res!224343 () Bool)

(assert (=> d!91034 (=> (not res!224343) (not e!189033))))

(declare-fun lt!408856 () (_ BitVec 64))

(declare-fun lt!408857 () (_ BitVec 64))

(declare-fun lt!408854 () (_ BitVec 64))

(assert (=> d!91034 (= res!224343 (= lt!408857 (bvsub lt!408854 lt!408856)))))

(assert (=> d!91034 (or (= (bvand lt!408854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408856 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408854 lt!408856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!91034 (= lt!408856 (remainingBits!0 ((_ sign_extend 32) (size!6535 (buf!7003 w3!25))) ((_ sign_extend 32) (currentByte!12933 w3!25)) ((_ sign_extend 32) (currentBit!12928 w3!25))))))

(declare-fun lt!408855 () (_ BitVec 64))

(declare-fun lt!408852 () (_ BitVec 64))

(assert (=> d!91034 (= lt!408854 (bvmul lt!408855 lt!408852))))

(assert (=> d!91034 (or (= lt!408855 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408852 (bvsdiv (bvmul lt!408855 lt!408852) lt!408855)))))

(assert (=> d!91034 (= lt!408852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!91034 (= lt!408855 ((_ sign_extend 32) (size!6535 (buf!7003 w3!25))))))

(assert (=> d!91034 (= lt!408857 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12933 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12928 w3!25))))))

(assert (=> d!91034 (invariant!0 (currentBit!12928 w3!25) (currentByte!12933 w3!25) (size!6535 (buf!7003 w3!25)))))

(assert (=> d!91034 (= (bitIndex!0 (size!6535 (buf!7003 w3!25)) (currentByte!12933 w3!25) (currentBit!12928 w3!25)) lt!408857)))

(declare-fun b!269077 () Bool)

(declare-fun res!224344 () Bool)

(assert (=> b!269077 (=> (not res!224344) (not e!189033))))

(assert (=> b!269077 (= res!224344 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408857))))

(declare-fun b!269078 () Bool)

(declare-fun lt!408853 () (_ BitVec 64))

(assert (=> b!269078 (= e!189033 (bvsle lt!408857 (bvmul lt!408853 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!269078 (or (= lt!408853 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408853 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408853)))))

(assert (=> b!269078 (= lt!408853 ((_ sign_extend 32) (size!6535 (buf!7003 w3!25))))))

(assert (= (and d!91034 res!224343) b!269077))

(assert (= (and b!269077 res!224344) b!269078))

(declare-fun m!400629 () Bool)

(assert (=> d!91034 m!400629))

(assert (=> d!91034 m!400495))

(assert (=> b!268956 d!91034))

(declare-fun d!91036 () Bool)

(assert (=> d!91036 (= (invariant!0 (currentBit!12928 w1!591) (currentByte!12933 w1!591) (size!6535 (buf!7003 w1!591))) (and (bvsge (currentBit!12928 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12928 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12933 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12933 w1!591) (size!6535 (buf!7003 w1!591))) (and (= (currentBit!12928 w1!591) #b00000000000000000000000000000000) (= (currentByte!12933 w1!591) (size!6535 (buf!7003 w1!591)))))))))

(assert (=> d!90968 d!91036))

(push 1)

(assert (not b!269075))

(assert (not b!269026))

(assert (not b!269027))

(assert (not b!269030))

(assert (not b!269072))

(assert (not b!269071))

(assert (not d!91034))

(assert (not bm!4268))

(assert (not bm!4263))

(assert (not d!91022))

(assert (not d!91030))

(check-sat)

(pop 1)

(push 1)

(check-sat)

