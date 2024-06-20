; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24722 () Bool)

(assert start!24722)

(declare-fun b!125415 () Bool)

(declare-fun e!82466 () Bool)

(declare-fun e!82468 () Bool)

(assert (=> b!125415 (= e!82466 e!82468)))

(declare-fun res!103873 () Bool)

(assert (=> b!125415 (=> (not res!103873) (not e!82468))))

(declare-fun lt!196456 () (_ BitVec 64))

(declare-fun i!1051 () (_ BitVec 64))

(assert (=> b!125415 (= res!103873 (bvsle lt!196456 i!1051))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!125415 (= lt!196456 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125416 () Bool)

(declare-fun e!82467 () Bool)

(declare-fun to!880 () (_ BitVec 64))

(assert (=> b!125416 (= e!82467 (bvsge (bvsub to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsub to!880 i!1051)))))

(declare-fun b!125417 () Bool)

(declare-fun res!103868 () Bool)

(assert (=> b!125417 (=> (not res!103868) (not e!82467))))

(declare-datatypes ((array!5632 0))(
  ( (array!5633 (arr!3143 (Array (_ BitVec 32) (_ BitVec 8))) (size!2550 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5632)

(declare-fun a1!934 () array!5632)

(declare-fun arrayBitRangesEq!0 (array!5632 array!5632 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125417 (= res!103868 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125418 () Bool)

(declare-fun res!103871 () Bool)

(assert (=> b!125418 (=> (not res!103871) (not e!82466))))

(assert (=> b!125418 (= res!103871 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125419 () Bool)

(declare-fun res!103870 () Bool)

(assert (=> b!125419 (=> (not res!103870) (not e!82467))))

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun lt!196457 () (_ BitVec 64))

(assert (=> b!125419 (= res!103870 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196456 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196457)))))

(declare-fun b!125420 () Bool)

(assert (=> b!125420 (= e!82468 e!82467)))

(declare-fun res!103867 () Bool)

(assert (=> b!125420 (=> (not res!103867) (not e!82467))))

(assert (=> b!125420 (= res!103867 (bvsle i!1051 lt!196457))))

(assert (=> b!125420 (= lt!196457 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125414 () Bool)

(declare-fun res!103869 () Bool)

(assert (=> b!125414 (=> (not res!103869) (not e!82467))))

(assert (=> b!125414 (= res!103869 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun res!103872 () Bool)

(assert (=> start!24722 (=> (not res!103872) (not e!82466))))

(assert (=> start!24722 (= res!103872 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2550 a1!934) (size!2550 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2550 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24722 e!82466))

(declare-fun array_inv!2339 (array!5632) Bool)

(assert (=> start!24722 (array_inv!2339 a2!934)))

(assert (=> start!24722 true))

(assert (=> start!24722 (array_inv!2339 a1!934)))

(assert (= (and start!24722 res!103872) b!125418))

(assert (= (and b!125418 res!103871) b!125415))

(assert (= (and b!125415 res!103873) b!125420))

(assert (= (and b!125420 res!103867) b!125414))

(assert (= (and b!125414 res!103869) b!125419))

(assert (= (and b!125419 res!103870) b!125417))

(assert (= (and b!125417 res!103868) b!125416))

(declare-fun m!190805 () Bool)

(assert (=> b!125417 m!190805))

(declare-fun m!190807 () Bool)

(assert (=> b!125418 m!190807))

(declare-fun m!190809 () Bool)

(assert (=> b!125414 m!190809))

(declare-fun m!190811 () Bool)

(assert (=> start!24722 m!190811))

(declare-fun m!190813 () Bool)

(assert (=> start!24722 m!190813))

(push 1)

(assert (not b!125418))

(assert (not b!125417))

(assert (not start!24722))

(assert (not b!125414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

