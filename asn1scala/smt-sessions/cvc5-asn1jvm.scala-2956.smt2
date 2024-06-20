; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69934 () Bool)

(assert start!69934)

(declare-fun b!315866 () Bool)

(declare-fun res!258974 () Bool)

(declare-fun e!227075 () Bool)

(assert (=> b!315866 (=> (not res!258974) (not e!227075))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!315866 (= res!258974 (not (= i!1020 mid!82)))))

(declare-fun b!315867 () Bool)

(declare-fun res!258971 () Bool)

(assert (=> b!315867 (=> (not res!258971) (not e!227075))))

(declare-datatypes ((array!19465 0))(
  ( (array!19466 (arr!9538 (Array (_ BitVec 32) (_ BitVec 8))) (size!8455 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19465)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19465)

(declare-fun arrayBitRangesEq!0 (array!19465 array!19465 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315867 (= res!258971 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315868 () Bool)

(assert (=> b!315868 (= e!227075 (not true))))

(declare-fun a1!825 () array!19465)

(assert (=> b!315868 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21665 0))(
  ( (Unit!21666) )
))
(declare-fun lt!442750 () Unit!21665)

(declare-fun arrayBitRangesEqDrop1!0 (array!19465 array!19465 (_ BitVec 64) (_ BitVec 64)) Unit!21665)

(assert (=> b!315868 (= lt!442750 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!315868 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442751 () Unit!21665)

(declare-fun arrayBitRangesEqAppend!0 (array!19465 array!19465 (_ BitVec 64) (_ BitVec 64)) Unit!21665)

(assert (=> b!315868 (= lt!442751 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315869 () Bool)

(declare-fun res!258970 () Bool)

(assert (=> b!315869 (=> (not res!258970) (not e!227075))))

(assert (=> b!315869 (= res!258970 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315870 () Bool)

(declare-fun res!258977 () Bool)

(assert (=> b!315870 (=> (not res!258977) (not e!227075))))

(assert (=> b!315870 (= res!258977 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315871 () Bool)

(declare-fun res!258973 () Bool)

(assert (=> b!315871 (=> (not res!258973) (not e!227075))))

(assert (=> b!315871 (= res!258973 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315872 () Bool)

(declare-fun res!258975 () Bool)

(assert (=> b!315872 (=> (not res!258975) (not e!227075))))

(assert (=> b!315872 (= res!258975 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!258972 () Bool)

(assert (=> start!69934 (=> (not res!258972) (not e!227075))))

(assert (=> start!69934 (= res!258972 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8455 a1!825) (size!8455 a2!825)) (= (size!8455 a2!825) (size!8455 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8455 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8455 a2!825))))))))

(assert (=> start!69934 e!227075))

(assert (=> start!69934 true))

(declare-fun array_inv!8007 (array!19465) Bool)

(assert (=> start!69934 (array_inv!8007 a1!825)))

(assert (=> start!69934 (array_inv!8007 a3!79)))

(assert (=> start!69934 (array_inv!8007 a2!825)))

(declare-fun b!315873 () Bool)

(declare-fun res!258976 () Bool)

(assert (=> b!315873 (=> (not res!258976) (not e!227075))))

(assert (=> b!315873 (= res!258976 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(assert (= (and start!69934 res!258972) b!315870))

(assert (= (and b!315870 res!258977) b!315867))

(assert (= (and b!315867 res!258971) b!315873))

(assert (= (and b!315873 res!258976) b!315871))

(assert (= (and b!315871 res!258973) b!315872))

(assert (= (and b!315872 res!258975) b!315869))

(assert (= (and b!315869 res!258970) b!315866))

(assert (= (and b!315866 res!258974) b!315868))

(declare-fun m!453611 () Bool)

(assert (=> b!315871 m!453611))

(declare-fun m!453613 () Bool)

(assert (=> b!315872 m!453613))

(declare-fun m!453615 () Bool)

(assert (=> b!315867 m!453615))

(declare-fun m!453617 () Bool)

(assert (=> start!69934 m!453617))

(declare-fun m!453619 () Bool)

(assert (=> start!69934 m!453619))

(declare-fun m!453621 () Bool)

(assert (=> start!69934 m!453621))

(declare-fun m!453623 () Bool)

(assert (=> b!315869 m!453623))

(declare-fun m!453625 () Bool)

(assert (=> b!315870 m!453625))

(declare-fun m!453627 () Bool)

(assert (=> b!315868 m!453627))

(declare-fun m!453629 () Bool)

(assert (=> b!315868 m!453629))

(declare-fun m!453631 () Bool)

(assert (=> b!315868 m!453631))

(declare-fun m!453633 () Bool)

(assert (=> b!315868 m!453633))

(push 1)

(assert (not b!315867))

(assert (not b!315868))

(assert (not b!315869))

(assert (not b!315871))

(assert (not b!315870))

(assert (not start!69934))

(assert (not b!315872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

