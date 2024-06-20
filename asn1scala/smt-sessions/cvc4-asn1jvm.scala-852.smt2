; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24734 () Bool)

(assert start!24734)

(declare-fun b!125540 () Bool)

(declare-fun res!103993 () Bool)

(declare-fun e!82557 () Bool)

(assert (=> b!125540 (=> (not res!103993) (not e!82557))))

(declare-datatypes ((array!5644 0))(
  ( (array!5645 (arr!3149 (Array (_ BitVec 32) (_ BitVec 8))) (size!2556 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5644)

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5644)

(declare-fun arrayBitRangesEq!0 (array!5644 array!5644 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125540 (= res!103993 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125541 () Bool)

(declare-fun e!82556 () Bool)

(assert (=> b!125541 (= e!82556 e!82557)))

(declare-fun res!103997 () Bool)

(assert (=> b!125541 (=> (not res!103997) (not e!82557))))

(declare-fun lt!196509 () (_ BitVec 64))

(assert (=> b!125541 (= res!103997 (bvsle i!1051 lt!196509))))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!125541 (= lt!196509 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125542 () Bool)

(declare-fun e!82555 () Bool)

(assert (=> b!125542 (= e!82555 e!82556)))

(declare-fun res!103995 () Bool)

(assert (=> b!125542 (=> (not res!103995) (not e!82556))))

(declare-fun lt!196511 () (_ BitVec 64))

(assert (=> b!125542 (= res!103995 (bvsle lt!196511 i!1051))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!125542 (= lt!196511 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125543 () Bool)

(declare-fun res!103994 () Bool)

(assert (=> b!125543 (=> (not res!103994) (not e!82555))))

(assert (=> b!125543 (= res!103994 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125544 () Bool)

(assert (=> b!125544 (= e!82557 (not (and (bvsge atByte!11 #b00000000000000000000000000000000) (bvslt atByte!11 (size!2556 a2!934)))))))

(assert (=> b!125544 (= ((_ sign_extend 24) (select (arr!3149 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3149 a2!934) atByte!11)))))

(declare-datatypes ((Unit!7727 0))(
  ( (Unit!7728) )
))
(declare-fun lt!196510 () Unit!7727)

(declare-fun rec!23 (array!5644 array!5644 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7727)

(assert (=> b!125544 (= lt!196510 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(declare-fun res!103998 () Bool)

(assert (=> start!24734 (=> (not res!103998) (not e!82555))))

(assert (=> start!24734 (= res!103998 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2556 a1!934) (size!2556 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2556 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24734 e!82555))

(declare-fun array_inv!2345 (array!5644) Bool)

(assert (=> start!24734 (array_inv!2345 a2!934)))

(assert (=> start!24734 true))

(assert (=> start!24734 (array_inv!2345 a1!934)))

(declare-fun b!125545 () Bool)

(declare-fun res!103996 () Bool)

(assert (=> b!125545 (=> (not res!103996) (not e!82557))))

(assert (=> b!125545 (= res!103996 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125546 () Bool)

(declare-fun res!103999 () Bool)

(assert (=> b!125546 (=> (not res!103999) (not e!82557))))

(assert (=> b!125546 (= res!103999 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196511 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196509)))))

(assert (= (and start!24734 res!103998) b!125543))

(assert (= (and b!125543 res!103994) b!125542))

(assert (= (and b!125542 res!103995) b!125541))

(assert (= (and b!125541 res!103997) b!125540))

(assert (= (and b!125540 res!103993) b!125546))

(assert (= (and b!125546 res!103999) b!125545))

(assert (= (and b!125545 res!103996) b!125544))

(declare-fun m!190895 () Bool)

(assert (=> b!125545 m!190895))

(declare-fun m!190897 () Bool)

(assert (=> b!125540 m!190897))

(declare-fun m!190899 () Bool)

(assert (=> start!24734 m!190899))

(declare-fun m!190901 () Bool)

(assert (=> start!24734 m!190901))

(declare-fun m!190903 () Bool)

(assert (=> b!125543 m!190903))

(declare-fun m!190905 () Bool)

(assert (=> b!125544 m!190905))

(declare-fun m!190907 () Bool)

(assert (=> b!125544 m!190907))

(declare-fun m!190909 () Bool)

(assert (=> b!125544 m!190909))

(push 1)

(assert (not b!125540))

(assert (not start!24734))

(assert (not b!125545))

(assert (not b!125544))

(assert (not b!125543))

(check-sat)

(pop 1)

(push 1)

(check-sat)

