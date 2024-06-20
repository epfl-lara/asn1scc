; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24630 () Bool)

(assert start!24630)

(declare-datatypes ((array!5594 0))(
  ( (array!5595 (arr!3127 (Array (_ BitVec 32) (_ BitVec 8))) (size!2534 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5594)

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun e!82053 () Bool)

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun b!124931 () Bool)

(assert (=> b!124931 (= e!82053 (and (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (or (bvslt atByte!11 #b00000000000000000000000000000000) (bvsge atByte!11 (size!2534 a2!934)))))))

(declare-fun b!124928 () Bool)

(declare-fun res!103435 () Bool)

(assert (=> b!124928 (=> (not res!103435) (not e!82053))))

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5594)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5594 array!5594 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124928 (= res!103435 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124930 () Bool)

(declare-fun res!103438 () Bool)

(assert (=> b!124930 (=> (not res!103438) (not e!82053))))

(assert (=> b!124930 (= res!103438 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124929 () Bool)

(declare-fun res!103436 () Bool)

(assert (=> b!124929 (=> (not res!103436) (not e!82053))))

(assert (=> b!124929 (= res!103436 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun res!103437 () Bool)

(assert (=> start!24630 (=> (not res!103437) (not e!82053))))

(assert (=> start!24630 (= res!103437 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2534 a1!934) (size!2534 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2534 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24630 e!82053))

(declare-fun array_inv!2323 (array!5594) Bool)

(assert (=> start!24630 (array_inv!2323 a2!934)))

(assert (=> start!24630 true))

(assert (=> start!24630 (array_inv!2323 a1!934)))

(assert (= (and start!24630 res!103437) b!124928))

(assert (= (and b!124928 res!103435) b!124929))

(assert (= (and b!124929 res!103436) b!124930))

(assert (= (and b!124930 res!103438) b!124931))

(declare-fun m!190223 () Bool)

(assert (=> b!124928 m!190223))

(declare-fun m!190225 () Bool)

(assert (=> b!124930 m!190225))

(declare-fun m!190227 () Bool)

(assert (=> start!24630 m!190227))

(declare-fun m!190229 () Bool)

(assert (=> start!24630 m!190229))

(check-sat (not b!124928) (not b!124930) (not start!24630))
(check-sat)
