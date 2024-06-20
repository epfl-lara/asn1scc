; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24728 () Bool)

(assert start!24728)

(declare-fun b!125477 () Bool)

(declare-fun e!82513 () Bool)

(declare-fun e!82510 () Bool)

(assert (=> b!125477 (= e!82513 e!82510)))

(declare-fun res!103932 () Bool)

(assert (=> b!125477 (=> (not res!103932) (not e!82510))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196483 () (_ BitVec 64))

(assert (=> b!125477 (= res!103932 (bvsle i!1051 lt!196483))))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!125477 (= lt!196483 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125478 () Bool)

(declare-fun res!103931 () Bool)

(assert (=> b!125478 (=> (not res!103931) (not e!82510))))

(declare-datatypes ((array!5638 0))(
  ( (array!5639 (arr!3146 (Array (_ BitVec 32) (_ BitVec 8))) (size!2553 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5638)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5638)

(declare-fun arrayBitRangesEq!0 (array!5638 array!5638 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125478 (= res!103931 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125479 () Bool)

(declare-fun res!103933 () Bool)

(assert (=> b!125479 (=> (not res!103933) (not e!82510))))

(assert (=> b!125479 (= res!103933 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun res!103930 () Bool)

(declare-fun e!82512 () Bool)

(assert (=> start!24728 (=> (not res!103930) (not e!82512))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> start!24728 (= res!103930 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2553 a1!934) (size!2553 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2553 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24728 e!82512))

(declare-fun array_inv!2342 (array!5638) Bool)

(assert (=> start!24728 (array_inv!2342 a2!934)))

(assert (=> start!24728 true))

(assert (=> start!24728 (array_inv!2342 a1!934)))

(declare-fun b!125480 () Bool)

(declare-fun res!103935 () Bool)

(assert (=> b!125480 (=> (not res!103935) (not e!82512))))

(assert (=> b!125480 (= res!103935 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125481 () Bool)

(declare-fun res!103936 () Bool)

(assert (=> b!125481 (=> (not res!103936) (not e!82510))))

(declare-fun lt!196482 () (_ BitVec 64))

(assert (=> b!125481 (= res!103936 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196482 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196483)))))

(declare-fun b!125482 () Bool)

(assert (=> b!125482 (= e!82510 (not (and (bvsge atByte!11 #b00000000000000000000000000000000) (bvslt atByte!11 (size!2553 a1!934)))))))

(assert (=> b!125482 (= ((_ sign_extend 24) (select (arr!3146 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3146 a2!934) atByte!11)))))

(declare-datatypes ((Unit!7721 0))(
  ( (Unit!7722) )
))
(declare-fun lt!196484 () Unit!7721)

(declare-fun rec!23 (array!5638 array!5638 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7721)

(assert (=> b!125482 (= lt!196484 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(declare-fun b!125483 () Bool)

(assert (=> b!125483 (= e!82512 e!82513)))

(declare-fun res!103934 () Bool)

(assert (=> b!125483 (=> (not res!103934) (not e!82513))))

(assert (=> b!125483 (= res!103934 (bvsle lt!196482 i!1051))))

(assert (=> b!125483 (= lt!196482 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and start!24728 res!103930) b!125480))

(assert (= (and b!125480 res!103935) b!125483))

(assert (= (and b!125483 res!103934) b!125477))

(assert (= (and b!125477 res!103932) b!125479))

(assert (= (and b!125479 res!103933) b!125481))

(assert (= (and b!125481 res!103936) b!125478))

(assert (= (and b!125478 res!103931) b!125482))

(declare-fun m!190847 () Bool)

(assert (=> b!125480 m!190847))

(declare-fun m!190849 () Bool)

(assert (=> b!125479 m!190849))

(declare-fun m!190851 () Bool)

(assert (=> b!125478 m!190851))

(declare-fun m!190853 () Bool)

(assert (=> start!24728 m!190853))

(declare-fun m!190855 () Bool)

(assert (=> start!24728 m!190855))

(declare-fun m!190857 () Bool)

(assert (=> b!125482 m!190857))

(declare-fun m!190859 () Bool)

(assert (=> b!125482 m!190859))

(declare-fun m!190861 () Bool)

(assert (=> b!125482 m!190861))

(push 1)

(assert (not b!125482))

(assert (not start!24728))

(assert (not b!125479))

(assert (not b!125480))

(assert (not b!125478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

