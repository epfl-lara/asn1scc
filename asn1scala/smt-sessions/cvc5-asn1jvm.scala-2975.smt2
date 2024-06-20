; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70084 () Bool)

(assert start!70084)

(declare-fun res!259982 () Bool)

(declare-fun e!227764 () Bool)

(assert (=> start!70084 (=> (not res!259982) (not e!227764))))

(declare-datatypes ((array!19582 0))(
  ( (array!19583 (arr!9598 (Array (_ BitVec 32) (_ BitVec 8))) (size!8512 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19582)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19582)

(assert (=> start!70084 (= res!259982 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8512 a1!748) (size!8512 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8512 a1!748))))))))

(assert (=> start!70084 e!227764))

(assert (=> start!70084 true))

(declare-fun array_inv!8064 (array!19582) Bool)

(assert (=> start!70084 (array_inv!8064 a2!748)))

(assert (=> start!70084 (array_inv!8064 a1!748)))

(declare-fun b!316900 () Bool)

(declare-fun res!259981 () Bool)

(assert (=> b!316900 (=> (not res!259981) (not e!227764))))

(declare-fun arrayBitRangesEq!0 (array!19582 array!19582 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316900 (= res!259981 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!316901 () Bool)

(declare-fun res!259980 () Bool)

(assert (=> b!316901 (=> (not res!259980) (not e!227764))))

(declare-fun bitAt!0 (array!19582 (_ BitVec 64)) Bool)

(assert (=> b!316901 (= res!259980 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun b!316902 () Bool)

(assert (=> b!316902 (= e!227764 (and (bvsle from!855 i!999) (bvsle i!999 to!822) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!999) (bvsgt i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))))

(assert (= (and start!70084 res!259982) b!316900))

(assert (= (and b!316900 res!259981) b!316901))

(assert (= (and b!316901 res!259980) b!316902))

(declare-fun m!454907 () Bool)

(assert (=> start!70084 m!454907))

(declare-fun m!454909 () Bool)

(assert (=> start!70084 m!454909))

(declare-fun m!454911 () Bool)

(assert (=> b!316900 m!454911))

(declare-fun m!454913 () Bool)

(assert (=> b!316901 m!454913))

(declare-fun m!454915 () Bool)

(assert (=> b!316901 m!454915))

(push 1)

(assert (not b!316900))

(assert (not b!316901))

(assert (not start!70084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

