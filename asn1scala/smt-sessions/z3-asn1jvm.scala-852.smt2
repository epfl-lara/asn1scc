; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24732 () Bool)

(assert start!24732)

(declare-fun b!125519 () Bool)

(declare-fun res!103977 () Bool)

(declare-fun e!82542 () Bool)

(assert (=> b!125519 (=> (not res!103977) (not e!82542))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196501 () (_ BitVec 64))

(declare-fun lt!196500 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!125519 (= res!103977 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196500 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196501)))))

(declare-fun b!125520 () Bool)

(declare-datatypes ((array!5642 0))(
  ( (array!5643 (arr!3148 (Array (_ BitVec 32) (_ BitVec 8))) (size!2555 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5642)

(assert (=> b!125520 (= e!82542 (not (and (bvsge atByte!11 #b00000000000000000000000000000000) (bvslt atByte!11 (size!2555 a2!934)))))))

(declare-fun a1!934 () array!5642)

(assert (=> b!125520 (= ((_ sign_extend 24) (select (arr!3148 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3148 a2!934) atByte!11)))))

(declare-datatypes ((Unit!7725 0))(
  ( (Unit!7726) )
))
(declare-fun lt!196502 () Unit!7725)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun from!913 () (_ BitVec 64))

(declare-fun rec!23 (array!5642 array!5642 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7725)

(assert (=> b!125520 (= lt!196502 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(declare-fun b!125521 () Bool)

(declare-fun res!103975 () Bool)

(assert (=> b!125521 (=> (not res!103975) (not e!82542))))

(declare-fun arrayBitRangesEq!0 (array!5642 array!5642 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125521 (= res!103975 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125522 () Bool)

(declare-fun res!103978 () Bool)

(declare-fun e!82540 () Bool)

(assert (=> b!125522 (=> (not res!103978) (not e!82540))))

(assert (=> b!125522 (= res!103978 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125523 () Bool)

(declare-fun res!103976 () Bool)

(assert (=> b!125523 (=> (not res!103976) (not e!82542))))

(assert (=> b!125523 (= res!103976 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun res!103973 () Bool)

(assert (=> start!24732 (=> (not res!103973) (not e!82540))))

(assert (=> start!24732 (= res!103973 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2555 a1!934) (size!2555 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2555 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24732 e!82540))

(declare-fun array_inv!2344 (array!5642) Bool)

(assert (=> start!24732 (array_inv!2344 a2!934)))

(assert (=> start!24732 true))

(assert (=> start!24732 (array_inv!2344 a1!934)))

(declare-fun b!125524 () Bool)

(declare-fun e!82544 () Bool)

(assert (=> b!125524 (= e!82544 e!82542)))

(declare-fun res!103972 () Bool)

(assert (=> b!125524 (=> (not res!103972) (not e!82542))))

(assert (=> b!125524 (= res!103972 (bvsle i!1051 lt!196501))))

(assert (=> b!125524 (= lt!196501 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125525 () Bool)

(assert (=> b!125525 (= e!82540 e!82544)))

(declare-fun res!103974 () Bool)

(assert (=> b!125525 (=> (not res!103974) (not e!82544))))

(assert (=> b!125525 (= res!103974 (bvsle lt!196500 i!1051))))

(assert (=> b!125525 (= lt!196500 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and start!24732 res!103973) b!125522))

(assert (= (and b!125522 res!103978) b!125525))

(assert (= (and b!125525 res!103974) b!125524))

(assert (= (and b!125524 res!103972) b!125523))

(assert (= (and b!125523 res!103976) b!125519))

(assert (= (and b!125519 res!103977) b!125521))

(assert (= (and b!125521 res!103975) b!125520))

(declare-fun m!190879 () Bool)

(assert (=> b!125522 m!190879))

(declare-fun m!190881 () Bool)

(assert (=> b!125523 m!190881))

(declare-fun m!190883 () Bool)

(assert (=> b!125521 m!190883))

(declare-fun m!190885 () Bool)

(assert (=> b!125520 m!190885))

(declare-fun m!190887 () Bool)

(assert (=> b!125520 m!190887))

(declare-fun m!190889 () Bool)

(assert (=> b!125520 m!190889))

(declare-fun m!190891 () Bool)

(assert (=> start!24732 m!190891))

(declare-fun m!190893 () Bool)

(assert (=> start!24732 m!190893))

(check-sat (not b!125521) (not start!24732) (not b!125520) (not b!125523) (not b!125522))
(check-sat)
