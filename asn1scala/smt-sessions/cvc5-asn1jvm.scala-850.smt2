; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24718 () Bool)

(assert start!24718)

(declare-fun b!125372 () Bool)

(declare-fun e!82439 () Bool)

(declare-fun e!82437 () Bool)

(assert (=> b!125372 (= e!82439 e!82437)))

(declare-fun res!103829 () Bool)

(assert (=> b!125372 (=> (not res!103829) (not e!82437))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196445 () (_ BitVec 64))

(assert (=> b!125372 (= res!103829 (bvsle i!1051 lt!196445))))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!125372 (= lt!196445 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125373 () Bool)

(declare-fun res!103825 () Bool)

(assert (=> b!125373 (=> (not res!103825) (not e!82437))))

(declare-datatypes ((array!5628 0))(
  ( (array!5629 (arr!3141 (Array (_ BitVec 32) (_ BitVec 8))) (size!2548 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5628)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5628)

(declare-fun arrayBitRangesEq!0 (array!5628 array!5628 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125373 (= res!103825 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125375 () Bool)

(declare-fun res!103831 () Bool)

(assert (=> b!125375 (=> (not res!103831) (not e!82437))))

(assert (=> b!125375 (= res!103831 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125376 () Bool)

(declare-fun res!103830 () Bool)

(declare-fun e!82435 () Bool)

(assert (=> b!125376 (=> (not res!103830) (not e!82435))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!125376 (= res!103830 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125377 () Bool)

(assert (=> b!125377 (= e!82435 e!82439)))

(declare-fun res!103828 () Bool)

(assert (=> b!125377 (=> (not res!103828) (not e!82439))))

(declare-fun lt!196444 () (_ BitVec 64))

(assert (=> b!125377 (= res!103828 (bvsle lt!196444 i!1051))))

(assert (=> b!125377 (= lt!196444 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125378 () Bool)

(declare-fun res!103826 () Bool)

(assert (=> b!125378 (=> (not res!103826) (not e!82437))))

(assert (=> b!125378 (= res!103826 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196444 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196445)))))

(declare-fun res!103827 () Bool)

(assert (=> start!24718 (=> (not res!103827) (not e!82435))))

(assert (=> start!24718 (= res!103827 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2548 a1!934) (size!2548 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2548 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24718 e!82435))

(declare-fun array_inv!2337 (array!5628) Bool)

(assert (=> start!24718 (array_inv!2337 a2!934)))

(assert (=> start!24718 true))

(assert (=> start!24718 (array_inv!2337 a1!934)))

(declare-fun b!125374 () Bool)

(assert (=> b!125374 (= e!82437 (bvsge (bvsub to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsub to!880 i!1051)))))

(assert (= (and start!24718 res!103827) b!125376))

(assert (= (and b!125376 res!103830) b!125377))

(assert (= (and b!125377 res!103828) b!125372))

(assert (= (and b!125372 res!103829) b!125373))

(assert (= (and b!125373 res!103825) b!125378))

(assert (= (and b!125378 res!103826) b!125375))

(assert (= (and b!125375 res!103831) b!125374))

(declare-fun m!190785 () Bool)

(assert (=> b!125373 m!190785))

(declare-fun m!190787 () Bool)

(assert (=> b!125375 m!190787))

(declare-fun m!190789 () Bool)

(assert (=> b!125376 m!190789))

(declare-fun m!190791 () Bool)

(assert (=> start!24718 m!190791))

(declare-fun m!190793 () Bool)

(assert (=> start!24718 m!190793))

(push 1)

(assert (not b!125376))

(assert (not b!125375))

(assert (not b!125373))

(assert (not start!24718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

