; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70394 () Bool)

(assert start!70394)

(declare-fun b!318869 () Bool)

(declare-fun res!261927 () Bool)

(declare-fun e!229127 () Bool)

(assert (=> b!318869 (=> (not res!261927) (not e!229127))))

(declare-datatypes ((array!19859 0))(
  ( (array!19860 (arr!9738 (Array (_ BitVec 32) (_ BitVec 8))) (size!8649 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19859)

(declare-fun a2!909 () array!19859)

(declare-fun from!902 () (_ BitVec 64))

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19859 array!19859 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318869 (= res!261927 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun b!318872 () Bool)

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!318872 (= e!229127 (and (= i!1041 at!309) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvsge at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8649 a2!909)))))))))

(declare-fun res!261928 () Bool)

(assert (=> start!70394 (=> (not res!261928) (not e!229127))))

(assert (=> start!70394 (= res!261928 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8649 a1!909) (size!8649 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8649 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70394 e!229127))

(assert (=> start!70394 true))

(declare-fun array_inv!8201 (array!19859) Bool)

(assert (=> start!70394 (array_inv!8201 a1!909)))

(assert (=> start!70394 (array_inv!8201 a2!909)))

(declare-fun b!318871 () Bool)

(declare-fun res!261925 () Bool)

(assert (=> b!318871 (=> (not res!261925) (not e!229127))))

(assert (=> b!318871 (= res!261925 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318870 () Bool)

(declare-fun res!261926 () Bool)

(assert (=> b!318870 (=> (not res!261926) (not e!229127))))

(assert (=> b!318870 (= res!261926 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(assert (= (and start!70394 res!261928) b!318869))

(assert (= (and b!318869 res!261927) b!318870))

(assert (= (and b!318870 res!261926) b!318871))

(assert (= (and b!318871 res!261925) b!318872))

(declare-fun m!457113 () Bool)

(assert (=> b!318869 m!457113))

(declare-fun m!457115 () Bool)

(assert (=> start!70394 m!457115))

(declare-fun m!457117 () Bool)

(assert (=> start!70394 m!457117))

(declare-fun m!457119 () Bool)

(assert (=> b!318871 m!457119))

(push 1)

(assert (not b!318871))

(assert (not start!70394))

(assert (not b!318869))

(check-sat)

(pop 1)

(push 1)

(check-sat)

