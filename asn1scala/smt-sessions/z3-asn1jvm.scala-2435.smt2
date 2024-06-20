; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62060 () Bool)

(assert start!62060)

(declare-fun b!278044 () Bool)

(declare-fun e!197939 () Bool)

(declare-fun e!197941 () Bool)

(assert (=> b!278044 (= e!197939 e!197941)))

(declare-fun res!230918 () Bool)

(assert (=> b!278044 (=> (not res!230918) (not e!197941))))

(declare-datatypes ((tuple4!608 0))(
  ( (tuple4!609 (_1!12379 (_ BitVec 32)) (_2!12379 (_ BitVec 32)) (_3!1084 (_ BitVec 32)) (_4!304 (_ BitVec 32))) )
))
(declare-fun lt!415734 () tuple4!608)

(assert (=> b!278044 (= res!230918 (= (_3!1084 lt!415734) (_4!304 lt!415734)))))

(declare-datatypes ((Unit!19435 0))(
  ( (Unit!19436) )
))
(declare-fun lt!415731 () Unit!19435)

(declare-fun e!197940 () Unit!19435)

(assert (=> b!278044 (= lt!415731 e!197940)))

(declare-fun c!12735 () Bool)

(assert (=> b!278044 (= c!12735 (bvslt (_1!12379 lt!415734) (_2!12379 lt!415734)))))

(declare-fun lt!415733 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278044 (= lt!415733 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415732 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278044 (= lt!415732 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!608)

(assert (=> b!278044 (= lt!415734 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278045 () Bool)

(declare-fun Unit!19437 () Unit!19435)

(assert (=> b!278045 (= e!197940 Unit!19437)))

(declare-fun res!230917 () Bool)

(assert (=> start!62060 (=> (not res!230917) (not e!197939))))

(declare-datatypes ((array!15981 0))(
  ( (array!15982 (arr!7907 (Array (_ BitVec 32) (_ BitVec 8))) (size!6911 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15981)

(declare-fun a2!699 () array!15981)

(assert (=> start!62060 (= res!230917 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6911 a1!699) (size!6911 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6911 a1!699))))))))

(assert (=> start!62060 e!197939))

(assert (=> start!62060 true))

(declare-fun array_inv!6635 (array!15981) Bool)

(assert (=> start!62060 (array_inv!6635 a1!699)))

(assert (=> start!62060 (array_inv!6635 a2!699)))

(declare-fun b!278046 () Bool)

(declare-fun Unit!19438 () Unit!19435)

(assert (=> b!278046 (= e!197940 Unit!19438)))

(declare-fun arrayRangesEq!1197 (array!15981 array!15981 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278046 (arrayRangesEq!1197 a1!699 a2!699 (_1!12379 lt!415734) (_2!12379 lt!415734))))

(declare-fun lt!415730 () Unit!19435)

(declare-fun arrayRangesEqSymmetricLemma!116 (array!15981 array!15981 (_ BitVec 32) (_ BitVec 32)) Unit!19435)

(assert (=> b!278046 (= lt!415730 (arrayRangesEqSymmetricLemma!116 a1!699 a2!699 (_1!12379 lt!415734) (_2!12379 lt!415734)))))

(assert (=> b!278046 (arrayRangesEq!1197 a2!699 a1!699 (_1!12379 lt!415734) (_2!12379 lt!415734))))

(declare-fun b!278047 () Bool)

(declare-fun e!197943 () Bool)

(assert (=> b!278047 (= e!197941 (not e!197943))))

(declare-fun res!230919 () Bool)

(assert (=> b!278047 (=> res!230919 e!197943)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278047 (= res!230919 (not (byteRangesEq!0 (select (arr!7907 a2!699) (_3!1084 lt!415734)) (select (arr!7907 a1!699) (_3!1084 lt!415734)) lt!415732 lt!415733)))))

(assert (=> b!278047 (byteRangesEq!0 (select (arr!7907 a1!699) (_3!1084 lt!415734)) (select (arr!7907 a2!699) (_3!1084 lt!415734)) lt!415732 lt!415733)))

(declare-fun b!278048 () Bool)

(declare-fun res!230920 () Bool)

(assert (=> b!278048 (=> (not res!230920) (not e!197939))))

(declare-fun arrayBitRangesEq!0 (array!15981 array!15981 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278048 (= res!230920 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278049 () Bool)

(assert (=> b!278049 (= e!197943 (bvsle (size!6911 a2!699) (size!6911 a1!699)))))

(declare-fun b!278050 () Bool)

(declare-fun res!230921 () Bool)

(assert (=> b!278050 (=> (not res!230921) (not e!197939))))

(assert (=> b!278050 (= res!230921 (bvslt from!822 to!789))))

(assert (= (and start!62060 res!230917) b!278048))

(assert (= (and b!278048 res!230920) b!278050))

(assert (= (and b!278050 res!230921) b!278044))

(assert (= (and b!278044 c!12735) b!278046))

(assert (= (and b!278044 (not c!12735)) b!278045))

(assert (= (and b!278044 res!230918) b!278047))

(assert (= (and b!278047 (not res!230919)) b!278049))

(declare-fun m!411149 () Bool)

(assert (=> b!278044 m!411149))

(declare-fun m!411151 () Bool)

(assert (=> b!278047 m!411151))

(declare-fun m!411153 () Bool)

(assert (=> b!278047 m!411153))

(assert (=> b!278047 m!411151))

(assert (=> b!278047 m!411153))

(declare-fun m!411155 () Bool)

(assert (=> b!278047 m!411155))

(assert (=> b!278047 m!411153))

(assert (=> b!278047 m!411151))

(declare-fun m!411157 () Bool)

(assert (=> b!278047 m!411157))

(declare-fun m!411159 () Bool)

(assert (=> start!62060 m!411159))

(declare-fun m!411161 () Bool)

(assert (=> start!62060 m!411161))

(declare-fun m!411163 () Bool)

(assert (=> b!278048 m!411163))

(declare-fun m!411165 () Bool)

(assert (=> b!278046 m!411165))

(declare-fun m!411167 () Bool)

(assert (=> b!278046 m!411167))

(declare-fun m!411169 () Bool)

(assert (=> b!278046 m!411169))

(check-sat (not start!62060) (not b!278046) (not b!278044) (not b!278048) (not b!278047))
(check-sat)
