; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70924 () Bool)

(assert start!70924)

(declare-fun res!263380 () Bool)

(declare-fun e!230738 () Bool)

(assert (=> start!70924 (=> (not res!263380) (not e!230738))))

(declare-fun lt!444038 () (_ BitVec 64))

(assert (=> start!70924 (= res!263380 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444038))))

(declare-datatypes ((array!20204 0))(
  ( (array!20205 (arr!9899 (Array (_ BitVec 32) (_ BitVec 8))) (size!8807 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20204)

(assert (=> start!70924 (= lt!444038 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8807 a!440))))))

(assert (=> start!70924 e!230738))

(declare-fun array_inv!8359 (array!20204) Bool)

(assert (=> start!70924 (array_inv!8359 a!440)))

(declare-fun b!320596 () Bool)

(declare-fun arrayBitRangesEq!0 (array!20204 array!20204 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320596 (= e!230738 (not (arrayBitRangesEq!0 a!440 a!440 lt!444038 lt!444038)))))

(assert (= (and start!70924 res!263380) b!320596))

(declare-fun m!458969 () Bool)

(assert (=> start!70924 m!458969))

(declare-fun m!458971 () Bool)

(assert (=> b!320596 m!458971))

(check-sat (not b!320596) (not start!70924))
(check-sat)
(get-model)

(declare-fun b!320645 () Bool)

(declare-fun e!230793 () Bool)

(declare-fun call!6064 () Bool)

(assert (=> b!320645 (= e!230793 call!6064)))

(declare-fun c!15372 () Bool)

(declare-fun lt!444065 () (_ BitVec 32))

(declare-fun lt!444063 () (_ BitVec 32))

(declare-datatypes ((tuple4!1340 0))(
  ( (tuple4!1341 (_1!13349 (_ BitVec 32)) (_2!13349 (_ BitVec 32)) (_3!1627 (_ BitVec 32)) (_4!670 (_ BitVec 32))) )
))
(declare-fun lt!444064 () tuple4!1340)

(declare-fun bm!6061 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6061 (= call!6064 (byteRangesEq!0 (select (arr!9899 a!440) (_3!1627 lt!444064)) (select (arr!9899 a!440) (_3!1627 lt!444064)) lt!444063 (ite c!15372 lt!444065 #b00000000000000000000000000001000)))))

(declare-fun b!320648 () Bool)

(declare-fun e!230786 () Bool)

(assert (=> b!320648 (= e!230793 e!230786)))

(declare-fun res!263415 () Bool)

(assert (=> b!320648 (= res!263415 call!6064)))

(assert (=> b!320648 (=> (not res!263415) (not e!230786))))

(declare-fun b!320652 () Bool)

(declare-fun res!263422 () Bool)

(assert (=> b!320652 (= res!263422 (= lt!444065 #b00000000000000000000000000000000))))

(declare-fun e!230792 () Bool)

(assert (=> b!320652 (=> res!263422 e!230792)))

(assert (=> b!320652 (= e!230786 e!230792)))

(declare-fun b!320653 () Bool)

(declare-fun e!230791 () Bool)

(assert (=> b!320653 (= e!230791 e!230793)))

(assert (=> b!320653 (= c!15372 (= (_3!1627 lt!444064) (_4!670 lt!444064)))))

(declare-fun d!104982 () Bool)

(declare-fun res!263416 () Bool)

(declare-fun e!230790 () Bool)

(assert (=> d!104982 (=> res!263416 e!230790)))

(assert (=> d!104982 (= res!263416 (bvsge lt!444038 lt!444038))))

(assert (=> d!104982 (= (arrayBitRangesEq!0 a!440 a!440 lt!444038 lt!444038) e!230790)))

(declare-fun b!320650 () Bool)

(assert (=> b!320650 (= e!230790 e!230791)))

(declare-fun res!263419 () Bool)

(assert (=> b!320650 (=> (not res!263419) (not e!230791))))

(declare-fun e!230785 () Bool)

(assert (=> b!320650 (= res!263419 e!230785)))

(declare-fun res!263417 () Bool)

(assert (=> b!320650 (=> res!263417 e!230785)))

(assert (=> b!320650 (= res!263417 (bvsge (_1!13349 lt!444064) (_2!13349 lt!444064)))))

(assert (=> b!320650 (= lt!444065 ((_ extract 31 0) (bvsrem lt!444038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320650 (= lt!444063 ((_ extract 31 0) (bvsrem lt!444038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1340)

(assert (=> b!320650 (= lt!444064 (arrayBitIndices!0 lt!444038 lt!444038))))

(declare-fun b!320654 () Bool)

(assert (=> b!320654 (= e!230792 (byteRangesEq!0 (select (arr!9899 a!440) (_4!670 lt!444064)) (select (arr!9899 a!440) (_4!670 lt!444064)) #b00000000000000000000000000000000 lt!444065))))

(declare-fun b!320655 () Bool)

(declare-fun arrayRangesEq!1825 (array!20204 array!20204 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320655 (= e!230785 (arrayRangesEq!1825 a!440 a!440 (_1!13349 lt!444064) (_2!13349 lt!444064)))))

(assert (= (and d!104982 (not res!263416)) b!320650))

(assert (= (and b!320650 (not res!263417)) b!320655))

(assert (= (and b!320650 res!263419) b!320653))

(assert (= (and b!320653 c!15372) b!320645))

(assert (= (and b!320653 (not c!15372)) b!320648))

(assert (= (and b!320648 res!263415) b!320652))

(assert (= (and b!320652 (not res!263422)) b!320654))

(assert (= (or b!320645 b!320648) bm!6061))

(declare-fun m!458979 () Bool)

(assert (=> bm!6061 m!458979))

(assert (=> bm!6061 m!458979))

(assert (=> bm!6061 m!458979))

(assert (=> bm!6061 m!458979))

(declare-fun m!458981 () Bool)

(assert (=> bm!6061 m!458981))

(declare-fun m!458985 () Bool)

(assert (=> b!320650 m!458985))

(declare-fun m!458989 () Bool)

(assert (=> b!320654 m!458989))

(assert (=> b!320654 m!458989))

(assert (=> b!320654 m!458989))

(assert (=> b!320654 m!458989))

(declare-fun m!458993 () Bool)

(assert (=> b!320654 m!458993))

(declare-fun m!458997 () Bool)

(assert (=> b!320655 m!458997))

(assert (=> b!320596 d!104982))

(declare-fun d!104986 () Bool)

(assert (=> d!104986 (= (array_inv!8359 a!440) (bvsge (size!8807 a!440) #b00000000000000000000000000000000))))

(assert (=> start!70924 d!104986))

(check-sat (not b!320654) (not b!320650) (not b!320655) (not bm!6061))
(check-sat)
