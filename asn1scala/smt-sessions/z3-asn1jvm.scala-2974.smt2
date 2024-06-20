; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70080 () Bool)

(assert start!70080)

(declare-fun b!316879 () Bool)

(declare-fun res!259959 () Bool)

(declare-fun e!227744 () Bool)

(assert (=> b!316879 (=> (not res!259959) (not e!227744))))

(declare-datatypes ((array!19578 0))(
  ( (array!19579 (arr!9596 (Array (_ BitVec 32) (_ BitVec 8))) (size!8510 (_ BitVec 32))) )
))
(declare-fun a1!731 () array!19578)

(declare-fun a2!731 () array!19578)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun bitAt!0 (array!19578 (_ BitVec 64)) Bool)

(assert (=> b!316879 (= res!259959 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun res!259958 () Bool)

(assert (=> start!70080 (=> (not res!259958) (not e!227744))))

(declare-fun from!848 () (_ BitVec 64))

(assert (=> start!70080 (= res!259958 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8510 a1!731) (size!8510 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8510 a1!731))))))))

(assert (=> start!70080 e!227744))

(assert (=> start!70080 true))

(declare-fun array_inv!8062 (array!19578) Bool)

(assert (=> start!70080 (array_inv!8062 a1!731)))

(assert (=> start!70080 (array_inv!8062 a2!731)))

(declare-fun b!316878 () Bool)

(declare-fun res!259960 () Bool)

(assert (=> b!316878 (=> (not res!259960) (not e!227744))))

(declare-fun arrayBitRangesEq!0 (array!19578 array!19578 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316878 (= res!259960 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316881 () Bool)

(assert (=> b!316881 (= e!227744 (not true))))

(assert (=> b!316881 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21745 0))(
  ( (Unit!21746) )
))
(declare-fun lt!443066 () Unit!21745)

(declare-fun rec!18 (array!19578 array!19578 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21745)

(assert (=> b!316881 (= lt!443066 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun b!316880 () Bool)

(declare-fun res!259961 () Bool)

(assert (=> b!316880 (=> (not res!259961) (not e!227744))))

(assert (=> b!316880 (= res!259961 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(assert (= (and start!70080 res!259958) b!316878))

(assert (= (and b!316878 res!259960) b!316879))

(assert (= (and b!316879 res!259959) b!316880))

(assert (= (and b!316880 res!259961) b!316881))

(declare-fun m!454875 () Bool)

(assert (=> b!316881 m!454875))

(declare-fun m!454877 () Bool)

(assert (=> b!316881 m!454877))

(declare-fun m!454879 () Bool)

(assert (=> b!316878 m!454879))

(declare-fun m!454881 () Bool)

(assert (=> b!316880 m!454881))

(declare-fun m!454883 () Bool)

(assert (=> b!316879 m!454883))

(declare-fun m!454885 () Bool)

(assert (=> b!316879 m!454885))

(declare-fun m!454887 () Bool)

(assert (=> start!70080 m!454887))

(declare-fun m!454889 () Bool)

(assert (=> start!70080 m!454889))

(check-sat (not b!316879) (not b!316880) (not start!70080) (not b!316878) (not b!316881))
