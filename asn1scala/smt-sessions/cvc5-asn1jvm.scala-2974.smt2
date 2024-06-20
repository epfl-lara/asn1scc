; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70078 () Bool)

(assert start!70078)

(declare-fun b!316869 () Bool)

(declare-fun e!227737 () Bool)

(assert (=> b!316869 (= e!227737 (not true))))

(declare-datatypes ((array!19576 0))(
  ( (array!19577 (arr!9595 (Array (_ BitVec 32) (_ BitVec 8))) (size!8509 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19576)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19576)

(declare-fun arrayBitRangesEq!0 (array!19576 array!19576 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316869 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21743 0))(
  ( (Unit!21744) )
))
(declare-fun lt!443063 () Unit!21743)

(declare-fun rec!18 (array!19576 array!19576 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21743)

(assert (=> b!316869 (= lt!443063 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun res!259949 () Bool)

(assert (=> start!70078 (=> (not res!259949) (not e!227737))))

(assert (=> start!70078 (= res!259949 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8509 a1!731) (size!8509 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8509 a1!731))))))))

(assert (=> start!70078 e!227737))

(assert (=> start!70078 true))

(declare-fun array_inv!8061 (array!19576) Bool)

(assert (=> start!70078 (array_inv!8061 a1!731)))

(assert (=> start!70078 (array_inv!8061 a2!731)))

(declare-fun b!316866 () Bool)

(declare-fun res!259946 () Bool)

(assert (=> b!316866 (=> (not res!259946) (not e!227737))))

(assert (=> b!316866 (= res!259946 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316867 () Bool)

(declare-fun res!259947 () Bool)

(assert (=> b!316867 (=> (not res!259947) (not e!227737))))

(declare-fun bitAt!0 (array!19576 (_ BitVec 64)) Bool)

(assert (=> b!316867 (= res!259947 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun b!316868 () Bool)

(declare-fun res!259948 () Bool)

(assert (=> b!316868 (=> (not res!259948) (not e!227737))))

(assert (=> b!316868 (= res!259948 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(assert (= (and start!70078 res!259949) b!316866))

(assert (= (and b!316866 res!259946) b!316867))

(assert (= (and b!316867 res!259947) b!316868))

(assert (= (and b!316868 res!259948) b!316869))

(declare-fun m!454859 () Bool)

(assert (=> start!70078 m!454859))

(declare-fun m!454861 () Bool)

(assert (=> start!70078 m!454861))

(declare-fun m!454863 () Bool)

(assert (=> b!316866 m!454863))

(declare-fun m!454865 () Bool)

(assert (=> b!316867 m!454865))

(declare-fun m!454867 () Bool)

(assert (=> b!316867 m!454867))

(declare-fun m!454869 () Bool)

(assert (=> b!316868 m!454869))

(declare-fun m!454871 () Bool)

(assert (=> b!316869 m!454871))

(declare-fun m!454873 () Bool)

(assert (=> b!316869 m!454873))

(push 1)

(assert (not b!316868))

(assert (not start!70078))

(assert (not b!316867))

(assert (not b!316869))

(assert (not b!316866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

