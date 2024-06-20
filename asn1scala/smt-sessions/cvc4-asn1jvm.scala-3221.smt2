; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73622 () Bool)

(assert start!73622)

(declare-fun res!267579 () Bool)

(declare-fun e!235124 () Bool)

(assert (=> start!73622 (=> (not res!267579) (not e!235124))))

(declare-fun i!1031 () (_ BitVec 64))

(assert (=> start!73622 (= res!267579 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 i!1031))))

(assert (=> start!73622 e!235124))

(assert (=> start!73622 true))

(declare-datatypes ((array!21114 0))(
  ( (array!21115 (arr!10257 (Array (_ BitVec 32) (_ BitVec 8))) (size!9165 (_ BitVec 32))) )
))
(declare-fun a!445 () array!21114)

(declare-fun array_inv!8717 (array!21114) Bool)

(assert (=> start!73622 (array_inv!8717 a!445)))

(declare-fun b!325982 () Bool)

(declare-fun e!235125 () Bool)

(assert (=> b!325982 (= e!235124 e!235125)))

(declare-fun res!267580 () Bool)

(assert (=> b!325982 (=> (not res!267580) (not e!235125))))

(declare-fun lt!448388 () (_ BitVec 64))

(assert (=> b!325982 (= res!267580 (bvsle i!1031 lt!448388))))

(assert (=> b!325982 (= lt!448388 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!9165 a!445))))))

(declare-fun b!325983 () Bool)

(declare-fun res!267578 () Bool)

(assert (=> b!325983 (=> (not res!267578) (not e!235125))))

(declare-fun arrayBitRangesEq!0 (array!21114 array!21114 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!325983 (= res!267578 (arrayBitRangesEq!0 a!445 a!445 i!1031 lt!448388))))

(declare-fun b!325984 () Bool)

(assert (=> b!325984 (= e!235125 (and (not (= i!1031 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1031 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand i!1031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub i!1031 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73622 res!267579) b!325982))

(assert (= (and b!325982 res!267580) b!325983))

(assert (= (and b!325983 res!267578) b!325984))

(declare-fun m!463797 () Bool)

(assert (=> start!73622 m!463797))

(declare-fun m!463799 () Bool)

(assert (=> b!325983 m!463799))

(push 1)

(assert (not start!73622))

(assert (not b!325983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

