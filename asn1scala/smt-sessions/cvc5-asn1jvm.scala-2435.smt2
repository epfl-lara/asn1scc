; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62058 () Bool)

(assert start!62058)

(declare-fun b!278023 () Bool)

(declare-fun e!197921 () Bool)

(declare-datatypes ((array!15979 0))(
  ( (array!15980 (arr!7906 (Array (_ BitVec 32) (_ BitVec 8))) (size!6910 (_ BitVec 32))) )
))
(declare-fun a2!699 () array!15979)

(declare-fun a1!699 () array!15979)

(assert (=> b!278023 (= e!197921 (bvsle (size!6910 a2!699) (size!6910 a1!699)))))

(declare-fun b!278024 () Bool)

(declare-fun e!197922 () Bool)

(declare-fun e!197920 () Bool)

(assert (=> b!278024 (= e!197922 e!197920)))

(declare-fun res!230903 () Bool)

(assert (=> b!278024 (=> (not res!230903) (not e!197920))))

(declare-datatypes ((tuple4!606 0))(
  ( (tuple4!607 (_1!12378 (_ BitVec 32)) (_2!12378 (_ BitVec 32)) (_3!1083 (_ BitVec 32)) (_4!303 (_ BitVec 32))) )
))
(declare-fun lt!415717 () tuple4!606)

(assert (=> b!278024 (= res!230903 (= (_3!1083 lt!415717) (_4!303 lt!415717)))))

(declare-datatypes ((Unit!19431 0))(
  ( (Unit!19432) )
))
(declare-fun lt!415719 () Unit!19431)

(declare-fun e!197924 () Unit!19431)

(assert (=> b!278024 (= lt!415719 e!197924)))

(declare-fun c!12732 () Bool)

(assert (=> b!278024 (= c!12732 (bvslt (_1!12378 lt!415717) (_2!12378 lt!415717)))))

(declare-fun lt!415715 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!278024 (= lt!415715 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415718 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!278024 (= lt!415718 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!606)

(assert (=> b!278024 (= lt!415717 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!230902 () Bool)

(assert (=> start!62058 (=> (not res!230902) (not e!197922))))

(assert (=> start!62058 (= res!230902 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6910 a1!699) (size!6910 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6910 a1!699))))))))

(assert (=> start!62058 e!197922))

(assert (=> start!62058 true))

(declare-fun array_inv!6634 (array!15979) Bool)

(assert (=> start!62058 (array_inv!6634 a1!699)))

(assert (=> start!62058 (array_inv!6634 a2!699)))

(declare-fun b!278025 () Bool)

(declare-fun res!230905 () Bool)

(assert (=> b!278025 (=> (not res!230905) (not e!197922))))

(assert (=> b!278025 (= res!230905 (bvslt from!822 to!789))))

(declare-fun b!278026 () Bool)

(declare-fun res!230904 () Bool)

(assert (=> b!278026 (=> (not res!230904) (not e!197922))))

(declare-fun arrayBitRangesEq!0 (array!15979 array!15979 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278026 (= res!230904 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278027 () Bool)

(assert (=> b!278027 (= e!197920 (not e!197921))))

(declare-fun res!230906 () Bool)

(assert (=> b!278027 (=> res!230906 e!197921)))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278027 (= res!230906 (not (byteRangesEq!0 (select (arr!7906 a2!699) (_3!1083 lt!415717)) (select (arr!7906 a1!699) (_3!1083 lt!415717)) lt!415718 lt!415715)))))

(assert (=> b!278027 (byteRangesEq!0 (select (arr!7906 a1!699) (_3!1083 lt!415717)) (select (arr!7906 a2!699) (_3!1083 lt!415717)) lt!415718 lt!415715)))

(declare-fun b!278028 () Bool)

(declare-fun Unit!19433 () Unit!19431)

(assert (=> b!278028 (= e!197924 Unit!19433)))

(declare-fun arrayRangesEq!1196 (array!15979 array!15979 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!278028 (arrayRangesEq!1196 a1!699 a2!699 (_1!12378 lt!415717) (_2!12378 lt!415717))))

(declare-fun lt!415716 () Unit!19431)

(declare-fun arrayRangesEqSymmetricLemma!115 (array!15979 array!15979 (_ BitVec 32) (_ BitVec 32)) Unit!19431)

(assert (=> b!278028 (= lt!415716 (arrayRangesEqSymmetricLemma!115 a1!699 a2!699 (_1!12378 lt!415717) (_2!12378 lt!415717)))))

(assert (=> b!278028 (arrayRangesEq!1196 a2!699 a1!699 (_1!12378 lt!415717) (_2!12378 lt!415717))))

(declare-fun b!278029 () Bool)

(declare-fun Unit!19434 () Unit!19431)

(assert (=> b!278029 (= e!197924 Unit!19434)))

(assert (= (and start!62058 res!230902) b!278026))

(assert (= (and b!278026 res!230904) b!278025))

(assert (= (and b!278025 res!230905) b!278024))

(assert (= (and b!278024 c!12732) b!278028))

(assert (= (and b!278024 (not c!12732)) b!278029))

(assert (= (and b!278024 res!230903) b!278027))

(assert (= (and b!278027 (not res!230906)) b!278023))

(declare-fun m!411127 () Bool)

(assert (=> b!278024 m!411127))

(declare-fun m!411129 () Bool)

(assert (=> start!62058 m!411129))

(declare-fun m!411131 () Bool)

(assert (=> start!62058 m!411131))

(declare-fun m!411133 () Bool)

(assert (=> b!278028 m!411133))

(declare-fun m!411135 () Bool)

(assert (=> b!278028 m!411135))

(declare-fun m!411137 () Bool)

(assert (=> b!278028 m!411137))

(declare-fun m!411139 () Bool)

(assert (=> b!278026 m!411139))

(declare-fun m!411141 () Bool)

(assert (=> b!278027 m!411141))

(declare-fun m!411143 () Bool)

(assert (=> b!278027 m!411143))

(assert (=> b!278027 m!411141))

(assert (=> b!278027 m!411143))

(declare-fun m!411145 () Bool)

(assert (=> b!278027 m!411145))

(assert (=> b!278027 m!411143))

(assert (=> b!278027 m!411141))

(declare-fun m!411147 () Bool)

(assert (=> b!278027 m!411147))

(push 1)

(assert (not b!278027))

(assert (not b!278028))

(assert (not b!278024))

(assert (not b!278026))

(assert (not start!62058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

