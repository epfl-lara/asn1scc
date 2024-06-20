; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70358 () Bool)

(assert start!70358)

(declare-fun res!261800 () Bool)

(declare-fun e!228975 () Bool)

(assert (=> start!70358 (=> (not res!261800) (not e!228975))))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19823 0))(
  ( (array!19824 (arr!9720 (Array (_ BitVec 32) (_ BitVec 8))) (size!8631 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19823)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19823)

(assert (=> start!70358 (= res!261800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8631 a1!898) (size!8631 a2!898))))))

(assert (=> start!70358 e!228975))

(assert (=> start!70358 true))

(declare-fun array_inv!8183 (array!19823) Bool)

(assert (=> start!70358 (array_inv!8183 a1!898)))

(assert (=> start!70358 (array_inv!8183 a2!898)))

(declare-fun b!318744 () Bool)

(declare-fun e!228974 () Bool)

(assert (=> b!318744 (= e!228975 e!228974)))

(declare-fun res!261801 () Bool)

(assert (=> b!318744 (=> (not res!261801) (not e!228974))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun lt!443446 () (_ BitVec 64))

(assert (=> b!318744 (= res!261801 (and (bvsle to!864 lt!443446) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> b!318744 (= lt!443446 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8631 a1!898))))))

(declare-fun b!318745 () Bool)

(declare-fun res!261802 () Bool)

(assert (=> b!318745 (=> (not res!261802) (not e!228974))))

(declare-fun arrayBitRangesEq!0 (array!19823 array!19823 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318745 (= res!261802 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318746 () Bool)

(assert (=> b!318746 (= e!228974 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!296) (bvslt at!296 lt!443446))))))

(declare-fun bitAt!0 (array!19823 (_ BitVec 64)) Bool)

(assert (=> b!318746 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21879 0))(
  ( (Unit!21880) )
))
(declare-fun lt!443447 () Unit!21879)

(declare-fun rec!22 (array!19823 array!19823 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21879)

(assert (=> b!318746 (= lt!443447 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70358 res!261800) b!318744))

(assert (= (and b!318744 res!261801) b!318745))

(assert (= (and b!318745 res!261802) b!318746))

(declare-fun m!456959 () Bool)

(assert (=> start!70358 m!456959))

(declare-fun m!456961 () Bool)

(assert (=> start!70358 m!456961))

(declare-fun m!456963 () Bool)

(assert (=> b!318745 m!456963))

(declare-fun m!456965 () Bool)

(assert (=> b!318746 m!456965))

(declare-fun m!456967 () Bool)

(assert (=> b!318746 m!456967))

(declare-fun m!456969 () Bool)

(assert (=> b!318746 m!456969))

(push 1)

(assert (not start!70358))

(assert (not b!318746))

(assert (not b!318745))

(check-sat)

(pop 1)

(push 1)

(check-sat)

