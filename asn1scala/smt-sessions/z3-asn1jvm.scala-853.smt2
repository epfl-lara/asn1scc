; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24738 () Bool)

(assert start!24738)

(declare-fun b!125582 () Bool)

(declare-fun e!82587 () Bool)

(assert (=> b!125582 (= e!82587 (not true))))

(declare-datatypes ((array!5648 0))(
  ( (array!5649 (arr!3151 (Array (_ BitVec 32) (_ BitVec 8))) (size!2558 (_ BitVec 32))) )
))
(declare-fun a1!934 () array!5648)

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun a2!934 () array!5648)

(assert (=> b!125582 (= ((_ sign_extend 24) (select (arr!3151 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3151 a2!934) atByte!11)))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun to!880 () (_ BitVec 64))

(declare-fun from!913 () (_ BitVec 64))

(declare-datatypes ((Unit!7731 0))(
  ( (Unit!7732) )
))
(declare-fun lt!196527 () Unit!7731)

(declare-fun rec!23 (array!5648 array!5648 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7731)

(assert (=> b!125582 (= lt!196527 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(declare-fun b!125583 () Bool)

(declare-fun e!82585 () Bool)

(assert (=> b!125583 (= e!82585 e!82587)))

(declare-fun res!104036 () Bool)

(assert (=> b!125583 (=> (not res!104036) (not e!82587))))

(declare-fun lt!196528 () (_ BitVec 64))

(assert (=> b!125583 (= res!104036 (bvsle i!1051 lt!196528))))

(assert (=> b!125583 (= lt!196528 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun res!104040 () Bool)

(declare-fun e!82588 () Bool)

(assert (=> start!24738 (=> (not res!104040) (not e!82588))))

(assert (=> start!24738 (= res!104040 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2558 a1!934) (size!2558 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2558 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24738 e!82588))

(declare-fun array_inv!2347 (array!5648) Bool)

(assert (=> start!24738 (array_inv!2347 a2!934)))

(assert (=> start!24738 true))

(assert (=> start!24738 (array_inv!2347 a1!934)))

(declare-fun b!125584 () Bool)

(assert (=> b!125584 (= e!82588 e!82585)))

(declare-fun res!104041 () Bool)

(assert (=> b!125584 (=> (not res!104041) (not e!82585))))

(declare-fun lt!196529 () (_ BitVec 64))

(assert (=> b!125584 (= res!104041 (bvsle lt!196529 i!1051))))

(assert (=> b!125584 (= lt!196529 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125585 () Bool)

(declare-fun res!104035 () Bool)

(assert (=> b!125585 (=> (not res!104035) (not e!82587))))

(declare-fun arrayBitRangesEq!0 (array!5648 array!5648 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125585 (= res!104035 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125586 () Bool)

(declare-fun res!104038 () Bool)

(assert (=> b!125586 (=> (not res!104038) (not e!82587))))

(assert (=> b!125586 (= res!104038 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125587 () Bool)

(declare-fun res!104037 () Bool)

(assert (=> b!125587 (=> (not res!104037) (not e!82587))))

(assert (=> b!125587 (= res!104037 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196529 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196528)))))

(declare-fun b!125588 () Bool)

(declare-fun res!104039 () Bool)

(assert (=> b!125588 (=> (not res!104039) (not e!82588))))

(assert (=> b!125588 (= res!104039 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24738 res!104040) b!125588))

(assert (= (and b!125588 res!104039) b!125584))

(assert (= (and b!125584 res!104041) b!125583))

(assert (= (and b!125583 res!104036) b!125586))

(assert (= (and b!125586 res!104038) b!125587))

(assert (= (and b!125587 res!104037) b!125585))

(assert (= (and b!125585 res!104035) b!125582))

(declare-fun m!190927 () Bool)

(assert (=> start!24738 m!190927))

(declare-fun m!190929 () Bool)

(assert (=> start!24738 m!190929))

(declare-fun m!190931 () Bool)

(assert (=> b!125582 m!190931))

(declare-fun m!190933 () Bool)

(assert (=> b!125582 m!190933))

(declare-fun m!190935 () Bool)

(assert (=> b!125582 m!190935))

(declare-fun m!190937 () Bool)

(assert (=> b!125586 m!190937))

(declare-fun m!190939 () Bool)

(assert (=> b!125585 m!190939))

(declare-fun m!190941 () Bool)

(assert (=> b!125588 m!190941))

(check-sat (not b!125586) (not b!125588) (not start!24738) (not b!125585) (not b!125582))
