; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70090 () Bool)

(assert start!70090)

(declare-fun res!260012 () Bool)

(declare-fun e!227790 () Bool)

(assert (=> start!70090 (=> (not res!260012) (not e!227790))))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-datatypes ((array!19588 0))(
  ( (array!19589 (arr!9601 (Array (_ BitVec 32) (_ BitVec 8))) (size!8515 (_ BitVec 32))) )
))
(declare-fun a1!748 () array!19588)

(declare-fun a2!748 () array!19588)

(assert (=> start!70090 (= res!260012 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8515 a1!748) (size!8515 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8515 a1!748))))))))

(assert (=> start!70090 e!227790))

(assert (=> start!70090 true))

(declare-fun array_inv!8067 (array!19588) Bool)

(assert (=> start!70090 (array_inv!8067 a2!748)))

(assert (=> start!70090 (array_inv!8067 a1!748)))

(declare-fun b!316931 () Bool)

(declare-fun res!260014 () Bool)

(assert (=> b!316931 (=> (not res!260014) (not e!227790))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19588 array!19588 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316931 (= res!260014 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(declare-fun b!316932 () Bool)

(declare-fun res!260015 () Bool)

(assert (=> b!316932 (=> (not res!260015) (not e!227790))))

(declare-fun bitAt!0 (array!19588 (_ BitVec 64)) Bool)

(assert (=> b!316932 (= res!260015 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!316933 () Bool)

(declare-fun res!260013 () Bool)

(assert (=> b!316933 (=> (not res!260013) (not e!227790))))

(assert (=> b!316933 (= res!260013 (bvsle i!999 to!822))))

(declare-fun b!316934 () Bool)

(assert (=> b!316934 (= e!227790 (and (= i!999 from!855) (bvsgt from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))))

(declare-fun b!316935 () Bool)

(declare-fun res!260011 () Bool)

(assert (=> b!316935 (=> (not res!260011) (not e!227790))))

(assert (=> b!316935 (= res!260011 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(assert (= (and start!70090 res!260012) b!316935))

(assert (= (and b!316935 res!260011) b!316932))

(assert (= (and b!316932 res!260015) b!316933))

(assert (= (and b!316933 res!260013) b!316931))

(assert (= (and b!316931 res!260014) b!316934))

(declare-fun m!454937 () Bool)

(assert (=> start!70090 m!454937))

(declare-fun m!454939 () Bool)

(assert (=> start!70090 m!454939))

(declare-fun m!454941 () Bool)

(assert (=> b!316931 m!454941))

(declare-fun m!454943 () Bool)

(assert (=> b!316932 m!454943))

(declare-fun m!454945 () Bool)

(assert (=> b!316932 m!454945))

(declare-fun m!454947 () Bool)

(assert (=> b!316935 m!454947))

(push 1)

(assert (not b!316932))

(assert (not start!70090))

(assert (not b!316935))

(assert (not b!316931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

