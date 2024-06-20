; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62096 () Bool)

(assert start!62096)

(declare-fun lt!415985 () (_ BitVec 32))

(declare-fun b!278433 () Bool)

(declare-fun e!198261 () Bool)

(declare-datatypes ((array!16017 0))(
  ( (array!16018 (arr!7925 (Array (_ BitVec 32) (_ BitVec 8))) (size!6929 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!16017)

(declare-fun a1!699 () array!16017)

(declare-datatypes ((tuple4!644 0))(
  ( (tuple4!645 (_1!12397 (_ BitVec 32)) (_2!12397 (_ BitVec 32)) (_3!1102 (_ BitVec 32)) (_4!322 (_ BitVec 32))) )
))
(declare-fun lt!415982 () tuple4!644)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278433 (= e!198261 (byteRangesEq!0 (select (arr!7925 a1!699) (_4!322 lt!415982)) (select (arr!7925 a2!699) (_4!322 lt!415982)) #b00000000000000000000000000000000 lt!415985))))

(declare-fun b!278434 () Bool)

(declare-fun e!198258 () Bool)

(assert (=> b!278434 (= e!198258 (bvsle (size!6929 a2!699) (size!6929 a1!699)))))

(declare-fun res!231200 () Bool)

(declare-fun e!198255 () Bool)

(assert (=> start!62096 (=> (not res!231200) (not e!198255))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62096 (= res!231200 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6929 a1!699) (size!6929 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6929 a1!699))))))))

(assert (=> start!62096 e!198255))

(assert (=> start!62096 true))

(declare-fun array_inv!6653 (array!16017) Bool)

(assert (=> start!62096 (array_inv!6653 a1!699)))

(assert (=> start!62096 (array_inv!6653 a2!699)))

(declare-fun b!278435 () Bool)

(declare-datatypes ((Unit!19507 0))(
  ( (Unit!19508) )
))
(declare-fun e!198254 () Unit!19507)

(declare-fun Unit!19509 () Unit!19507)

(assert (=> b!278435 (= e!198254 Unit!19509)))

(declare-fun b!278436 () Bool)

(declare-fun e!198259 () Bool)

(assert (=> b!278436 (= e!198259 e!198261)))

(declare-fun res!231205 () Bool)

(assert (=> b!278436 (=> res!231205 e!198261)))

(assert (=> b!278436 (= res!231205 (= lt!415985 #b00000000000000000000000000000000))))

(declare-fun b!278437 () Bool)

(declare-fun res!231198 () Bool)

(assert (=> b!278437 (=> (not res!231198) (not e!198259))))

(declare-fun lt!415986 () (_ BitVec 32))

(assert (=> b!278437 (= res!231198 (byteRangesEq!0 (select (arr!7925 a2!699) (_3!1102 lt!415982)) (select (arr!7925 a1!699) (_3!1102 lt!415982)) lt!415986 #b00000000000000000000000000001000))))

(declare-fun b!278438 () Bool)

(declare-fun e!198256 () Bool)

(assert (=> b!278438 (= e!198256 (not e!198258))))

(declare-fun res!231201 () Bool)

(assert (=> b!278438 (=> res!231201 e!198258)))

(assert (=> b!278438 (= res!231201 (= lt!415985 #b00000000000000000000000000000000))))

(assert (=> b!278438 e!198259))

(declare-fun res!231202 () Bool)

(assert (=> b!278438 (=> (not res!231202) (not e!198259))))

(assert (=> b!278438 (= res!231202 (byteRangesEq!0 (select (arr!7925 a1!699) (_3!1102 lt!415982)) (select (arr!7925 a2!699) (_3!1102 lt!415982)) lt!415986 #b00000000000000000000000000001000))))

(declare-fun b!278439 () Bool)

(declare-fun res!231206 () Bool)

(assert (=> b!278439 (=> (not res!231206) (not e!198255))))

(assert (=> b!278439 (= res!231206 (bvslt from!822 to!789))))

(declare-fun b!278440 () Bool)

(declare-fun res!231199 () Bool)

(assert (=> b!278440 (=> res!231199 e!198258)))

(assert (=> b!278440 (= res!231199 (not (byteRangesEq!0 (select (arr!7925 a2!699) (_4!322 lt!415982)) (select (arr!7925 a1!699) (_4!322 lt!415982)) #b00000000000000000000000000000000 lt!415985)))))

(declare-fun b!278441 () Bool)

(assert (=> b!278441 (= e!198255 e!198256)))

(declare-fun res!231204 () Bool)

(assert (=> b!278441 (=> (not res!231204) (not e!198256))))

(assert (=> b!278441 (= res!231204 (not (= (_3!1102 lt!415982) (_4!322 lt!415982))))))

(declare-fun lt!415983 () Unit!19507)

(assert (=> b!278441 (= lt!415983 e!198254)))

(declare-fun c!12789 () Bool)

(assert (=> b!278441 (= c!12789 (bvslt (_1!12397 lt!415982) (_2!12397 lt!415982)))))

(assert (=> b!278441 (= lt!415985 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!278441 (= lt!415986 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!644)

(assert (=> b!278441 (= lt!415982 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278442 () Bool)

(declare-fun Unit!19510 () Unit!19507)

(assert (=> b!278442 (= e!198254 Unit!19510)))

(declare-fun arrayRangesEq!1215 (array!16017 array!16017 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278442 (arrayRangesEq!1215 a1!699 a2!699 (_1!12397 lt!415982) (_2!12397 lt!415982))))

(declare-fun lt!415984 () Unit!19507)

(declare-fun arrayRangesEqSymmetricLemma!134 (array!16017 array!16017 (_ BitVec 32) (_ BitVec 32)) Unit!19507)

(assert (=> b!278442 (= lt!415984 (arrayRangesEqSymmetricLemma!134 a1!699 a2!699 (_1!12397 lt!415982) (_2!12397 lt!415982)))))

(assert (=> b!278442 (arrayRangesEq!1215 a2!699 a1!699 (_1!12397 lt!415982) (_2!12397 lt!415982))))

(declare-fun b!278443 () Bool)

(declare-fun res!231203 () Bool)

(assert (=> b!278443 (=> (not res!231203) (not e!198255))))

(declare-fun arrayBitRangesEq!0 (array!16017 array!16017 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278443 (= res!231203 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(assert (= (and start!62096 res!231200) b!278443))

(assert (= (and b!278443 res!231203) b!278439))

(assert (= (and b!278439 res!231206) b!278441))

(assert (= (and b!278441 c!12789) b!278442))

(assert (= (and b!278441 (not c!12789)) b!278435))

(assert (= (and b!278441 res!231204) b!278438))

(assert (= (and b!278438 res!231202) b!278437))

(assert (= (and b!278437 res!231198) b!278436))

(assert (= (and b!278436 (not res!231205)) b!278433))

(assert (= (and b!278438 (not res!231201)) b!278440))

(assert (= (and b!278440 (not res!231199)) b!278434))

(declare-fun m!411541 () Bool)

(assert (=> b!278441 m!411541))

(declare-fun m!411543 () Bool)

(assert (=> start!62096 m!411543))

(declare-fun m!411545 () Bool)

(assert (=> start!62096 m!411545))

(declare-fun m!411547 () Bool)

(assert (=> b!278437 m!411547))

(declare-fun m!411549 () Bool)

(assert (=> b!278437 m!411549))

(assert (=> b!278437 m!411547))

(assert (=> b!278437 m!411549))

(declare-fun m!411551 () Bool)

(assert (=> b!278437 m!411551))

(declare-fun m!411553 () Bool)

(assert (=> b!278440 m!411553))

(declare-fun m!411555 () Bool)

(assert (=> b!278440 m!411555))

(assert (=> b!278440 m!411553))

(assert (=> b!278440 m!411555))

(declare-fun m!411557 () Bool)

(assert (=> b!278440 m!411557))

(assert (=> b!278433 m!411555))

(assert (=> b!278433 m!411553))

(assert (=> b!278433 m!411555))

(assert (=> b!278433 m!411553))

(declare-fun m!411559 () Bool)

(assert (=> b!278433 m!411559))

(assert (=> b!278438 m!411549))

(assert (=> b!278438 m!411547))

(assert (=> b!278438 m!411549))

(assert (=> b!278438 m!411547))

(declare-fun m!411561 () Bool)

(assert (=> b!278438 m!411561))

(declare-fun m!411563 () Bool)

(assert (=> b!278443 m!411563))

(declare-fun m!411565 () Bool)

(assert (=> b!278442 m!411565))

(declare-fun m!411567 () Bool)

(assert (=> b!278442 m!411567))

(declare-fun m!411569 () Bool)

(assert (=> b!278442 m!411569))

(check-sat (not start!62096) (not b!278442) (not b!278443) (not b!278438) (not b!278441) (not b!278440) (not b!278433) (not b!278437))
(check-sat)
