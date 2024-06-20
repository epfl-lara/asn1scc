; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24724 () Bool)

(assert start!24724)

(declare-fun b!125435 () Bool)

(declare-fun e!82482 () Bool)

(declare-fun e!82483 () Bool)

(assert (=> b!125435 (= e!82482 e!82483)))

(declare-fun res!103893 () Bool)

(assert (=> b!125435 (=> (not res!103893) (not e!82483))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196464 () (_ BitVec 64))

(assert (=> b!125435 (= res!103893 (bvsle i!1051 lt!196464))))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!125435 (= lt!196464 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125436 () Bool)

(declare-fun e!82481 () Bool)

(assert (=> b!125436 (= e!82481 e!82482)))

(declare-fun res!103891 () Bool)

(assert (=> b!125436 (=> (not res!103891) (not e!82482))))

(declare-fun lt!196466 () (_ BitVec 64))

(assert (=> b!125436 (= res!103891 (bvsle lt!196466 i!1051))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!125436 (= lt!196466 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125437 () Bool)

(declare-fun res!103894 () Bool)

(assert (=> b!125437 (=> (not res!103894) (not e!82483))))

(declare-datatypes ((array!5634 0))(
  ( (array!5635 (arr!3144 (Array (_ BitVec 32) (_ BitVec 8))) (size!2551 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5634)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5634)

(declare-fun arrayBitRangesEq!0 (array!5634 array!5634 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125437 (= res!103894 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125438 () Bool)

(declare-fun res!103892 () Bool)

(assert (=> b!125438 (=> (not res!103892) (not e!82483))))

(assert (=> b!125438 (= res!103892 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196466 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196464)))))

(declare-fun b!125439 () Bool)

(declare-fun res!103889 () Bool)

(assert (=> b!125439 (=> (not res!103889) (not e!82483))))

(assert (=> b!125439 (= res!103889 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125441 () Bool)

(assert (=> b!125441 (= e!82483 (not (and (bvsge atByte!11 #b00000000000000000000000000000000) (bvslt atByte!11 (size!2551 a1!934)))))))

(assert (=> b!125441 (= ((_ sign_extend 24) (select (arr!3144 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3144 a2!934) atByte!11)))))

(declare-datatypes ((Unit!7717 0))(
  ( (Unit!7718) )
))
(declare-fun lt!196465 () Unit!7717)

(declare-fun rec!23 (array!5634 array!5634 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7717)

(assert (=> b!125441 (= lt!196465 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(declare-fun res!103890 () Bool)

(assert (=> start!24724 (=> (not res!103890) (not e!82481))))

(assert (=> start!24724 (= res!103890 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2551 a1!934) (size!2551 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2551 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24724 e!82481))

(declare-fun array_inv!2340 (array!5634) Bool)

(assert (=> start!24724 (array_inv!2340 a2!934)))

(assert (=> start!24724 true))

(assert (=> start!24724 (array_inv!2340 a1!934)))

(declare-fun b!125440 () Bool)

(declare-fun res!103888 () Bool)

(assert (=> b!125440 (=> (not res!103888) (not e!82481))))

(assert (=> b!125440 (= res!103888 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24724 res!103890) b!125440))

(assert (= (and b!125440 res!103888) b!125436))

(assert (= (and b!125436 res!103891) b!125435))

(assert (= (and b!125435 res!103893) b!125439))

(assert (= (and b!125439 res!103889) b!125438))

(assert (= (and b!125438 res!103892) b!125437))

(assert (= (and b!125437 res!103894) b!125441))

(declare-fun m!190815 () Bool)

(assert (=> b!125437 m!190815))

(declare-fun m!190817 () Bool)

(assert (=> b!125440 m!190817))

(declare-fun m!190819 () Bool)

(assert (=> start!24724 m!190819))

(declare-fun m!190821 () Bool)

(assert (=> start!24724 m!190821))

(declare-fun m!190823 () Bool)

(assert (=> b!125439 m!190823))

(declare-fun m!190825 () Bool)

(assert (=> b!125441 m!190825))

(declare-fun m!190827 () Bool)

(assert (=> b!125441 m!190827))

(declare-fun m!190829 () Bool)

(assert (=> b!125441 m!190829))

(push 1)

(assert (not b!125439))

(assert (not b!125441))

(assert (not start!24724))

(assert (not b!125437))

(assert (not b!125440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

