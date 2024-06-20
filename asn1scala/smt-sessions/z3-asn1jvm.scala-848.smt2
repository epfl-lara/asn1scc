; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24678 () Bool)

(assert start!24678)

(declare-fun b!125149 () Bool)

(declare-fun res!103633 () Bool)

(declare-fun e!82243 () Bool)

(assert (=> b!125149 (=> (not res!103633) (not e!82243))))

(declare-datatypes ((array!5615 0))(
  ( (array!5616 (arr!3136 (Array (_ BitVec 32) (_ BitVec 8))) (size!2543 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5615)

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5615)

(declare-fun arrayBitRangesEq!0 (array!5615 array!5615 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125149 (= res!103633 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125150 () Bool)

(declare-fun e!82241 () Bool)

(declare-fun e!82244 () Bool)

(assert (=> b!125150 (= e!82241 e!82244)))

(declare-fun res!103636 () Bool)

(assert (=> b!125150 (=> (not res!103636) (not e!82244))))

(declare-fun lt!196369 () (_ BitVec 64))

(assert (=> b!125150 (= res!103636 (bvsle lt!196369 i!1051))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!125150 (= lt!196369 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!196370 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun b!125151 () Bool)

(assert (=> b!125151 (= e!82243 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (or (bvsgt lt!196369 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196370))))))

(declare-fun res!103634 () Bool)

(assert (=> start!24678 (=> (not res!103634) (not e!82241))))

(assert (=> start!24678 (= res!103634 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2543 a1!934) (size!2543 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2543 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24678 e!82241))

(declare-fun array_inv!2332 (array!5615) Bool)

(assert (=> start!24678 (array_inv!2332 a2!934)))

(assert (=> start!24678 true))

(assert (=> start!24678 (array_inv!2332 a1!934)))

(declare-fun b!125152 () Bool)

(assert (=> b!125152 (= e!82244 e!82243)))

(declare-fun res!103635 () Bool)

(assert (=> b!125152 (=> (not res!103635) (not e!82243))))

(assert (=> b!125152 (= res!103635 (bvsle i!1051 lt!196370))))

(assert (=> b!125152 (= lt!196370 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125153 () Bool)

(declare-fun res!103632 () Bool)

(assert (=> b!125153 (=> (not res!103632) (not e!82241))))

(assert (=> b!125153 (= res!103632 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24678 res!103634) b!125153))

(assert (= (and b!125153 res!103632) b!125150))

(assert (= (and b!125150 res!103636) b!125152))

(assert (= (and b!125152 res!103635) b!125149))

(assert (= (and b!125149 res!103633) b!125151))

(declare-fun m!190481 () Bool)

(assert (=> b!125149 m!190481))

(declare-fun m!190483 () Bool)

(assert (=> start!24678 m!190483))

(declare-fun m!190485 () Bool)

(assert (=> start!24678 m!190485))

(declare-fun m!190487 () Bool)

(assert (=> b!125153 m!190487))

(check-sat (not b!125149) (not b!125153) (not start!24678))
(check-sat)
