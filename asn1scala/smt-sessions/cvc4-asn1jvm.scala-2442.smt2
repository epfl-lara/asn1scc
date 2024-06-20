; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62104 () Bool)

(assert start!62104)

(declare-fun b!278565 () Bool)

(declare-fun e!198355 () Bool)

(declare-datatypes ((array!16025 0))(
  ( (array!16026 (arr!7929 (Array (_ BitVec 32) (_ BitVec 8))) (size!6933 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16025)

(declare-fun a2!699 () array!16025)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278565 (= e!198355 (or (bvsgt (size!6933 a2!699) (size!6933 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6933 a2!699))))))))

(declare-fun b!278566 () Bool)

(declare-datatypes ((tuple4!652 0))(
  ( (tuple4!653 (_1!12401 (_ BitVec 32)) (_2!12401 (_ BitVec 32)) (_3!1106 (_ BitVec 32)) (_4!326 (_ BitVec 32))) )
))
(declare-fun lt!416045 () tuple4!652)

(declare-fun e!198357 () Bool)

(declare-fun lt!416042 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278566 (= e!198357 (byteRangesEq!0 (select (arr!7929 a1!699) (_4!326 lt!416045)) (select (arr!7929 a2!699) (_4!326 lt!416045)) #b00000000000000000000000000000000 lt!416042))))

(declare-fun b!278567 () Bool)

(declare-fun res!231309 () Bool)

(declare-fun e!198353 () Bool)

(assert (=> b!278567 (=> (not res!231309) (not e!198353))))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278567 (= res!231309 (bvslt from!822 to!789))))

(declare-fun b!278568 () Bool)

(declare-datatypes ((Unit!19523 0))(
  ( (Unit!19524) )
))
(declare-fun e!198352 () Unit!19523)

(declare-fun Unit!19525 () Unit!19523)

(assert (=> b!278568 (= e!198352 Unit!19525)))

(declare-fun b!278570 () Bool)

(declare-fun e!198356 () Bool)

(assert (=> b!278570 (= e!198353 e!198356)))

(declare-fun res!231314 () Bool)

(assert (=> b!278570 (=> (not res!231314) (not e!198356))))

(assert (=> b!278570 (= res!231314 (not (= (_3!1106 lt!416045) (_4!326 lt!416045))))))

(declare-fun lt!416044 () Unit!19523)

(assert (=> b!278570 (= lt!416044 e!198352)))

(declare-fun c!12801 () Bool)

(assert (=> b!278570 (= c!12801 (bvslt (_1!12401 lt!416045) (_2!12401 lt!416045)))))

(assert (=> b!278570 (= lt!416042 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!416046 () (_ BitVec 32))

(assert (=> b!278570 (= lt!416046 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!652)

(assert (=> b!278570 (= lt!416045 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278571 () Bool)

(assert (=> b!278571 (= e!198356 (not e!198355))))

(declare-fun res!231307 () Bool)

(assert (=> b!278571 (=> res!231307 e!198355)))

(assert (=> b!278571 (= res!231307 (= lt!416042 #b00000000000000000000000000000000))))

(declare-fun e!198350 () Bool)

(assert (=> b!278571 e!198350))

(declare-fun res!231313 () Bool)

(assert (=> b!278571 (=> (not res!231313) (not e!198350))))

(assert (=> b!278571 (= res!231313 (byteRangesEq!0 (select (arr!7929 a1!699) (_3!1106 lt!416045)) (select (arr!7929 a2!699) (_3!1106 lt!416045)) lt!416046 #b00000000000000000000000000001000))))

(declare-fun b!278572 () Bool)

(declare-fun res!231308 () Bool)

(assert (=> b!278572 (=> res!231308 e!198355)))

(assert (=> b!278572 (= res!231308 (not (byteRangesEq!0 (select (arr!7929 a2!699) (_4!326 lt!416045)) (select (arr!7929 a1!699) (_4!326 lt!416045)) #b00000000000000000000000000000000 lt!416042)))))

(declare-fun b!278573 () Bool)

(declare-fun res!231312 () Bool)

(assert (=> b!278573 (=> (not res!231312) (not e!198353))))

(declare-fun arrayBitRangesEq!0 (array!16025 array!16025 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278573 (= res!231312 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278574 () Bool)

(assert (=> b!278574 (= e!198350 e!198357)))

(declare-fun res!231306 () Bool)

(assert (=> b!278574 (=> res!231306 e!198357)))

(assert (=> b!278574 (= res!231306 (= lt!416042 #b00000000000000000000000000000000))))

(declare-fun b!278575 () Bool)

(declare-fun Unit!19526 () Unit!19523)

(assert (=> b!278575 (= e!198352 Unit!19526)))

(declare-fun arrayRangesEq!1219 (array!16025 array!16025 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278575 (arrayRangesEq!1219 a1!699 a2!699 (_1!12401 lt!416045) (_2!12401 lt!416045))))

(declare-fun lt!416043 () Unit!19523)

(declare-fun arrayRangesEqSymmetricLemma!138 (array!16025 array!16025 (_ BitVec 32) (_ BitVec 32)) Unit!19523)

(assert (=> b!278575 (= lt!416043 (arrayRangesEqSymmetricLemma!138 a1!699 a2!699 (_1!12401 lt!416045) (_2!12401 lt!416045)))))

(assert (=> b!278575 (arrayRangesEq!1219 a2!699 a1!699 (_1!12401 lt!416045) (_2!12401 lt!416045))))

(declare-fun res!231310 () Bool)

(assert (=> start!62104 (=> (not res!231310) (not e!198353))))

(assert (=> start!62104 (= res!231310 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6933 a1!699) (size!6933 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6933 a1!699))))))))

(assert (=> start!62104 e!198353))

(assert (=> start!62104 true))

(declare-fun array_inv!6657 (array!16025) Bool)

(assert (=> start!62104 (array_inv!6657 a1!699)))

(assert (=> start!62104 (array_inv!6657 a2!699)))

(declare-fun b!278569 () Bool)

(declare-fun res!231311 () Bool)

(assert (=> b!278569 (=> (not res!231311) (not e!198350))))

(assert (=> b!278569 (= res!231311 (byteRangesEq!0 (select (arr!7929 a2!699) (_3!1106 lt!416045)) (select (arr!7929 a1!699) (_3!1106 lt!416045)) lt!416046 #b00000000000000000000000000001000))))

(assert (= (and start!62104 res!231310) b!278573))

(assert (= (and b!278573 res!231312) b!278567))

(assert (= (and b!278567 res!231309) b!278570))

(assert (= (and b!278570 c!12801) b!278575))

(assert (= (and b!278570 (not c!12801)) b!278568))

(assert (= (and b!278570 res!231314) b!278571))

(assert (= (and b!278571 res!231313) b!278569))

(assert (= (and b!278569 res!231311) b!278574))

(assert (= (and b!278574 (not res!231306)) b!278566))

(assert (= (and b!278571 (not res!231307)) b!278572))

(assert (= (and b!278572 (not res!231308)) b!278565))

(declare-fun m!411661 () Bool)

(assert (=> b!278569 m!411661))

(declare-fun m!411663 () Bool)

(assert (=> b!278569 m!411663))

(assert (=> b!278569 m!411661))

(assert (=> b!278569 m!411663))

(declare-fun m!411665 () Bool)

(assert (=> b!278569 m!411665))

(declare-fun m!411667 () Bool)

(assert (=> b!278566 m!411667))

(declare-fun m!411669 () Bool)

(assert (=> b!278566 m!411669))

(assert (=> b!278566 m!411667))

(assert (=> b!278566 m!411669))

(declare-fun m!411671 () Bool)

(assert (=> b!278566 m!411671))

(declare-fun m!411673 () Bool)

(assert (=> b!278575 m!411673))

(declare-fun m!411675 () Bool)

(assert (=> b!278575 m!411675))

(declare-fun m!411677 () Bool)

(assert (=> b!278575 m!411677))

(assert (=> b!278572 m!411669))

(assert (=> b!278572 m!411667))

(assert (=> b!278572 m!411669))

(assert (=> b!278572 m!411667))

(declare-fun m!411679 () Bool)

(assert (=> b!278572 m!411679))

(declare-fun m!411681 () Bool)

(assert (=> b!278570 m!411681))

(declare-fun m!411683 () Bool)

(assert (=> b!278573 m!411683))

(assert (=> b!278571 m!411663))

(assert (=> b!278571 m!411661))

(assert (=> b!278571 m!411663))

(assert (=> b!278571 m!411661))

(declare-fun m!411685 () Bool)

(assert (=> b!278571 m!411685))

(declare-fun m!411687 () Bool)

(assert (=> start!62104 m!411687))

(declare-fun m!411689 () Bool)

(assert (=> start!62104 m!411689))

(push 1)

(assert (not b!278572))

(assert (not b!278566))

(assert (not b!278571))

(assert (not b!278575))

(assert (not b!278570))

(assert (not start!62104))

(assert (not b!278569))

(assert (not b!278573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

