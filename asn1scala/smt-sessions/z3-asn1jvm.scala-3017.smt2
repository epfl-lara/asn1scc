; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70374 () Bool)

(assert start!70374)

(declare-fun res!261832 () Bool)

(declare-fun e!229036 () Bool)

(assert (=> start!70374 (=> (not res!261832) (not e!229036))))

(declare-fun at!296 () (_ BitVec 64))

(declare-fun to!864 () (_ BitVec 64))

(declare-datatypes ((array!19839 0))(
  ( (array!19840 (arr!9728 (Array (_ BitVec 32) (_ BitVec 8))) (size!8639 (_ BitVec 32))) )
))
(declare-fun a1!898 () array!19839)

(declare-fun from!897 () (_ BitVec 64))

(declare-fun a2!898 () array!19839)

(assert (=> start!70374 (= res!261832 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!897) (bvsle from!897 to!864) (= (size!8639 a1!898) (size!8639 a2!898)) (bvsle to!864 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8639 a1!898)))) (bvsle from!897 at!296) (bvslt at!296 to!864)))))

(assert (=> start!70374 e!229036))

(assert (=> start!70374 true))

(declare-fun array_inv!8191 (array!19839) Bool)

(assert (=> start!70374 (array_inv!8191 a1!898)))

(assert (=> start!70374 (array_inv!8191 a2!898)))

(declare-fun b!318775 () Bool)

(declare-fun res!261831 () Bool)

(assert (=> b!318775 (=> (not res!261831) (not e!229036))))

(declare-fun arrayBitRangesEq!0 (array!19839 array!19839 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318775 (= res!261831 (arrayBitRangesEq!0 a1!898 a2!898 from!897 to!864))))

(declare-fun b!318776 () Bool)

(assert (=> b!318776 (= e!229036 (not true))))

(declare-fun bitAt!0 (array!19839 (_ BitVec 64)) Bool)

(assert (=> b!318776 (= (bitAt!0 a1!898 at!296) (bitAt!0 a2!898 at!296))))

(declare-datatypes ((Unit!21889 0))(
  ( (Unit!21890) )
))
(declare-fun lt!443462 () Unit!21889)

(declare-fun rec!22 (array!19839 array!19839 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21889)

(assert (=> b!318776 (= lt!443462 (rec!22 a1!898 a2!898 at!296 from!897 to!864 from!897))))

(assert (= (and start!70374 res!261832) b!318775))

(assert (= (and b!318775 res!261831) b!318776))

(declare-fun m!457031 () Bool)

(assert (=> start!70374 m!457031))

(declare-fun m!457033 () Bool)

(assert (=> start!70374 m!457033))

(declare-fun m!457035 () Bool)

(assert (=> b!318775 m!457035))

(declare-fun m!457037 () Bool)

(assert (=> b!318776 m!457037))

(declare-fun m!457039 () Bool)

(assert (=> b!318776 m!457039))

(declare-fun m!457041 () Bool)

(assert (=> b!318776 m!457041))

(check-sat (not b!318776) (not start!70374) (not b!318775))
