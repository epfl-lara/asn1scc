; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62062 () Bool)

(assert start!62062)

(declare-fun b!278065 () Bool)

(declare-fun e!197960 () Bool)

(declare-fun e!197961 () Bool)

(assert (=> b!278065 (= e!197960 e!197961)))

(declare-fun res!230933 () Bool)

(assert (=> b!278065 (=> (not res!230933) (not e!197961))))

(declare-datatypes ((tuple4!610 0))(
  ( (tuple4!611 (_1!12380 (_ BitVec 32)) (_2!12380 (_ BitVec 32)) (_3!1085 (_ BitVec 32)) (_4!305 (_ BitVec 32))) )
))
(declare-fun lt!415748 () tuple4!610)

(assert (=> b!278065 (= res!230933 (= (_3!1085 lt!415748) (_4!305 lt!415748)))))

(declare-datatypes ((Unit!19439 0))(
  ( (Unit!19440) )
))
(declare-fun lt!415749 () Unit!19439)

(declare-fun e!197958 () Unit!19439)

(assert (=> b!278065 (= lt!415749 e!197958)))

(declare-fun c!12738 () Bool)

(assert (=> b!278065 (= c!12738 (bvslt (_1!12380 lt!415748) (_2!12380 lt!415748)))))

(declare-fun lt!415745 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278065 (= lt!415745 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415747 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278065 (= lt!415747 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!610)

(assert (=> b!278065 (= lt!415748 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!278066 () Bool)

(declare-fun Unit!19441 () Unit!19439)

(assert (=> b!278066 (= e!197958 Unit!19441)))

(declare-fun res!230932 () Bool)

(assert (=> start!62062 (=> (not res!230932) (not e!197960))))

(declare-datatypes ((array!15983 0))(
  ( (array!15984 (arr!7908 (Array (_ BitVec 32) (_ BitVec 8))) (size!6912 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15983)

(declare-fun a2!699 () array!15983)

(assert (=> start!62062 (= res!230932 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6912 a1!699) (size!6912 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6912 a1!699))))))))

(assert (=> start!62062 e!197960))

(assert (=> start!62062 true))

(declare-fun array_inv!6636 (array!15983) Bool)

(assert (=> start!62062 (array_inv!6636 a1!699)))

(assert (=> start!62062 (array_inv!6636 a2!699)))

(declare-fun b!278067 () Bool)

(declare-fun Unit!19442 () Unit!19439)

(assert (=> b!278067 (= e!197958 Unit!19442)))

(declare-fun arrayRangesEq!1198 (array!15983 array!15983 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278067 (arrayRangesEq!1198 a1!699 a2!699 (_1!12380 lt!415748) (_2!12380 lt!415748))))

(declare-fun lt!415746 () Unit!19439)

(declare-fun arrayRangesEqSymmetricLemma!117 (array!15983 array!15983 (_ BitVec 32) (_ BitVec 32)) Unit!19439)

(assert (=> b!278067 (= lt!415746 (arrayRangesEqSymmetricLemma!117 a1!699 a2!699 (_1!12380 lt!415748) (_2!12380 lt!415748)))))

(assert (=> b!278067 (arrayRangesEq!1198 a2!699 a1!699 (_1!12380 lt!415748) (_2!12380 lt!415748))))

(declare-fun b!278068 () Bool)

(declare-fun e!197959 () Bool)

(assert (=> b!278068 (= e!197959 (bvsle (size!6912 a2!699) (size!6912 a1!699)))))

(declare-fun b!278069 () Bool)

(declare-fun res!230934 () Bool)

(assert (=> b!278069 (=> (not res!230934) (not e!197960))))

(assert (=> b!278069 (= res!230934 (bvslt from!822 to!789))))

(declare-fun b!278070 () Bool)

(declare-fun res!230936 () Bool)

(assert (=> b!278070 (=> (not res!230936) (not e!197960))))

(declare-fun arrayBitRangesEq!0 (array!15983 array!15983 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278070 (= res!230936 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278071 () Bool)

(assert (=> b!278071 (= e!197961 (not e!197959))))

(declare-fun res!230935 () Bool)

(assert (=> b!278071 (=> res!230935 e!197959)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278071 (= res!230935 (not (byteRangesEq!0 (select (arr!7908 a2!699) (_3!1085 lt!415748)) (select (arr!7908 a1!699) (_3!1085 lt!415748)) lt!415747 lt!415745)))))

(assert (=> b!278071 (byteRangesEq!0 (select (arr!7908 a1!699) (_3!1085 lt!415748)) (select (arr!7908 a2!699) (_3!1085 lt!415748)) lt!415747 lt!415745)))

(assert (= (and start!62062 res!230932) b!278070))

(assert (= (and b!278070 res!230936) b!278069))

(assert (= (and b!278069 res!230934) b!278065))

(assert (= (and b!278065 c!12738) b!278067))

(assert (= (and b!278065 (not c!12738)) b!278066))

(assert (= (and b!278065 res!230933) b!278071))

(assert (= (and b!278071 (not res!230935)) b!278068))

(declare-fun m!411171 () Bool)

(assert (=> start!62062 m!411171))

(declare-fun m!411173 () Bool)

(assert (=> start!62062 m!411173))

(declare-fun m!411175 () Bool)

(assert (=> b!278067 m!411175))

(declare-fun m!411177 () Bool)

(assert (=> b!278067 m!411177))

(declare-fun m!411179 () Bool)

(assert (=> b!278067 m!411179))

(declare-fun m!411181 () Bool)

(assert (=> b!278071 m!411181))

(declare-fun m!411183 () Bool)

(assert (=> b!278071 m!411183))

(assert (=> b!278071 m!411181))

(assert (=> b!278071 m!411183))

(declare-fun m!411185 () Bool)

(assert (=> b!278071 m!411185))

(assert (=> b!278071 m!411183))

(assert (=> b!278071 m!411181))

(declare-fun m!411187 () Bool)

(assert (=> b!278071 m!411187))

(declare-fun m!411189 () Bool)

(assert (=> b!278065 m!411189))

(declare-fun m!411191 () Bool)

(assert (=> b!278070 m!411191))

(push 1)

(assert (not b!278071))

(assert (not b!278065))

(assert (not b!278067))

(assert (not start!62062))

(assert (not b!278070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

