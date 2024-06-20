; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62066 () Bool)

(assert start!62066)

(declare-fun b!278107 () Bool)

(declare-datatypes ((Unit!19447 0))(
  ( (Unit!19448) )
))
(declare-fun e!197994 () Unit!19447)

(declare-fun Unit!19449 () Unit!19447)

(assert (=> b!278107 (= e!197994 Unit!19449)))

(declare-fun b!278109 () Bool)

(declare-fun res!230963 () Bool)

(declare-fun e!197996 () Bool)

(assert (=> b!278109 (=> (not res!230963) (not e!197996))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278109 (= res!230963 (bvslt from!822 to!789))))

(declare-fun b!278110 () Bool)

(declare-fun e!197993 () Bool)

(assert (=> b!278110 (= e!197996 e!197993)))

(declare-fun res!230964 () Bool)

(assert (=> b!278110 (=> (not res!230964) (not e!197993))))

(declare-datatypes ((tuple4!614 0))(
  ( (tuple4!615 (_1!12382 (_ BitVec 32)) (_2!12382 (_ BitVec 32)) (_3!1087 (_ BitVec 32)) (_4!307 (_ BitVec 32))) )
))
(declare-fun lt!415777 () tuple4!614)

(assert (=> b!278110 (= res!230964 (= (_3!1087 lt!415777) (_4!307 lt!415777)))))

(declare-fun lt!415775 () Unit!19447)

(assert (=> b!278110 (= lt!415775 e!197994)))

(declare-fun c!12744 () Bool)

(assert (=> b!278110 (= c!12744 (bvslt (_1!12382 lt!415777) (_2!12382 lt!415777)))))

(declare-fun lt!415779 () (_ BitVec 32))

(assert (=> b!278110 (= lt!415779 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415776 () (_ BitVec 32))

(assert (=> b!278110 (= lt!415776 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!614)

(assert (=> b!278110 (= lt!415777 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278111 () Bool)

(declare-fun res!230965 () Bool)

(assert (=> b!278111 (=> (not res!230965) (not e!197996))))

(declare-datatypes ((array!15987 0))(
  ( (array!15988 (arr!7910 (Array (_ BitVec 32) (_ BitVec 8))) (size!6914 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15987)

(declare-fun a2!699 () array!15987)

(declare-fun arrayBitRangesEq!0 (array!15987 array!15987 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278111 (= res!230965 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278112 () Bool)

(declare-fun Unit!19450 () Unit!19447)

(assert (=> b!278112 (= e!197994 Unit!19450)))

(declare-fun arrayRangesEq!1200 (array!15987 array!15987 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278112 (arrayRangesEq!1200 a1!699 a2!699 (_1!12382 lt!415777) (_2!12382 lt!415777))))

(declare-fun lt!415778 () Unit!19447)

(declare-fun arrayRangesEqSymmetricLemma!119 (array!15987 array!15987 (_ BitVec 32) (_ BitVec 32)) Unit!19447)

(assert (=> b!278112 (= lt!415778 (arrayRangesEqSymmetricLemma!119 a1!699 a2!699 (_1!12382 lt!415777) (_2!12382 lt!415777)))))

(assert (=> b!278112 (arrayRangesEq!1200 a2!699 a1!699 (_1!12382 lt!415777) (_2!12382 lt!415777))))

(declare-fun b!278113 () Bool)

(declare-fun e!197997 () Bool)

(assert (=> b!278113 (= e!197997 (or (bvsgt (size!6914 a2!699) (size!6914 a1!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6914 a2!699))))))))

(declare-fun b!278108 () Bool)

(assert (=> b!278108 (= e!197993 (not e!197997))))

(declare-fun res!230966 () Bool)

(assert (=> b!278108 (=> res!230966 e!197997)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278108 (= res!230966 (not (byteRangesEq!0 (select (arr!7910 a2!699) (_3!1087 lt!415777)) (select (arr!7910 a1!699) (_3!1087 lt!415777)) lt!415776 lt!415779)))))

(assert (=> b!278108 (byteRangesEq!0 (select (arr!7910 a1!699) (_3!1087 lt!415777)) (select (arr!7910 a2!699) (_3!1087 lt!415777)) lt!415776 lt!415779)))

(declare-fun res!230962 () Bool)

(assert (=> start!62066 (=> (not res!230962) (not e!197996))))

(assert (=> start!62066 (= res!230962 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6914 a1!699) (size!6914 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6914 a1!699))))))))

(assert (=> start!62066 e!197996))

(assert (=> start!62066 true))

(declare-fun array_inv!6638 (array!15987) Bool)

(assert (=> start!62066 (array_inv!6638 a1!699)))

(assert (=> start!62066 (array_inv!6638 a2!699)))

(assert (= (and start!62066 res!230962) b!278111))

(assert (= (and b!278111 res!230965) b!278109))

(assert (= (and b!278109 res!230963) b!278110))

(assert (= (and b!278110 c!12744) b!278112))

(assert (= (and b!278110 (not c!12744)) b!278107))

(assert (= (and b!278110 res!230964) b!278108))

(assert (= (and b!278108 (not res!230966)) b!278113))

(declare-fun m!411215 () Bool)

(assert (=> b!278112 m!411215))

(declare-fun m!411217 () Bool)

(assert (=> b!278112 m!411217))

(declare-fun m!411219 () Bool)

(assert (=> b!278112 m!411219))

(declare-fun m!411221 () Bool)

(assert (=> start!62066 m!411221))

(declare-fun m!411223 () Bool)

(assert (=> start!62066 m!411223))

(declare-fun m!411225 () Bool)

(assert (=> b!278111 m!411225))

(declare-fun m!411227 () Bool)

(assert (=> b!278108 m!411227))

(declare-fun m!411229 () Bool)

(assert (=> b!278108 m!411229))

(assert (=> b!278108 m!411227))

(assert (=> b!278108 m!411229))

(declare-fun m!411231 () Bool)

(assert (=> b!278108 m!411231))

(assert (=> b!278108 m!411229))

(assert (=> b!278108 m!411227))

(declare-fun m!411233 () Bool)

(assert (=> b!278108 m!411233))

(declare-fun m!411235 () Bool)

(assert (=> b!278110 m!411235))

(check-sat (not b!278110) (not start!62066) (not b!278111) (not b!278112) (not b!278108))
(check-sat)
