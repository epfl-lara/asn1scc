; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70086 () Bool)

(assert start!70086)

(declare-fun res!259989 () Bool)

(declare-fun e!227772 () Bool)

(assert (=> start!70086 (=> (not res!259989) (not e!227772))))

(declare-datatypes ((array!19584 0))(
  ( (array!19585 (arr!9599 (Array (_ BitVec 32) (_ BitVec 8))) (size!8513 (_ BitVec 32))) )
))
(declare-fun a2!748 () array!19584)

(declare-fun from!855 () (_ BitVec 64))

(declare-fun to!822 () (_ BitVec 64))

(declare-fun a1!748 () array!19584)

(assert (=> start!70086 (= res!259989 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!855) (bvsle from!855 to!822) (= (size!8513 a1!748) (size!8513 a2!748)) (bvslt to!822 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8513 a1!748))))))))

(assert (=> start!70086 e!227772))

(assert (=> start!70086 true))

(declare-fun array_inv!8065 (array!19584) Bool)

(assert (=> start!70086 (array_inv!8065 a2!748)))

(assert (=> start!70086 (array_inv!8065 a1!748)))

(declare-fun b!316909 () Bool)

(declare-fun res!259991 () Bool)

(assert (=> b!316909 (=> (not res!259991) (not e!227772))))

(declare-fun arrayBitRangesEq!0 (array!19584 array!19584 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316909 (= res!259991 (arrayBitRangesEq!0 a1!748 a2!748 from!855 to!822))))

(declare-fun b!316910 () Bool)

(declare-fun res!259990 () Bool)

(assert (=> b!316910 (=> (not res!259990) (not e!227772))))

(declare-fun bitAt!0 (array!19584 (_ BitVec 64)) Bool)

(assert (=> b!316910 (= res!259990 (= (bitAt!0 a1!748 to!822) (bitAt!0 a2!748 to!822)))))

(declare-fun i!999 () (_ BitVec 64))

(declare-fun b!316911 () Bool)

(assert (=> b!316911 (= e!227772 (and (bvsle from!855 i!999) (bvsle i!999 to!822) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!999) (bvsgt i!999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!822)))))))

(assert (= (and start!70086 res!259989) b!316909))

(assert (= (and b!316909 res!259991) b!316910))

(assert (= (and b!316910 res!259990) b!316911))

(declare-fun m!454917 () Bool)

(assert (=> start!70086 m!454917))

(declare-fun m!454919 () Bool)

(assert (=> start!70086 m!454919))

(declare-fun m!454921 () Bool)

(assert (=> b!316909 m!454921))

(declare-fun m!454923 () Bool)

(assert (=> b!316910 m!454923))

(declare-fun m!454925 () Bool)

(assert (=> b!316910 m!454925))

(check-sat (not b!316909) (not b!316910) (not start!70086))
(check-sat)
