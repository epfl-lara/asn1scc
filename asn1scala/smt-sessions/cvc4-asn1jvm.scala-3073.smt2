; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70902 () Bool)

(assert start!70902)

(declare-fun res!263373 () Bool)

(declare-fun e!230708 () Bool)

(assert (=> start!70902 (=> (not res!263373) (not e!230708))))

(declare-fun lt!444032 () (_ BitVec 64))

(assert (=> start!70902 (= res!263373 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444032))))

(declare-datatypes ((array!20185 0))(
  ( (array!20186 (arr!9891 (Array (_ BitVec 32) (_ BitVec 8))) (size!8799 (_ BitVec 32))) )
))
(declare-fun a!440 () array!20185)

(assert (=> start!70902 (= lt!444032 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8799 a!440))))))

(assert (=> start!70902 e!230708))

(declare-fun array_inv!8351 (array!20185) Bool)

(assert (=> start!70902 (array_inv!8351 a!440)))

(declare-fun b!320589 () Bool)

(declare-fun res!263374 () Bool)

(assert (=> b!320589 (=> (not res!263374) (not e!230708))))

(declare-fun arrayBitRangesEq!0 (array!20185 array!20185 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320589 (= res!263374 (arrayBitRangesEq!0 a!440 a!440 lt!444032 lt!444032))))

(declare-fun b!320590 () Bool)

(assert (=> b!320590 (= e!230708 (not true))))

(assert (=> b!320590 (arrayBitRangesEq!0 a!440 a!440 #b0000000000000000000000000000000000000000000000000000000000000000 lt!444032)))

(declare-datatypes ((Unit!21978 0))(
  ( (Unit!21979) )
))
(declare-fun lt!444031 () Unit!21978)

(declare-fun rec!21 (array!20185 (_ BitVec 64)) Unit!21978)

(assert (=> b!320590 (= lt!444031 (rec!21 a!440 lt!444032))))

(assert (= (and start!70902 res!263373) b!320589))

(assert (= (and b!320589 res!263374) b!320590))

(declare-fun m!458945 () Bool)

(assert (=> start!70902 m!458945))

(declare-fun m!458947 () Bool)

(assert (=> b!320589 m!458947))

(declare-fun m!458949 () Bool)

(assert (=> b!320590 m!458949))

(declare-fun m!458951 () Bool)

(assert (=> b!320590 m!458951))

(push 1)

(assert (not b!320590))

(assert (not start!70902))

(assert (not b!320589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

