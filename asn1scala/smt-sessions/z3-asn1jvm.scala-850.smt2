; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24720 () Bool)

(assert start!24720)

(declare-fun b!125393 () Bool)

(declare-fun res!103851 () Bool)

(declare-fun e!82450 () Bool)

(assert (=> b!125393 (=> (not res!103851) (not e!82450))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196451 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun lt!196450 () (_ BitVec 64))

(assert (=> b!125393 (= res!103851 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196450 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196451)))))

(declare-fun b!125394 () Bool)

(declare-fun res!103848 () Bool)

(assert (=> b!125394 (=> (not res!103848) (not e!82450))))

(declare-datatypes ((array!5630 0))(
  ( (array!5631 (arr!3142 (Array (_ BitVec 32) (_ BitVec 8))) (size!2549 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5630)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5630)

(declare-fun arrayBitRangesEq!0 (array!5630 array!5630 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125394 (= res!103848 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125396 () Bool)

(assert (=> b!125396 (= e!82450 (bvsge (bvsub to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsub to!880 i!1051)))))

(declare-fun b!125397 () Bool)

(declare-fun e!82452 () Bool)

(declare-fun e!82454 () Bool)

(assert (=> b!125397 (= e!82452 e!82454)))

(declare-fun res!103849 () Bool)

(assert (=> b!125397 (=> (not res!103849) (not e!82454))))

(assert (=> b!125397 (= res!103849 (bvsle lt!196450 i!1051))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!125397 (= lt!196450 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125398 () Bool)

(declare-fun res!103850 () Bool)

(assert (=> b!125398 (=> (not res!103850) (not e!82450))))

(assert (=> b!125398 (= res!103850 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125399 () Bool)

(assert (=> b!125399 (= e!82454 e!82450)))

(declare-fun res!103846 () Bool)

(assert (=> b!125399 (=> (not res!103846) (not e!82450))))

(assert (=> b!125399 (= res!103846 (bvsle i!1051 lt!196451))))

(assert (=> b!125399 (= lt!196451 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun res!103852 () Bool)

(assert (=> start!24720 (=> (not res!103852) (not e!82452))))

(assert (=> start!24720 (= res!103852 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2549 a1!934) (size!2549 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2549 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24720 e!82452))

(declare-fun array_inv!2338 (array!5630) Bool)

(assert (=> start!24720 (array_inv!2338 a2!934)))

(assert (=> start!24720 true))

(assert (=> start!24720 (array_inv!2338 a1!934)))

(declare-fun b!125395 () Bool)

(declare-fun res!103847 () Bool)

(assert (=> b!125395 (=> (not res!103847) (not e!82452))))

(assert (=> b!125395 (= res!103847 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24720 res!103852) b!125395))

(assert (= (and b!125395 res!103847) b!125397))

(assert (= (and b!125397 res!103849) b!125399))

(assert (= (and b!125399 res!103846) b!125398))

(assert (= (and b!125398 res!103850) b!125393))

(assert (= (and b!125393 res!103851) b!125394))

(assert (= (and b!125394 res!103848) b!125396))

(declare-fun m!190795 () Bool)

(assert (=> b!125394 m!190795))

(declare-fun m!190797 () Bool)

(assert (=> b!125398 m!190797))

(declare-fun m!190799 () Bool)

(assert (=> start!24720 m!190799))

(declare-fun m!190801 () Bool)

(assert (=> start!24720 m!190801))

(declare-fun m!190803 () Bool)

(assert (=> b!125395 m!190803))

(check-sat (not b!125395) (not b!125394) (not start!24720) (not b!125398))
(check-sat)
