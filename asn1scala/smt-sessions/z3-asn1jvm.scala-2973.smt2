; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70074 () Bool)

(assert start!70074)

(declare-fun res!259925 () Bool)

(declare-fun e!227719 () Bool)

(assert (=> start!70074 (=> (not res!259925) (not e!227719))))

(declare-datatypes ((array!19572 0))(
  ( (array!19573 (arr!9593 (Array (_ BitVec 32) (_ BitVec 8))) (size!8507 (_ BitVec 32))) )
))
(declare-fun a2!731 () array!19572)

(declare-fun to!815 () (_ BitVec 64))

(declare-fun from!848 () (_ BitVec 64))

(declare-fun a1!731 () array!19572)

(assert (=> start!70074 (= res!259925 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!848) (bvsle from!848 to!815) (= (size!8507 a1!731) (size!8507 a2!731)) (bvslt to!815 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8507 a1!731))))))))

(assert (=> start!70074 e!227719))

(assert (=> start!70074 true))

(declare-fun array_inv!8059 (array!19572) Bool)

(assert (=> start!70074 (array_inv!8059 a1!731)))

(assert (=> start!70074 (array_inv!8059 a2!731)))

(declare-fun b!316842 () Bool)

(declare-fun res!259922 () Bool)

(assert (=> b!316842 (=> (not res!259922) (not e!227719))))

(declare-fun arrayBitRangesEq!0 (array!19572 array!19572 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316842 (= res!259922 (arrayBitRangesEq!0 a1!731 a2!731 from!848 to!815))))

(declare-fun b!316844 () Bool)

(declare-fun res!259923 () Bool)

(assert (=> b!316844 (=> (not res!259923) (not e!227719))))

(assert (=> b!316844 (= res!259923 (arrayBitRangesEq!0 a1!731 a2!731 to!815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815)))))

(declare-fun b!316845 () Bool)

(assert (=> b!316845 (= e!227719 (not (or (not (= (bvand to!815 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!316845 (arrayBitRangesEq!0 a1!731 a2!731 from!848 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 to!815))))

(declare-datatypes ((Unit!21739 0))(
  ( (Unit!21740) )
))
(declare-fun lt!443057 () Unit!21739)

(declare-fun rec!18 (array!19572 array!19572 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21739)

(assert (=> b!316845 (= lt!443057 (rec!18 a1!731 a2!731 from!848 to!815 to!815))))

(declare-fun b!316843 () Bool)

(declare-fun res!259924 () Bool)

(assert (=> b!316843 (=> (not res!259924) (not e!227719))))

(declare-fun bitAt!0 (array!19572 (_ BitVec 64)) Bool)

(assert (=> b!316843 (= res!259924 (= (bitAt!0 a1!731 to!815) (bitAt!0 a2!731 to!815)))))

(assert (= (and start!70074 res!259925) b!316842))

(assert (= (and b!316842 res!259922) b!316843))

(assert (= (and b!316843 res!259924) b!316844))

(assert (= (and b!316844 res!259923) b!316845))

(declare-fun m!454827 () Bool)

(assert (=> start!70074 m!454827))

(declare-fun m!454829 () Bool)

(assert (=> start!70074 m!454829))

(declare-fun m!454831 () Bool)

(assert (=> b!316845 m!454831))

(declare-fun m!454833 () Bool)

(assert (=> b!316845 m!454833))

(declare-fun m!454835 () Bool)

(assert (=> b!316844 m!454835))

(declare-fun m!454837 () Bool)

(assert (=> b!316843 m!454837))

(declare-fun m!454839 () Bool)

(assert (=> b!316843 m!454839))

(declare-fun m!454841 () Bool)

(assert (=> b!316842 m!454841))

(check-sat (not b!316843) (not b!316845) (not b!316844) (not b!316842) (not start!70074))
(check-sat)
