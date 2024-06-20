; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70636 () Bool)

(assert start!70636)

(declare-fun res!262714 () Bool)

(declare-fun e!229916 () Bool)

(assert (=> start!70636 (=> (not res!262714) (not e!229916))))

(declare-fun lt!443618 () (_ BitVec 64))

(assert (=> start!70636 (= res!262714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!443618))))

(declare-datatypes ((array!20013 0))(
  ( (array!20014 (arr!9813 (Array (_ BitVec 32) (_ BitVec 8))) (size!8721 (_ BitVec 32))) )
))
(declare-fun a!422 () array!20013)

(assert (=> start!70636 (= lt!443618 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8721 a!422))))))

(assert (=> start!70636 e!229916))

(declare-fun array_inv!8273 (array!20013) Bool)

(assert (=> start!70636 (array_inv!8273 a!422)))

(declare-fun b!319736 () Bool)

(declare-fun arrayBitRangesEq!0 (array!20013 array!20013 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319736 (= e!229916 (not (arrayBitRangesEq!0 a!422 a!422 lt!443618 lt!443618)))))

(assert (= (and start!70636 res!262714) b!319736))

(declare-fun m!458221 () Bool)

(assert (=> start!70636 m!458221))

(declare-fun m!458223 () Bool)

(assert (=> b!319736 m!458223))

(push 1)

(assert (not b!319736))

(assert (not start!70636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!319786 () Bool)

(declare-fun res!262754 () Bool)

(declare-fun lt!443641 () (_ BitVec 32))

(assert (=> b!319786 (= res!262754 (= lt!443641 #b00000000000000000000000000000000))))

(declare-fun e!229960 () Bool)

(assert (=> b!319786 (=> res!262754 e!229960)))

(declare-fun e!229963 () Bool)

(assert (=> b!319786 (= e!229963 e!229960)))

(declare-fun b!319787 () Bool)

(declare-fun e!229962 () Bool)

(declare-fun call!6022 () Bool)

(assert (=> b!319787 (= e!229962 call!6022)))

(declare-fun d!104766 () Bool)

(declare-fun res!262752 () Bool)

(declare-fun e!229964 () Bool)

(assert (=> d!104766 (=> res!262752 e!229964)))

(assert (=> d!104766 (= res!262752 (bvsge lt!443618 lt!443618))))

(assert (=> d!104766 (= (arrayBitRangesEq!0 a!422 a!422 lt!443618 lt!443618) e!229964)))

(declare-fun b!319788 () Bool)

(declare-fun e!229961 () Bool)

(declare-datatypes ((tuple4!1318 0))(
  ( (tuple4!1319 (_1!13338 (_ BitVec 32)) (_2!13338 (_ BitVec 32)) (_3!1616 (_ BitVec 32)) (_4!659 (_ BitVec 32))) )
))
(declare-fun lt!443642 () tuple4!1318)

(declare-fun arrayRangesEq!1812 (array!20013 array!20013 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319788 (= e!229961 (arrayRangesEq!1812 a!422 a!422 (_1!13338 lt!443642) (_2!13338 lt!443642)))))

(declare-fun b!319789 () Bool)

(declare-fun e!229965 () Bool)

(assert (=> b!319789 (= e!229964 e!229965)))

(declare-fun res!262751 () Bool)

(assert (=> b!319789 (=> (not res!262751) (not e!229965))))

(assert (=> b!319789 (= res!262751 e!229961)))

(declare-fun res!262753 () Bool)

(assert (=> b!319789 (=> res!262753 e!229961)))

(assert (=> b!319789 (= res!262753 (bvsge (_1!13338 lt!443642) (_2!13338 lt!443642)))))

(assert (=> b!319789 (= lt!443641 ((_ extract 31 0) (bvsrem lt!443618 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!443640 () (_ BitVec 32))

(assert (=> b!319789 (= lt!443640 ((_ extract 31 0) (bvsrem lt!443618 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1318)

(assert (=> b!319789 (= lt!443642 (arrayBitIndices!0 lt!443618 lt!443618))))

(declare-fun bm!6019 () Bool)

(declare-fun c!15303 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6019 (= call!6022 (byteRangesEq!0 (ite c!15303 (select (arr!9813 a!422) (_3!1616 lt!443642)) (select (arr!9813 a!422) (_4!659 lt!443642))) (ite c!15303 (select (arr!9813 a!422) (_3!1616 lt!443642)) (select (arr!9813 a!422) (_4!659 lt!443642))) (ite c!15303 lt!443640 #b00000000000000000000000000000000) lt!443641))))

(declare-fun b!319790 () Bool)

(assert (=> b!319790 (= e!229960 call!6022)))

(declare-fun b!319791 () Bool)

(assert (=> b!319791 (= e!229965 e!229962)))

(assert (=> b!319791 (= c!15303 (= (_3!1616 lt!443642) (_4!659 lt!443642)))))

(declare-fun b!319792 () Bool)

(assert (=> b!319792 (= e!229962 e!229963)))

(declare-fun res!262750 () Bool)

(assert (=> b!319792 (= res!262750 (byteRangesEq!0 (select (arr!9813 a!422) (_3!1616 lt!443642)) (select (arr!9813 a!422) (_3!1616 lt!443642)) lt!443640 #b00000000000000000000000000001000))))

(assert (=> b!319792 (=> (not res!262750) (not e!229963))))

(assert (= (and d!104766 (not res!262752)) b!319789))

(assert (= (and b!319789 (not res!262753)) b!319788))

(assert (= (and b!319789 res!262751) b!319791))

(assert (= (and b!319791 c!15303) b!319787))

(assert (= (and b!319791 (not c!15303)) b!319792))

(assert (= (and b!319792 res!262750) b!319786))

(assert (= (and b!319786 (not res!262754)) b!319790))

(assert (= (or b!319787 b!319790) bm!6019))

(declare-fun m!458239 () Bool)

(assert (=> b!319788 m!458239))

(declare-fun m!458241 () Bool)

(assert (=> b!319789 m!458241))

(declare-fun m!458245 () Bool)

(assert (=> bm!6019 m!458245))

(declare-fun m!458248 () Bool)

(assert (=> bm!6019 m!458248))

(assert (=> bm!6019 m!458245))

(assert (=> bm!6019 m!458248))

(declare-fun m!458253 () Bool)

(assert (=> bm!6019 m!458253))

(assert (=> b!319792 m!458245))

(assert (=> b!319792 m!458245))

(assert (=> b!319792 m!458245))

