; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70076 () Bool)

(assert start!70076)

(declare-fun res!259936 () Bool)

(declare-fun e!227727 () Bool)

(assert (=> start!70076 (=> (not res!259936) (not e!227727))))

(declare-datatypes ((array!19574 0))(
  ( (array!19575 (arr!9594 (Array (_ BitVec 32) (_ BitVec 8))) (size!8508 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19574)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19574)

(assert (=> start!70076 (= res!259936 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8508 a1!731) (size!8508 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8508 a1!731))))))))

(assert (=> start!70076 e!227727))

(assert (=> start!70076 true))

(declare-fun array_inv!8060 (array!19574) Bool)

(assert (=> start!70076 (array_inv!8060 a1!731)))

(assert (=> start!70076 (array_inv!8060 a2!731)))

(declare-fun b!316856 () Bool)

(declare-fun res!259935 () Bool)

(assert (=> b!316856 (=> (not res!259935) (not e!227727))))

(declare-fun arrayBitRangesEq!0 (array!19574 array!19574 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316856 (= res!259935 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(declare-fun b!316854 () Bool)

(declare-fun res!259934 () Bool)

(assert (=> b!316854 (=> (not res!259934) (not e!227727))))

(assert (=> b!316854 (= res!259934 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316855 () Bool)

(declare-fun res!259937 () Bool)

(assert (=> b!316855 (=> (not res!259937) (not e!227727))))

(declare-fun bitAt!0 (array!19574 (_ BitVec 64)) Bool)

(assert (=> b!316855 (= res!259937 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun b!316857 () Bool)

(assert (=> b!316857 (= e!227727 (not (or (not (= (bvand to!815 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!316857 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21741 0))(
  ( (Unit!21742) )
))
(declare-fun lt!443060 () Unit!21741)

(declare-fun rec!18 (array!19574 array!19574 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21741)

(assert (=> b!316857 (= lt!443060 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(assert (= (and start!70076 res!259936) b!316854))

(assert (= (and b!316854 res!259934) b!316855))

(assert (= (and b!316855 res!259937) b!316856))

(assert (= (and b!316856 res!259935) b!316857))

(declare-fun m!454843 () Bool)

(assert (=> b!316855 m!454843))

(declare-fun m!454845 () Bool)

(assert (=> b!316855 m!454845))

(declare-fun m!454847 () Bool)

(assert (=> start!70076 m!454847))

(declare-fun m!454849 () Bool)

(assert (=> start!70076 m!454849))

(declare-fun m!454851 () Bool)

(assert (=> b!316854 m!454851))

(declare-fun m!454853 () Bool)

(assert (=> b!316856 m!454853))

(declare-fun m!454855 () Bool)

(assert (=> b!316857 m!454855))

(declare-fun m!454857 () Bool)

(assert (=> b!316857 m!454857))

(push 1)

