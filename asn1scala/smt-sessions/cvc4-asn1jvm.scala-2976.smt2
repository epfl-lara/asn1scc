; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70094 () Bool)

(assert start!70094)

(declare-fun i!999 () (_ BitVec 64))

(declare-fun from!855 () (_ BitVec 64))

(declare-fun b!316961 () Bool)

(declare-fun e!227809 () Bool)

(declare-fun to!822 () (_ BitVec 64))

(assert (=> b!316961 (= e!227809 (and (= i!999 from!855) (bvsgt from!855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822))))))

(declare-fun res!260041 () Bool)

(assert (=> start!70094 (=> (not res!260041) (not e!227809))))

(declare-datatypes ((array!19592 0))(
  ( (array!19593 (arr!9603 (Array (_ BitVec 32) (_ BitVec 8))) (size!8517 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19592)

(declare-fun a1!748 () array!19592)

(assert (=> start!70094 (= res!260041 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8517 a1!748) (size!8517 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8517 a1!748))))))))

(assert (=> start!70094 e!227809))

(assert (=> start!70094 true))

(declare-fun array_inv!8069 (array!19592) Bool)

(assert (=> start!70094 (array_inv!8069 a2!748)))

(assert (=> start!70094 (array_inv!8069 a1!748)))

(declare-fun b!316962 () Bool)

(declare-fun res!260045 () Bool)

(assert (=> b!316962 (=> (not res!260045) (not e!227809))))

(declare-fun bitAt!0 (array!19592 (_ BitVec 64)) Bool)

(assert (=> b!316962 (= res!260045 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun b!316963 () Bool)

(declare-fun res!260042 () Bool)

(assert (=> b!316963 (=> (not res!260042) (not e!227809))))

(declare-fun arrayBitRangesEq!0 (array!19592 array!19592 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316963 (= res!260042 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!316964 () Bool)

(declare-fun res!260043 () Bool)

(assert (=> b!316964 (=> (not res!260043) (not e!227809))))

(assert (=> b!316964 (= res!260043 (bvsle i!999 to!822))))

(declare-fun b!316965 () Bool)

(declare-fun res!260044 () Bool)

(assert (=> b!316965 (=> (not res!260044) (not e!227809))))

(assert (=> b!316965 (= res!260044 (arrayBitRangesEq!0 a1!748 a2!748 i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))

(assert (= (and start!70094 res!260041) b!316963))

(assert (= (and b!316963 res!260042) b!316962))

(assert (= (and b!316962 res!260045) b!316964))

(assert (= (and b!316964 res!260043) b!316965))

(assert (= (and b!316965 res!260044) b!316961))

(declare-fun m!454961 () Bool)

(assert (=> start!70094 m!454961))

(declare-fun m!454963 () Bool)

(assert (=> start!70094 m!454963))

(declare-fun m!454965 () Bool)

(assert (=> b!316962 m!454965))

(declare-fun m!454967 () Bool)

(assert (=> b!316962 m!454967))

(declare-fun m!454969 () Bool)

(assert (=> b!316963 m!454969))

(declare-fun m!454971 () Bool)

(assert (=> b!316965 m!454971))

(push 1)

(assert (not start!70094))

(assert (not b!316965))

(assert (not b!316962))

(assert (not b!316963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

