; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70360 () Bool)

(assert start!70360)

(declare-fun res!261808 () Bool)

(declare-fun e!228983 () Bool)

(assert (=> start!70360 (=> (not res!261808) (not e!228983))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19825 0))(
  ( (array!19826 (arr!9721 (Array (_ BitVec 32) (_ BitVec 8))) (size!8632 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19825)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19825)

(assert (=> start!70360 (= res!261808 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8632 a1!898) (size!8632 a2!898)) (bvsle to!864 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8632 a1!898)))) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> start!70360 e!228983))

(assert (=> start!70360 true))

(declare-fun array_inv!8184 (array!19825) Bool)

(assert (=> start!70360 (array_inv!8184 a1!898)))

(assert (=> start!70360 (array_inv!8184 a2!898)))

(declare-fun b!318751 () Bool)

(declare-fun res!261807 () Bool)

(assert (=> b!318751 (=> (not res!261807) (not e!228983))))

(declare-fun arrayBitRangesEq!0 (array!19825 array!19825 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318751 (= res!261807 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318752 () Bool)

(assert (=> b!318752 (= e!228983 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!296) (bvslt at!296 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8632 a2!898)))))))))

(declare-fun bitAt!0 (array!19825 (_ BitVec 64)) Bool)

(assert (=> b!318752 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21881 0))(
  ( (Unit!21882) )
))
(declare-fun lt!443450 () Unit!21881)

(declare-fun rec!22 (array!19825 array!19825 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21881)

(assert (=> b!318752 (= lt!443450 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70360 res!261808) b!318751))

(assert (= (and b!318751 res!261807) b!318752))

(declare-fun m!456971 () Bool)

(assert (=> start!70360 m!456971))

(declare-fun m!456973 () Bool)

(assert (=> start!70360 m!456973))

(declare-fun m!456975 () Bool)

(assert (=> b!318751 m!456975))

(declare-fun m!456977 () Bool)

(assert (=> b!318752 m!456977))

(declare-fun m!456979 () Bool)

(assert (=> b!318752 m!456979))

(declare-fun m!456981 () Bool)

(assert (=> b!318752 m!456981))

(push 1)

(assert (not b!318752))

(assert (not b!318751))

(assert (not start!70360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

