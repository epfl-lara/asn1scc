; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73672 () Bool)

(assert start!73672)

(declare-fun b!326219 () Bool)

(declare-fun e!235317 () Bool)

(declare-fun e!235319 () Bool)

(assert (=> b!326219 (= e!235317 e!235319)))

(declare-fun res!267792 () Bool)

(assert (=> b!326219 (=> (not res!267792) (not e!235319))))

(declare-fun i!1031 () (_ BitVec 64))

(declare-fun lt!448457 () (_ BitVec 64))

(assert (=> b!326219 (= res!267792 (bvsle i!1031 lt!448457))))

(declare-datatypes ((array!21137 0))(
  ( (array!21138 (arr!10267 (Array (_ BitVec 32) (_ BitVec 8))) (size!9175 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21137)

(assert (=> b!326219 (= lt!448457 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9175 a!445))))))

(declare-fun b!326220 () Bool)

(assert (=> b!326220 (= e!235319 (not (or (= ((_ sign_extend 32) (size!9175 a!445)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!448457 ((_ sign_extend 32) (size!9175 a!445)))))))))

(declare-fun arrayBitRangesEq!0 (array!21137 array!21137 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!326220 (arrayBitRangesEq!0 a!445 a!445 #b0000000000000000000000000000000000000000000000000000000000000000 lt!448457)))

(declare-datatypes ((Unit!22116 0))(
  ( (Unit!22117) )
))
(declare-fun lt!448456 () Unit!22116)

(declare-fun rec!21 (array!21137 (_ BitVec 64)) Unit!22116)

(assert (=> b!326220 (= lt!448456 (rec!21 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!267794 () Bool)

(assert (=> start!73672 (=> (not res!267794) (not e!235317))))

(assert (=> start!73672 (= res!267794 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73672 e!235317))

(assert (=> start!73672 true))

(declare-fun array_inv!8727 (array!21137) Bool)

(assert (=> start!73672 (array_inv!8727 a!445)))

(declare-fun b!326221 () Bool)

(declare-fun res!267793 () Bool)

(assert (=> b!326221 (=> (not res!267793) (not e!235319))))

(assert (=> b!326221 (= res!267793 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448457))))

(declare-fun b!326222 () Bool)

(declare-fun res!267795 () Bool)

(assert (=> b!326222 (=> (not res!267795) (not e!235319))))

(assert (=> b!326222 (= res!267795 (arrayBitRangesEq!0 a!445 a!445 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448457))))

(declare-fun b!326223 () Bool)

(declare-fun res!267791 () Bool)

(assert (=> b!326223 (=> (not res!267791) (not e!235319))))

(assert (=> b!326223 (= res!267791 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsle (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) lt!448457)))))

(assert (= (and start!73672 res!267794) b!326219))

(assert (= (and b!326219 res!267792) b!326221))

(assert (= (and b!326221 res!267793) b!326223))

(assert (= (and b!326223 res!267791) b!326222))

(assert (= (and b!326222 res!267795) b!326220))

(declare-fun m!464003 () Bool)

(assert (=> b!326220 m!464003))

(declare-fun m!464005 () Bool)

(assert (=> b!326220 m!464005))

(declare-fun m!464007 () Bool)

(assert (=> start!73672 m!464007))

(declare-fun m!464009 () Bool)

(assert (=> b!326221 m!464009))

(declare-fun m!464011 () Bool)

(assert (=> b!326222 m!464011))

(push 1)

(assert (not b!326221))

(assert (not start!73672))

(assert (not b!326220))

(assert (not b!326222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

