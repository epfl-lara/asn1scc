; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70092 () Bool)

(assert start!70092)

(declare-fun b!316946 () Bool)

(declare-fun res!260029 () Bool)

(declare-fun e!227800 () Bool)

(assert (=> b!316946 (=> (not res!260029) (not e!227800))))

(declare-datatypes ((array!19590 0))(
  ( (array!19591 (arr!9602 (Array (_ BitVec 32) (_ BitVec 8))) (size!8516 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19590)

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19590)

(declare-fun bitAt!0 (array!19590 (_ BitVec 64)) Bool)

(assert (=> b!316946 (= res!260029 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!316947 () Bool)

(declare-fun res!260028 () Bool)

(assert (=> b!316947 (=> (not res!260028) (not e!227800))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19590 array!19590 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316947 (= res!260028 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun res!260026 () Bool)

(assert (=> start!70092 (=> (not res!260026) (not e!227800))))

(assert (=> start!70092 (= res!260026 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8516 a1!748) (size!8516 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8516 a1!748))))))))

(assert (=> start!70092 e!227800))

(assert (=> start!70092 true))

(declare-fun array_inv!8068 (array!19590) Bool)

(assert (=> start!70092 (array_inv!8068 a2!748)))

(assert (=> start!70092 (array_inv!8068 a1!748)))

(declare-fun b!316948 () Bool)

(declare-fun res!260030 () Bool)

(assert (=> b!316948 (=> (not res!260030) (not e!227800))))

(declare-fun i!999 () (_ BitVec 64))

(assert (=> b!316948 (= res!260030 (bvsle i!999 to!822))))

(declare-fun b!316949 () Bool)

(assert (=> b!316949 (= e!227800 (and (= i!999 from!855) (bvsgt from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))))

(declare-fun b!316950 () Bool)

(declare-fun res!260027 () Bool)

(assert (=> b!316950 (=> (not res!260027) (not e!227800))))

(assert (=> b!316950 (= res!260027 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70092 res!260026) b!316947))

(assert (= (and b!316947 res!260028) b!316946))

(assert (= (and b!316946 res!260029) b!316948))

(assert (= (and b!316948 res!260030) b!316950))

(assert (= (and b!316950 res!260027) b!316949))

(declare-fun m!454949 () Bool)

(assert (=> b!316946 m!454949))

(declare-fun m!454951 () Bool)

(assert (=> b!316946 m!454951))

(declare-fun m!454953 () Bool)

(assert (=> b!316947 m!454953))

(declare-fun m!454955 () Bool)

(assert (=> start!70092 m!454955))

(declare-fun m!454957 () Bool)

(assert (=> start!70092 m!454957))

(declare-fun m!454959 () Bool)

(assert (=> b!316950 m!454959))

(check-sat (not start!70092) (not b!316950) (not b!316946) (not b!316947))
(check-sat)
