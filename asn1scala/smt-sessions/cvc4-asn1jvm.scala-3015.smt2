; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70364 () Bool)

(assert start!70364)

(declare-fun res!261819 () Bool)

(declare-fun e!229001 () Bool)

(assert (=> start!70364 (=> (not res!261819) (not e!229001))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19829 0))(
  ( (array!19830 (arr!9723 (Array (_ BitVec 32) (_ BitVec 8))) (size!8634 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19829)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19829)

(assert (=> start!70364 (= res!261819 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8634 a1!898) (size!8634 a2!898)) (bvsle to!864 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8634 a1!898)))) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> start!70364 e!229001))

(assert (=> start!70364 true))

(declare-fun array_inv!8186 (array!19829) Bool)

(assert (=> start!70364 (array_inv!8186 a1!898)))

(assert (=> start!70364 (array_inv!8186 a2!898)))

(declare-fun b!318763 () Bool)

(declare-fun res!261820 () Bool)

(assert (=> b!318763 (=> (not res!261820) (not e!229001))))

(declare-fun arrayBitRangesEq!0 (array!19829 array!19829 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318763 (= res!261820 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318764 () Bool)

(assert (=> b!318764 (= e!229001 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!296) (bvslt at!296 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8634 a2!898)))))))))

(declare-fun bitAt!0 (array!19829 (_ BitVec 64)) Bool)

(assert (=> b!318764 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21885 0))(
  ( (Unit!21886) )
))
(declare-fun lt!443456 () Unit!21885)

(declare-fun rec!22 (array!19829 array!19829 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21885)

(assert (=> b!318764 (= lt!443456 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70364 res!261819) b!318763))

(assert (= (and b!318763 res!261820) b!318764))

(declare-fun m!456995 () Bool)

(assert (=> start!70364 m!456995))

(declare-fun m!456997 () Bool)

(assert (=> start!70364 m!456997))

(declare-fun m!456999 () Bool)

(assert (=> b!318763 m!456999))

(declare-fun m!457001 () Bool)

(assert (=> b!318764 m!457001))

(declare-fun m!457003 () Bool)

(assert (=> b!318764 m!457003))

(declare-fun m!457005 () Bool)

(assert (=> b!318764 m!457005))

(push 1)

(assert (not b!318764))

(assert (not b!318763))

(assert (not start!70364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

