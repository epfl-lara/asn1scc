; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70072 () Bool)

(assert start!70072)

(declare-fun b!316831 () Bool)

(declare-fun res!259911 () Bool)

(declare-fun e!227709 () Bool)

(assert (=> b!316831 (=> (not res!259911) (not e!227709))))

(declare-datatypes ((array!19570 0))(
  ( (array!19571 (arr!9592 (Array (_ BitVec 32) (_ BitVec 8))) (size!8506 (_ BitVec 32))) )
))
(declare-fun a1!731 () array!19570)

(declare-fun a2!731 () array!19570)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun bitAt!0 (array!19570 (_ BitVec 64)) Bool)

(assert (=> b!316831 (= res!259911 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(declare-fun res!259910 () Bool)

(assert (=> start!70072 (=> (not res!259910) (not e!227709))))

(declare-fun from!848 () (_ BitVec 64))

(assert (=> start!70072 (= res!259910 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8506 a1!731) (size!8506 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8506 a1!731))))))))

(assert (=> start!70072 e!227709))

(assert (=> start!70072 true))

(declare-fun array_inv!8058 (array!19570) Bool)

(assert (=> start!70072 (array_inv!8058 a1!731)))

(assert (=> start!70072 (array_inv!8058 a2!731)))

(declare-fun b!316833 () Bool)

(assert (=> b!316833 (= e!227709 (not (or (not (= (bvand to!815 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun arrayBitRangesEq!0 (array!19570 array!19570 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316833 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21737 0))(
  ( (Unit!21738) )
))
(declare-fun lt!443054 () Unit!21737)

(declare-fun rec!18 (array!19570 array!19570 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21737)

(assert (=> b!316833 (= lt!443054 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun b!316830 () Bool)

(declare-fun res!259912 () Bool)

(assert (=> b!316830 (=> (not res!259912) (not e!227709))))

(assert (=> b!316830 (= res!259912 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316832 () Bool)

(declare-fun res!259913 () Bool)

(assert (=> b!316832 (=> (not res!259913) (not e!227709))))

(assert (=> b!316832 (= res!259913 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(assert (= (and start!70072 res!259910) b!316830))

(assert (= (and b!316830 res!259912) b!316831))

(assert (= (and b!316831 res!259911) b!316832))

(assert (= (and b!316832 res!259913) b!316833))

(declare-fun m!454811 () Bool)

(assert (=> b!316830 m!454811))

(declare-fun m!454813 () Bool)

(assert (=> b!316832 m!454813))

(declare-fun m!454815 () Bool)

(assert (=> b!316833 m!454815))

(declare-fun m!454817 () Bool)

(assert (=> b!316833 m!454817))

(declare-fun m!454819 () Bool)

(assert (=> start!70072 m!454819))

(declare-fun m!454821 () Bool)

(assert (=> start!70072 m!454821))

(declare-fun m!454823 () Bool)

(assert (=> b!316831 m!454823))

(declare-fun m!454825 () Bool)

(assert (=> b!316831 m!454825))

(push 1)

(assert (not b!316832))

(assert (not b!316831))

(assert (not start!70072))

(assert (not b!316833))

(assert (not b!316830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

